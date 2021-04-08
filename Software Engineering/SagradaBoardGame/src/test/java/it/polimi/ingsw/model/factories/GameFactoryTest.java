package it.polimi.ingsw.model.factories;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.connection.server.clienthandlers.RMIClientHandler;
import it.polimi.ingsw.model.game.GameManager;
import org.junit.jupiter.api.Test;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class GameFactoryTest {

    @Test
    void createNewGame() throws RemoteException {
        List<AbstractClientHandler> clientHandlers = new ArrayList<>(3);
        RMIClientHandler ch = new RMIClientHandler();
        ch.setUsername("a");
        clientHandlers.add(ch); ch = new RMIClientHandler();
        ch.setUsername("b");
        clientHandlers.add(ch);ch = new RMIClientHandler();
        ch.setUsername("c");
        clientHandlers.add(ch);

        GameManager gm = GameFactory.createNewGame(clientHandlers);

        assertEquals(3, gm.getClientContainer().getPlayersNames().size());
    }
}