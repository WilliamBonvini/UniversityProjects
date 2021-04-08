package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.globals.ToolGlobals;
import it.polimi.ingsw.utils.Logger;

public class ToolsTurnFilter extends Filter {
    @Override
    boolean execute(IDView id) {
        boolean result = true;
        if (id.getComponent().equals(ModelGlobals.componentTool()) && id.getId() != 0)
        {
            result = false;
            if (
                (ToolGlobals.instance.needFirstTurn(id.getGameManager().getTable().getToolCard(id.getId())) &&
                !id.getGameManager().getFlow().getMicroOperationVariables().isSecondTurn())
                ||
                (ToolGlobals.instance.needSecondTurn(id.getGameManager().getTable().getToolCard(id.getId())) &&
                id.getGameManager().getFlow().getMicroOperationVariables().isSecondTurn())
                ||
                (!ToolGlobals.instance.needFirstTurn(id.getGameManager().getTable().getToolCard(id.getId())) &&
                !ToolGlobals.instance.needSecondTurn(id.getGameManager().getTable().getToolCard(id.getId())))
            ) {
                Logger.std().debug("ToolsTurnFilter: Tool approved. Now checking if the user can afford it");
                int toolFavours = id
                        .getGameManager()
                        .getTable()
                        .getFavoursPoints(id.getId());
                int playerFavours = id
                        .getGameManager()
                        .getFlow()
                        .getMicroOperationVariables()
                        .getCurrentPlayer()
                        .orElseThrow(CantAccessPlayerException::new)
                        .getFavourPoints();
                int neededFavours = (toolFavours == 0) ? 1 : 2;

                if (playerFavours >= neededFavours) {
                    Logger.std().debug("ToolsTurnFilter: User \"" + id.getPlayer() + "\" have enough favours");
                    result = true;
                }
            }
        }
        if (!result)
            Logger.std().verbose("Filter failed: " + getName());
        return result;
    }

    @Override
    String getName() {
        return "toolsturn";
    }
}
