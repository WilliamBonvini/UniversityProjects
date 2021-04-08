package it.polimi.ingsw.connection.server;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.connection.server.clienthandlers.RMIClientHandler;
import it.polimi.ingsw.connection.server.clienthandlers.SocketClientHandler;
import org.junit.jupiter.api.Test;

import java.net.Socket;
import java.rmi.RemoteException;

import static org.junit.jupiter.api.Assertions.*;

class LobbyTest {

    @Test
    void addingClients() throws RemoteException {
        Lobby lobby = new Lobby(ClientDispatcher.instance());
        assertFalse(lobby.isFull());
        //add 2 users
        AbstractClientHandler ach1 = new RMIClientHandler();
        ach1.setUsername("A");
        lobby.addClient(ach1);
        AbstractClientHandler ach2 = new RMIClientHandler();
        ach1.setUsername("B");
        lobby.addClient(ach2);

        //check if both are in
        lobby.isIn(ach1.getUsername());
        lobby.isIn(ach2.getUsername());

    }
}