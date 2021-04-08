package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

/**
 * Implementes the DELETENEXT MicroOperation
 */
public class DeleteNextMicroOperation extends AbstractMicroOperation {

    public DeleteNextMicroOperation (String ... parameters) {
        super("deletenext", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(parameters.isEmpty()) {
            boolean eliminated = false;
            int i = flow.getCurrentIndex() + 1;
            while (!eliminated) {
                if (flow
                        .getOperationAt(i)
                        .getType()
                        .equals("program")
                    &&
                    flow
                        .getOperationAt(i)
                        .getParameters()
                        .get(0)
                        .equals("src/main/resources/programs/turn" + Integer.toString(
                            flow
                                .getMicroOperationVariables()
                                .getCurrentPlayer()
                                .orElseThrow(CantAccessPlayerException::new)
                                .getID()
                            )
                        )
                    ) {
                    flow.deleteAt(i);
                    eliminated = true;
                }
                i++;
            }
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof DeleteNextMicroOperation;
    }
}
