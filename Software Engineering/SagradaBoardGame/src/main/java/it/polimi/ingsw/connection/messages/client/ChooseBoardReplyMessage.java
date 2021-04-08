package it.polimi.ingsw.connection.messages.client;

import it.polimi.ingsw.connection.server.ClientDispatcher;
import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;

/**
 * Message representing the user's choice in reply of a choose board phase
 */
public class ChooseBoardReplyMessage extends AbstractClientMessage {
    private int choice;
    private static final String MESSAGETYPE = "reply_choose";

    public ChooseBoardReplyMessage() {
        super(MESSAGETYPE);
    }

    /**
     * @param choice the choice made. must go from 1 to 4
     */
    public ChooseBoardReplyMessage(int choice) {
        super(MESSAGETYPE);
        this.choice = choice;
    }

    /**
     * Notify the corresponding game that this user chose a board
     * @param ach the Client Handler used to do the operation
     */
    @Override
    public void doOperation(AbstractClientHandler ach) {
        ClientDispatcher.instance().getGameOf(ach.getUsername()).getBoardPhaseManager().setUserChoice(ach.getUsername(), choice);
    }
}
