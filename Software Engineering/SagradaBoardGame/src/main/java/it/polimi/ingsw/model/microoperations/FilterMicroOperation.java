package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.IllegalParameterException;
import it.polimi.ingsw.exceptions.MicroOperationSyntaxErrorException;
import it.polimi.ingsw.exceptions.QuantityDifferFromViewIDsException;
import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

import java.util.List;

public class FilterMicroOperation extends AbstractMicroOperation {

    public FilterMicroOperation (String ... parameters) {
        super("filter", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(parameters.size() > 1) {
            boolean use = parameters.get(parameters.size() - 1).equals("yes");
            List<String> filters = parameters.subList(0, parameters.size() - 1);
            filters
                    .forEach(filter ->
                    gameManager
                    .getFilter()
                    .useFilter(filter, use)
            );
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof FilterMicroOperation;
    }
}
