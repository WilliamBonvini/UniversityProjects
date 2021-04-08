package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.model.Player;
import it.polimi.ingsw.utils.Logger;

/**
 * Filter the IDs based on the player that sent them and the player that is in control now.
 * Success:
 *      The player that sent the IDView is in control
 * Failure:
 *      The player that sent the IDView is not in control
 */
public class PlayerFilter extends Filter {
    private IDView id;
    private boolean result;

    @Override
    public boolean execute(IDView id) {
        result = false;
        this.id = id;

        check(id
                .getGameManager()
                .getFlow()
                .getMicroOperationVariables()
                .getCurrentPlayer()
                .orElseThrow(CantAccessPlayerException::new));
        if (!result)
            Logger.std().verbose("Filter failed: " + getName());
        return result;
    }

    @Override
    String getName() {
        return "player";
    }

    /**
     * check if the player that sent the messagge is the current player
     * @param player that sent the messagge
     */
    private void check (Player player) {
        result = player.getName().equals(id.getPlayer());
    }
}
