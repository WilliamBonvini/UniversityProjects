package it.polimi.ingsw.connection.messages.client;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;

/**
 * Message used to heartbeat a connection
 */
public class ClientHeartBeatMessage extends AbstractClientMessage {
    private static final String MESSAGETYPE = "client_heart_beat";

    public ClientHeartBeatMessage() {
        super(MESSAGETYPE);
    }

    /**
     * notify the heartbeat
     * @param ach the Client Handler used to do the operation
     */
    @Override
    public void doOperation(AbstractClientHandler ach) {
        ach.heartbeat();
    }

}
