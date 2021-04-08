package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

/**
 * Implementes the CHECKPOINT MicroOperation
 */
public class CheckPointMicroOperation extends AbstractMicroOperation {

    public CheckPointMicroOperation (String ... parameters) {
        super("checkpoint", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if (parameters.isEmpty()) {
            gameManager.getFlow().getMicroOperationVariables().setTable(gameManager.getTable());
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof CheckPointMicroOperation;
    }
}
