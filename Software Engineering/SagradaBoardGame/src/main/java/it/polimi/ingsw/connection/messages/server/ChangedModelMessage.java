package it.polimi.ingsw.connection.messages.server;

import it.polimi.ingsw.client.view.viewelements.ViewComponent;
import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.connection.client.AbstractServerHandler;
import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.*;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Couple;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * Message that notifies the model changed and encapsulates changes inside
 */
public class ChangedModelMessage extends AbstractServerMessage {
    private static final String MESSAGE_TYPE = "change";
    private Couple<String, ViewComponent[]>[] playerBoardCouples;
    private Couple<String, Integer>[] playersFavours;
    private int[] toolFavours;
    private ViewComponent[] pool;
    private ViewComponent[] roundtrack;
    private ViewComponent[] currentPlayerHand;
    private String bagOwner;
    private String currentPlayer;
    private int choiceID;



    public ChangedModelMessage() {
        super(MESSAGE_TYPE);
    }

    /**
     * Build a full change message for a specific user, based on an already built table with the player passed inside
     * @param table
     */
    public ChangedModelMessage(Table table, GameManager gm) {
        super(MESSAGE_TYPE);

        //add each player and its board ID
        fillPlayerBoardCouples(table);

        //set player's favours
        fillPlayerFavours(table);


        //add tools
        toolFavours = new int[table.getToolCards().size()];
        for (int i = 0; i < toolFavours.length; i++) {
            toolFavours[i] = table.getFavoursPoints(i+1);
        }

        //set the bag owner player
        bagOwner = table.getFirstPlayer();

        //set the pool
        fillPool(table);

        //set the roundtrack
        fillRoundTrack(table);


        currentPlayer = gm.getFlow().getMicroOperationVariables().getCurrentPlayer().orElseThrow(CantAccessPlayerException::new).getName();

        //set the die in current player's hand
        List<Die> dice = table.getPlayer(currentPlayer).getAll();
        currentPlayerHand = new ViewComponent[dice.size()];

        for (int i = 0; i < currentPlayerHand.length; i++) {
            currentPlayerHand[i] = viewComponentFromDie(dice.get(i));
        }


        //set the choice if there is one
        choiceID = gm.getFlow().getMicroOperationVariables().getSchema();
    }






    /**
     * Setup the client UIGame
     * NOTE: there must not be null parameters
     * @param ash the Server Handler used to do the operation
     */
    @Override
    public void doOperation(AbstractServerHandler ash) {
        setUpPlayers();
        setUpPool();
        setUpRoundTrack();
        setUpBagOwner();
        setUpToolFavours();
        setUpPlayerHand();

        UIManager.instance().getUIGame().changedCurrentPlayer(currentPlayer);
        UIManager.instance().getUIGame().setChoice(choiceID);

        UIManager.instance().getUIGame().notifyChanged();
    }

    ////////////PRIVATE UTILITIES



    private void setUpPlayers() {
        //then set up all boards
        for (int i = 0; i < playerBoardCouples.length; i++) {
            changeBoard(playerBoardCouples[i].getFirst(), playerBoardCouples[i].getSecond());
        }
        //then set up their favours
        for (int i = 0; i < playersFavours.length; i++) {
            UIManager.instance().getUIGame().changedUserFavours(playersFavours[i].getFirst(), playersFavours[i].getSecond());
        }

    }

    private void setUpPool() {
        for (int i = 0; i < pool.length; i++) {
            UIManager.instance().getUIGame().changedPool(i+1, pool[i]);
        }
    }

    private void setUpRoundTrack() {
        for (int i = 0; i < roundtrack.length && i < UIManager.instance().getUIGame().getRoundtrack().getMaxId(); i++) {
            UIManager.instance().getUIGame().getRoundtrack().setDie(i+1,
                    roundtrack[i] == null ? new ViewComponent(Color.NONE, Number.NONE) : roundtrack[i]);
        }
    }

    private void setUpToolFavours() {
        for (int i = 0; i < toolFavours.length && i < UIManager.instance().getUIGame().getToolcards().length; i++) {
            UIManager.instance().getUIGame().changedToolCardFavours(i+1, toolFavours[i]);
        }
    }


    private void setUpPlayerHand() {
        UIManager.instance().getUIGame().changedCurrentPlayerHand(Arrays.asList(currentPlayerHand));
    }


    private void fillPlayerBoardCouples(Table table) {
        playerBoardCouples = new Couple[table.getPlayers().size()];
        for (int i = 0; i < playerBoardCouples.length; i++) {
            //build the "viewBoard":
            ViewComponent[] viewBoard = new ViewComponent[20];
            for (int j = 0; j < 4; j++) {
                for (int k = 0; k < 5; k++) {
                    ViewComponent vc;
                    Optional<Die> d = table.getPlayer(table.getPlayers().get(i).getName()).getBoard().getCell(k, j).getDie();
                    if (d.isPresent())
                        vc = new ViewComponent(d.get().getColor(), d.get().getValue());
                    else
                        vc = new ViewComponent(Color.NONE, Number.NONE);
                    viewBoard[k+j*5] = vc;
                }
            }
            //add the viewBoard to the couples
            playerBoardCouples[i] =
                    new Couple<>(table.getPlayers().get(i).getName(),
                            viewBoard);
        }
    }

    private void fillPlayerFavours(Table table) {
        playersFavours = new Couple[table.getPlayers().size()];
        for (int i = 0; i < table.getPlayers().size(); i++) {
            playersFavours[i] = new Couple<>(table.getPlayers().get(i).getName(),table.getPlayers().get(i).getFavourPoints());
        }
    }


    private void fillPool(Table table) {
        pool = new ViewComponent[9];
        for (int i = 0; i < 9; i++) {
            if (i < table.getPool().getAll().size()) {
                pool[i] = new ViewComponent(table.getPool().getAll().get(i).getColor(),
                        table.getPool().getAll().get(i).getValue());
            } else {
                pool[i] = new ViewComponent(Color.NONE, Number.NONE);
            }
        }
    }


    private void fillRoundTrack(Table table) {
        roundtrack = new ViewComponent[90];
        List<Die> roundDice;
        int rounds = ModelGlobals.numOfRounds();

        for (int i = 0; i < rounds; i++) {
            roundDice = table.getRoundTrack().getDice(i);
            for (int j = 0; j < roundDice.size(); j++) {
                roundtrack[(j*rounds) + i] = viewComponentFromDie(roundDice.get(j));
            }
        }
    }

    private ViewComponent viewComponentFromDie(Die die) {
        return new ViewComponent(die.getColor(), die.getValue());
    }

    /**
     * Change the board in the UIGame of the UIManager on client
     * @param player
     */
    private static void changeBoard(String player, ViewComponent[] viewBoard) {
        //for each cell in the board, build a new ViewComponent from that cell, then substitute it in the target ViewBoard
        for (int i = 0; i < 20; i++) {
            UIManager.instance().getUIGame().changedCellDie(player, i+1, viewBoard[i]);
        }
    }


    /**
     * set up the first player, who has the bag
     */
    private void setUpBagOwner() {
        UIManager.instance().getUIGame().changedDiceBagOwner(bagOwner);
    }

    ////////////GETTERS/SETTERS

    public int[] getTools() {
        return toolFavours;
    }

    public void setTools(int[] tools) {
        this.toolFavours = tools;
    }



    public String getBagOwner() {
        return bagOwner;
    }

    public void setBagOwner(String bagOwner) {
        this.bagOwner = bagOwner;
    }
}
