package it.polimi.ingsw.connection.messages.server;

import it.polimi.ingsw.connection.client.AbstractServerHandler;

/**
 * The message that keeps alive a connection, checking if the other side is still there
 */
public class ServerHeartBeatMessage extends AbstractServerMessage {
    private static final String MESSAGE_TYPE = "server_heart_beat";

    public ServerHeartBeatMessage() {
        super(MESSAGE_TYPE);
    }

    @Override
    public void doOperation(AbstractServerHandler ash) {
        ash.heartbeat();
    }

}
