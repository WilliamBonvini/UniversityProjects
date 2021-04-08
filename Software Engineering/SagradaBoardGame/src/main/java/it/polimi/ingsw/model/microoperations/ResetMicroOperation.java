package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

/**
 * Implementes the RESET MicroOperation
 */
public class ResetMicroOperation extends AbstractMicroOperation {

    public ResetMicroOperation (String ... parameters) {
        super("reset", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(parameters.size() == 1) {
            switch (parameters.get(0))
            {
                case "restrictions":
                    flow.getMicroOperationVariables().clearRestrictedNumber();
                    break;
                case "choose":
                    flow.getMicroOperationVariables().setSchema(0);
                    gameManager.notifyChanged();
                    break;
                case "input":
                    flow.getMicroOperationVariables().clearInputs();
                    break;
                default:
                    throw new IllegalParameterException();
            }
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof ResetMicroOperation;
    }
}
