package it.polimi.ingsw.controller;

import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.utils.Logger;

public class RoundTrackFullCellFilter extends Filter {
    @Override
    boolean execute(IDView id) {
        if (id.getComponent().equals(ModelGlobals.componentRoundTrack()) &&
                !id.getGameManager().getTable().getRoundTrack().isEmpty(id.getId()))
            return true;
        Logger.std().verbose("Filter failed: " + getName());
        return false;
    }

    @Override
    String getName() {
        return "roundtrackfullcell";
    }
}
