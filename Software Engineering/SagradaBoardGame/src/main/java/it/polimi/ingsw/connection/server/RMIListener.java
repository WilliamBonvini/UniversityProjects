package it.polimi.ingsw.connection.server;

import it.polimi.ingsw.connection.client.IRMIServerHandler;
import it.polimi.ingsw.connection.server.clienthandlers.IRMIClientHandler;
import it.polimi.ingsw.connection.server.clienthandlers.RMIClientHandler;
import it.polimi.ingsw.utils.Logger;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 * The thread which listens for new RMI connections.
 */
public class RMIListener extends UnicastRemoteObject implements IRMIListener {



    protected RMIListener() throws RemoteException {
    }





    /**
     * Register if made to bind an RMIServerHandler with the RMI listener. Is the equivalent of establishing
     * a connection with sockets
     * @param rsh the RMIServerHandler which wants to bind himself to the RMIListener
     * @return the ClientHandler which will speak with the ServerHandler
     */
    @Override
    public IRMIClientHandler register(IRMIServerHandler rsh) throws RemoteException{
        Logger.std().info("Client connected with RMI");
        return new RMIClientHandler(rsh);

    }



}