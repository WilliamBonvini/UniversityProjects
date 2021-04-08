package it.polimi.ingsw.connection.messages.server;

import it.polimi.ingsw.client.view.viewelements.ViewComponent;
import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.connection.client.AbstractServerHandler;
import it.polimi.ingsw.exceptions.client.InvalidViewParameterException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.*;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.factories.BoardFactory;
import it.polimi.ingsw.utils.Couple;

/**
 * Notifies the user that setup is ready and send him a copy of model
 */
public class SetupMessage extends AbstractServerMessage {
    private static final String MESSAGE_TYPE = "setup";
    private Couple<String, Integer>[] playerBoardCouples;
    private int[] tools;
    private int[] publicObjectives;
    private int privateObjective;
    private int numOfPlayers;
    private String firstPlayer;
    private ViewComponent[] pool;



    public SetupMessage() {
        super(MESSAGE_TYPE);
    }

    /**
     * Build a setup message for a specific user, based on an already built table with the player passed inside
     * @param table
     * @param player
     */
    public SetupMessage(Table table, String player) {
        super(MESSAGE_TYPE);

        this.numOfPlayers = table.getPlayers().size();
        //add each player and its board ID
        playerBoardCouples = new Couple[table.getPlayers().size()];
        for (int i = 0; i < playerBoardCouples.length; i++) {
            playerBoardCouples[i] =
                    new Couple<>(table.getPlayers().get(i).getName(), table.getPlayers().get(i).getBoard().getId());
        }

        //add tools
        tools = new int[table.getToolCards().size()];
        for (int i = 0; i < tools.length; i++) {
            tools[i] = table.getToolCards().get(i);
        }

        //add public objectives
        publicObjectives = new int[table.getPublicObjectives().size()];
        for (int i = 0; i < publicObjectives.length; i++) {
            publicObjectives[i] = table.getPublicObjectives().get(i);
        }

        //add the private objective
        privateObjective = table.getPlayer(player).getPrivateObjective();

        //set the first player
        firstPlayer = table.getFirstPlayer();

        //set the pool
        pool = new ViewComponent[9];
        for (int i = 0; i < 9; i++) {
            if(i < table.getPool().getAll().size()) {
                pool[i] = new ViewComponent(table.getPool().getAll().get(i).getColor(),
                        table.getPool().getAll().get(i).getValue());
            } else {
                pool[i] = new ViewComponent(Color.NONE, Number.NONE);
            }
        }
    }


    /**
     * Setup the client UIGame
     * NOTE: there must not be null parameters
     * @param ash
     */
    @Override
    public void doOperation(AbstractServerHandler ash) {
        setUpPlayers();
        setUpTools();
        setUpObjectives();
        setUpFirstPlayer();
        setUpPool();
        UIManager.instance().getUIGame().notifySetup();
    }


    ////////////PRIVATE UTILITIES

    private void setUpPool() {
        for (int i = 0; i < pool.length; i++) {
            UIManager.instance().getUIGame().changedPool(i+1, pool[i]);
        }
    }

    private void setUpPlayers() {
        UIManager.instance().getUIGame().setNumOfPlayers(numOfPlayers);
        //first set up all names
        for (int i = 0; i < playerBoardCouples.length; i++) {
            UIManager.instance().getUIGame().setBoardName(i+1, playerBoardCouples[i].getFirst());
        }
        //then set up all boards
        for (int i = 0; i < playerBoardCouples.length; i++) {
            changeBoard(BoardFactory.getBoardByID(playerBoardCouples[i].getSecond()), playerBoardCouples[i].getFirst());
        }
    }

    /**
     * Change the board in the UIGame of the UIManager on client
     * @param b the board
     * @param player
     */
    private static void changeBoard(Board b, String player) {
        ViewComponent vc;
        Cell c;
        //for each cell in the board, build a new ViewComponent from that cell, then substitute it in the target ViewBoard
        for (int j = 0; j < ModelGlobals.boardSizeY(); j++) {
            for (int i = 0; i < ModelGlobals.boardSizeX(); i++) {

                c = b.getCell(i, j);
                vc = new ViewComponent(c.getColorConstraint(), c.getValueConstraint());

                //also, translate the coordinates of a board to the ID of the view
                UIManager.instance().getUIGame().changedCellConstraint(player, i + j*(ModelGlobals.boardSizeX()) + 1, vc);

                //update the die
                vc = new ViewComponent(c.getDie().orElse(new Die(Color.NONE, Number.NONE)).getColor(),
                        c.getDie().orElse(new Die(Color.NONE, Number.NONE)).getValue());

                UIManager.instance().getUIGame().changedCellDie(player, i+ j*ModelGlobals.boardSizeX() + 1, vc);
            }
        }

        //change the favours of a board
        UIManager.instance().getUIGame().changedUserFavours(player, b.getFavourDifficulty());
    }

    /**
     * set up the tools to the UIGame
     */
    private void setUpTools() {
        //should be 3
        try {
            for (int i = 1; i <= 3; i++) {
                UIManager.instance().getUIGame().setToolCard(i, tools[i-1]);
            }
        } catch (IndexOutOfBoundsException | InvalidViewParameterException e) {
            UIManager.instance().getFocusUI().printMessage("Mh... il server ha inviato piu' di 3 toolcard!");
        }

    }

    /**
     * set up the objectives to the UIGame
     */
    private void setUpObjectives() {
        //public objectives
        try {
            for (int i = 0; i < 3; i++) {
                UIManager.instance().getUIGame().setPublicObjective(i+1, publicObjectives[i]);
            }
        } catch (IndexOutOfBoundsException | InvalidViewParameterException e) {
            UIManager.instance().getFocusUI().printMessage("Mh... il server ha inviato piu' di 3 obiettivi pubblici!");
        }

        //private objective
        UIManager.instance().getUIGame().setPrivateObjective(privateObjective);
    }

    /**
     * set up the first player, who has the bag
     */
    private void setUpFirstPlayer() {
        UIManager.instance().getUIGame().changedDiceBagOwner(firstPlayer);
        UIManager.instance().getUIGame().changedCurrentPlayer(firstPlayer);
    }

}
