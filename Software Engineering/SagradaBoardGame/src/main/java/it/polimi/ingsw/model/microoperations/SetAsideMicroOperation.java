package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

/**
 * Implementes the SETASIDE MicroOperation
 */
public class SetAsideMicroOperation extends AbstractMicroOperation {

    public SetAsideMicroOperation (String ... parameters) {
        super("setaside", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException {
        if(parameters.size() == 1) {
            flow.getMicroOperationVariables().setAside(parameters.get(0));
        } else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof SetAsideMicroOperation;
    }
}
