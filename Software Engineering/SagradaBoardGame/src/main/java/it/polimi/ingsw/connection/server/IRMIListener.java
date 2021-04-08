package it.polimi.ingsw.connection.server;

import it.polimi.ingsw.connection.client.IRMIServerHandler;
import it.polimi.ingsw.connection.server.clienthandlers.IRMIClientHandler;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * public interface which listens for clients to register.
 */
public interface IRMIListener extends Remote {

    IRMIClientHandler register(IRMIServerHandler irmiServerHandler) throws RemoteException;


}
