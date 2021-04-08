package it.polimi.ingsw.connection.messages.client;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;

import java.io.Serializable;

/**
 * Generic message generated from client
 */
public abstract class AbstractClientMessage implements Serializable{

    private final String type;

    public AbstractClientMessage(String type) {
        this.type = type;
    }

    /**
     * get the class-unique type of message
     * @return
     */
    public final String getType() {
        return type;
    }

    /**
     * do the operation associated with this type of message
     * @param ach the Client Handler used to do the operation
     */
    public abstract void doOperation(AbstractClientHandler ach);


}
