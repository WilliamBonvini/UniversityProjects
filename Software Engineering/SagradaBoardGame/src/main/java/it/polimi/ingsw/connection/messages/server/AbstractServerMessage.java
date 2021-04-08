package it.polimi.ingsw.connection.messages.server;

import it.polimi.ingsw.connection.client.AbstractServerHandler;

import java.io.Serializable;

/**
 * General Message sent from server
 */
public abstract class AbstractServerMessage implements Serializable {
    private final String type;

    AbstractServerMessage(String type) {
        this.type = type;
    }

    /**
     * do the operation associated with the specific message
     * @param ash the Server Handler used to do the operation
     */
    public abstract void doOperation(AbstractServerHandler ash);

    /**
     * the specific type associated with a type of message
     * @return the type of message
     */
    public final String getType() {
        return type;
    }

}
