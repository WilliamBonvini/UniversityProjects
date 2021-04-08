package it.polimi.ingsw.connection.messages.server;

import it.polimi.ingsw.client.view.viewelements.ViewComponent;
import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.connection.client.AbstractServerHandler;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.*;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.factories.BoardFactory;

import java.util.NoSuchElementException;

/**
 * Message that notifies a user that is started the choose board phase
 */
public class ChooseBoardMessage extends AbstractServerMessage {
    private static final String MESSAGE_TYPE = "choose_board";
    private int[] boardsIds;

    public ChooseBoardMessage() {
        super(MESSAGE_TYPE);
    }

    /**
     * Create with an array of boards ids, to send to the client
     * @param boardsIds
     */
    public ChooseBoardMessage(int[] boardsIds) {
        super(MESSAGE_TYPE);
        this.boardsIds = boardsIds;
    }


    @Override
    public void doOperation(AbstractServerHandler ash) {
        try { //setup the boards in the UIGame
            Board b;
            //set the num of players to 4 to make every board printed
            UIManager.instance().getUIGame().setNumOfPlayers(boardsIds.length);
            //set the name of the boards
            for (int i = 0; i < boardsIds.length; i++) {
                UIManager.instance().getUIGame()
                        .setBoardName(i+1, BoardFactory.getBoardByID(boardsIds[i]).getBoardName());
                UIManager.instance().getUIGame().getBoard(i+1).setFavours(BoardFactory.getBoardByID(boardsIds[i]).getFavourDifficulty());
            }
            //now sets the boards
            for (int i = 0; i < boardsIds.length; i++) {
                b = BoardFactory.getBoardByID(boardsIds[i]);
                changeBoard(b, b.getBoardName());
            }

        } catch (NoSuchElementException nsee) {
            UIManager.instance().getFocusUI().printMessage("Errore: il server ha inviato un ID sconosciuto per le vetrate!");
        }


        UIManager.instance().getUIGame().notifyChooseBoard();
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
                if(c.hasDie()) {
                    vc = new ViewComponent(c.getDie().orElse(new Die(Color.NONE, Number.NONE)).getColor(),
                            c.getDie().orElse(new Die(Color.NONE, Number.NONE)).getValue());
                }
                else
                    vc = new ViewComponent(Color.NONE, Number.NONE);


                UIManager.instance().getUIGame().changedCellDie(player, (i+ j*ModelGlobals.boardSizeX()) + 1, vc);
            }
        }
    }
}
