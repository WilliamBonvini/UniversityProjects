package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.InvalidComponentException;
import it.polimi.ingsw.utils.Logger;

/**
 * Filter the IDs based on the Component.
 * Success:
 *      The component is requested and is valid.
 * Failure:
 *      The component is not requested or is not valid.
 */
public class ComponentFilter extends Filter {

    @Override
    public boolean execute(IDView id) {
        try {
            if (id
                    .getGameManager()
                    .getFlow()
                    .getMicroOperationVariables()
                    .isRequested(id.getComponent())
                &&
                id.getId() >= 0
                &&
                id.getId() <=
                    id
                    .getGameManager()
                    .getDiceContainer(id.getComponent())
                    .size()
                )
                return true;
        } catch (InvalidComponentException invalidComponent) {
            Logger.std().error("ComponentFilter: " + id.getComponent() + " is not a valid component");
            throw new InvalidComponentException();
        }
        Logger.std().verbose("Filter failed: " + getName());
        return false;
    }

    @Override
    String getName() {
        return "component";
    }
}
