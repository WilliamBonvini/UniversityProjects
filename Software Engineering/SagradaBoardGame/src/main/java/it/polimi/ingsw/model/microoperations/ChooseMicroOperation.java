package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

/**
 * Implementes the CHOOSE MicroOperation.
 */
public class ChooseMicroOperation extends AbstractMicroOperation {

    public ChooseMicroOperation(String... parameter) {
        super("choose", parameter);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException {
        if(parameters.size() == 1) {
            flow.getMicroOperationVariables().setSchema(Integer.parseInt(parameters.get(0)));
            gameManager.notifyChanged();
        } else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof ChooseMicroOperation;
    }
}
