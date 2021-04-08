package it.polimi.ingsw.connection.client;

import it.polimi.ingsw.connection.messages.server.AbstractServerMessage;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * RMI interface. must be able to receive ServerMessages
 */
public interface IRMIServerHandler extends Remote {

    void receiveMessage(AbstractServerMessage message) throws RemoteException;


}
