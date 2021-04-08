package it.polimi.ingsw.connection.server.clienthandlers;

import it.polimi.ingsw.connection.messages.client.AbstractClientMessage;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * RMI Interface for a client handler. Must be able to receive AbstractClientMessages
 */
public interface IRMIClientHandler extends Remote {


    void receiveMessage(AbstractClientMessage message) throws RemoteException;
}
