package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.utils.Logger;

/**
 * Filter the IDs based on the user's choice about incrementing or decrementing the die value
 * Success:
 *      The die can be modified with the user choice.
 * Failure:
 *      The die cannot be modified with the user choice.
 */
class ModifyFilter extends Filter {
    @Override
    boolean execute(IDView id) {
        boolean result = true;
        if (id.getComponent().equals(ModelGlobals.componentChoose()))
        {
            result =
                // If any condition is matched, we have to fail the test
                !(
                    // True if the user choosed -1 and the die is a 1
                    (id
                        .getGameManager()
                        .getFlow()
                        .getMicroOperationVariables()
                        .getCurrentPlayer()
                        .orElseThrow(CantAccessPlayerException::new)
                        .getDie(1)
                        .getValue() == Number.ONE
                    &&
                    id.getId() == 1)
                ||
                    // True if the user choosed +1 and the die is a 6
                    (id
                        .getGameManager()
                        .getFlow()
                        .getMicroOperationVariables()
                        .getCurrentPlayer()
                        .orElseThrow(CantAccessPlayerException::new)
                        .getDie(1)
                        .getValue() == Number.SIX
                    &&
                    id.getId() == 2)
            );
        }
        if (!result)
            Logger.std().verbose("Filter failed: " + getName());
        return result;
    }

    @Override
    String getName() {
        return "modify";
    }
}
