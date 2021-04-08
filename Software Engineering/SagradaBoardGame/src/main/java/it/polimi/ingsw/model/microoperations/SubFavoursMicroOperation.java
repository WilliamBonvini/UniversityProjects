package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

import static java.lang.Integer.parseInt;

public class SubFavoursMicroOperation extends AbstractMicroOperation {
    public SubFavoursMicroOperation(String... parameter) {
        super("subfavours", parameter);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if (parameters.size() == 1) {
            if (parseInt(parameters.get(0)) > 0 && parseInt(parameters.get(0)) <= 12) {
                int idview = gameManager
                        .getTable()
                        .getIDView(parseInt(parameters.get(0)))
                        .orElseThrow(IllegalParameterException::new);
                int toolFavours = gameManager
                        .getTable()
                        .getFavoursPoints(idview);
                int playerFavours = flow
                        .getMicroOperationVariables()
                        .getCurrentPlayer()
                        .orElseThrow(CantAccessPlayerException::new)
                        .getFavourPoints();
                int neededFavours = (toolFavours == 0) ? 1 : 2;

                if (playerFavours >= neededFavours) {
                    gameManager
                            .getTable()
                            .setFavourPoints(idview, toolFavours + neededFavours);
                    flow
                            .getMicroOperationVariables()
                            .getCurrentPlayer()
                            .orElseThrow(CantAccessPlayerException::new)
                            .setFavourPoints(playerFavours - neededFavours);
                }
            }
            else
                throw new MicroOperationSyntaxErrorException("SubFavoursMicroOperation: " + parameters.get(0) + " is not a valid tool");
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof SubFavoursMicroOperation;
    }
}
