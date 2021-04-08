package it.polimi.ingsw.model.factories;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.connection.server.util.ClientContainer;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

import java.util.List;

/**
 * Factory-class which creates a GameManager
 */
public class GameFactory {

    private GameFactory() {}

    /**
     * Create a new Game. This means a GameManager with a Flow initialized with the micro operations for a normal match,
     * and a table with the initial setup
     * @return the instanced game manager filled with everything needed to start a game
     */
    public static GameManager createNewGame(List<AbstractClientHandler> clients) {
        return new GameManager(new ClientContainer(clients));
    }
}
