package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.Player;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Logger;

import java.util.List;

/**
 * Implementes the Rotate MicroOperation
 */
public class RotateMicroOperation extends AbstractMicroOperation {

    public RotateMicroOperation (String ... parameters) {
        super("rotate", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException {
        if(parameters.isEmpty()) {
            List<Player> players = gameManager.getTable().getPlayers();
            int id = 0;
            for (Player player : players)
                if (player.getName().equals(gameManager.getTable().getFirstPlayer()))
                    id = player.getID();

            if(id + 1 == players.size()) {
                gameManager.getTable().setFirstPlayer(players.get(0).getName());
                Logger.std().verbose("Rotating to (first): " + players.get(0).getName());
            }
            else {
                gameManager.getTable().setFirstPlayer(players.get(id + 1).getName());
                Logger.std().verbose("Rotating to: " + players.get(id + 1).getName());
            }
        } else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof RotateMicroOperation;
    }
}
