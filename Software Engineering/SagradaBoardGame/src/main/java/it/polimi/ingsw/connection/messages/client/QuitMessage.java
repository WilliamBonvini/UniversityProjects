package it.polimi.ingsw.connection.messages.client;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;

/**
 * Message which notifies the server that this client has disconnected
 */
public class QuitMessage extends AbstractClientMessage {
    private static final String MESSAGETYPE = "quit";

    public QuitMessage(){
        super(MESSAGETYPE);
    }

    @Override
    public void doOperation(AbstractClientHandler ach) {
        //do the quit operation only if this client handler has already logged
        if(ach.isLogged()) {
            //simply go offline for this user
            ach.goOffline();
        }
    }

}
