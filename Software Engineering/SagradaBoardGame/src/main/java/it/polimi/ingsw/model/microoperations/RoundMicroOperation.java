package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.IllegalParameterException;
import it.polimi.ingsw.exceptions.MicroOperationSyntaxErrorException;
import it.polimi.ingsw.exceptions.QuantityDifferFromViewIDsException;
import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

/**
 * Implementes the ROUND MicroOperation
 */
public class RoundMicroOperation extends AbstractMicroOperation {

    public RoundMicroOperation (String ... parameters) {
        super("round", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(parameters.size() == 1) {
            switch(parameters.get(0))
            {
                case "forward":
                    flow.getMicroOperationVariables().setSecondTurn(false);
                    break;
                case "backward":
                    flow.getMicroOperationVariables().setSecondTurn(true);
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
        return obj instanceof RoundMicroOperation;
    }
}
