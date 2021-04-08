package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

import java.util.ArrayList;
import java.util.List;

/**
 * Implementes the FORCEID MicroOperation
 */
public class ForceIdMicroOperation extends AbstractMicroOperation {

    public ForceIdMicroOperation (String ... parameters) {
        super("forceid", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException {
        List<Integer> idviews = new ArrayList<>();
        if(parameters.size() == 1) {
            idviews.add(flow.getMicroOperationVariables().getSetAsideIDView());
        } else if(parameters.size() > 1) {
            for (int i = 0;i < parameters.size() - 1;i++)
                idviews.add(Integer.parseInt(parameters.get(i + 1)));
        } else
            throw new WrongParametersNumberException();
        flow.getMicroOperationVariables().request(parameters.get(0));
        flow.getMicroOperationVariables().fill(parameters.get(0), idviews);
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof ForceIdMicroOperation;
    }
}
