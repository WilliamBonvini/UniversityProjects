package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.factories.MicroOperationProgramFactory;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

public class ProgramMicroOperation extends AbstractMicroOperation {

    public ProgramMicroOperation (String ... parameters) {
        super("program", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(parameters.size() == 1) {
            flow.insertAfterCurrent(MicroOperationProgramFactory.getProgram(parameters.get(0)).getAll());
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof ProgramMicroOperation;
    }
}
