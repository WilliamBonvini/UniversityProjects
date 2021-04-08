package it.polimi.ingsw.connection.messages.server;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.connection.client.AbstractServerHandler;
import it.polimi.ingsw.connection.client.ConnectionManager;

/**
 * Message which stores a general String message to send to a user
 */
public class GeneralMessage extends AbstractServerMessage {
    private static final String MESSAGE_TYPE = "message";
    private String actualmessage;

    public GeneralMessage(String actualmessage) {
        super(MESSAGE_TYPE);
        this.actualmessage = actualmessage;
    }


    /**
     * Make the user's UI print the message
     * @param ash the Server Handler used to do the operation
     */
    @Override
    public void doOperation(AbstractServerHandler ash) {
        //if the client is waiting for an answer, store the message. The client will retrieve it after
        if(ConnectionManager.instance().isWaitingForAnswer()) {
            ash.storeMessage(actualmessage);
        } else {
            UIManager.instance().getFocusUI().printMessage(actualmessage);
        }
    }


    public String getActualmessage() {
        return actualmessage;
    }

    public void setActualmessage(String actualmessage) {
        this.actualmessage = actualmessage;
    }
}
