package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.utils.Logger;

/**
 * Filter the "pass" command.
 * Success:
 *      The component wasn't a pass component, we have to go forward in the chain.
 * Failure:
 *      The component was a pass component, we have to stop the chain
 *      and call the proper methods to pass the player turn.
 */
public class PassFilter extends Filter {

    @Override
    public boolean execute(IDView id) {
        if (id.getComponent().equals(ModelGlobals.componentPass()) &&
                id.getPlayer().equals(id.getGameManager().getFlow().getMicroOperationVariables().getCurrentPlayer().orElseThrow(CantAccessPlayerException::new).getName())) {
            id.getGameManager().getFlow().pass();
            Logger.std().verbose("Filter failed (the current player requested a \"pass\" command): " + getName());
            return false;
        }
        return true;
    }

    @Override
    String getName() {
        return "pass";
    }
}
