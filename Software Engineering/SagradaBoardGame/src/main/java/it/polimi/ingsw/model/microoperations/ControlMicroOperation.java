package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Logger;

/**
 * Implementes the CONTROL MicroOperation
 */
public class ControlMicroOperation extends AbstractMicroOperation {

    public ControlMicroOperation (String ... parameters) {
        super("control", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException {
        if(parameters.size() == 1) {
            try {
                flow.getMicroOperationVariables().setCurrentPlayer(
                        gameManager.getTable().getPlayers().get(
                                Integer.parseUnsignedInt(
                                        parameters.get(0)
                                )
                        )
                );
                Logger.std().verbose("Player now active: " + parameters.get(0) + " which is " + gameManager.getTable().getPlayers().get(Integer.parseUnsignedInt(
                        parameters.get(0)
                )).getName());
                gameManager.notifyPlayerChanged();
            } catch (NumberFormatException e) {
                Logger.std().error("ControlMicroOperation: error parsing parameter, must be a number: " + parameters.get(0));
            }
        } else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof ControlMicroOperation;
    }
}
