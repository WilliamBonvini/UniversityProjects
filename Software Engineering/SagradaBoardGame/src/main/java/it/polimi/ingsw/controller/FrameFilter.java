package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.utils.Logger;

import java.util.ArrayList;
import java.util.List;

/**
 * Filter the idview based on the frame of the Board. The ID must appartain to the frame.
 * Success:
 *      The idview is on the frame
 * Failure:
 *      The idview is not on the frame
 */
public class FrameFilter extends Filter {
    @Override
    boolean execute(IDView id) {
        boolean result = true;
        if (id.getComponent().equals(ModelGlobals.componentBoard()) && id.getGameManager().getFlow().getMicroOperationVariables().getCurrentPlayer().orElseThrow(CantAccessPlayerException::new).getBoard().isEmpty()) {
            List<Integer> frame = new ArrayList<>();
            for (int i = 1; i <= ModelGlobals.boardSizeX(); i++) {
                frame.add(i);
                frame.add(i + ModelGlobals.boardSizeX() * (ModelGlobals.boardSizeY() - 1));
            }
            for (int i = ModelGlobals.boardSizeX() + 1; i <= (ModelGlobals.boardSizeX() - 1) * (ModelGlobals.boardSizeY() - 1) + 1; i += ModelGlobals.boardSizeX()) {
                frame.add(i);
                frame.add(i + ModelGlobals.boardSizeX() - 1);
            }
            Logger.std().verbose("Frame filter: testing cells: " + frame);
            result = frame.contains(id.getId());
        }
        if (!result)
            Logger.std().verbose("Filter failed: " + getName());
        return result;
    }

    @Override
    String getName() {
        return "frame";
    }
}
