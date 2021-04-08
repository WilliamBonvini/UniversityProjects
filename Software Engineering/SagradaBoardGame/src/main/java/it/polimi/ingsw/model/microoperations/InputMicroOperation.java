package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Logger;

/**
 * Implementes the INPUT MicroOperation
 */
public class InputMicroOperation extends AbstractMicroOperation {

    public InputMicroOperation (String ... parameters) {
        super("input", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(!parameters.isEmpty()) {
            boolean stop = false;

            for(String parameter : parameters) {
                try {
                    flow.getMicroOperationVariables().request(parameter);
                } catch (InvalidComponentException invalidComponent) {
                    throw new MicroOperationSyntaxErrorException(parameter + "is not a valid INPUT parameter");
                }
            }
            Logger.std().verbose("MicroOpInput: 0/2 - Waiting for " + parameters.get(0) + " to be approved by the chain");
            // Process idviews until the correct one is found
            while(!Thread.interrupted() && !stop && !gameManager.getFilter().filterUntilFoundOneOrEmpty()) {
                stop = flow.getMicroOperationVariables().stopWaitingForInput();
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    Logger.std().error("InputMicroOperation: error while calling Thread.sleep(), throwed InterruptedException");
                    Thread.currentThread().interrupt();
                }
            }
            if (!stop) {
                Logger.std().verbose("MicroOpInput: 1/2 - Waiting for " + parameters.get(0) + " to be filled");
                // Wait until we have some idviews to be popped
                while(!Thread.interrupted() && flow.getMicroOperationVariables().empty()) {
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        Logger.std().error("InputMicroOperation: error while calling Thread.sleep(), throwed InterruptedException");
                        Thread.currentThread().interrupt();
                    }
                }
                Logger.std().verbose("MicroOpInput: 2/2 - Stopped waiting for " + parameters.get(0) + ". MOV is not empty now");
            }
            else
                Logger.std().verbose("MicroOpInput: 2/2 - Interrupted! Was waiting for " + parameters.get(0));
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof InputMicroOperation;
    }
}
