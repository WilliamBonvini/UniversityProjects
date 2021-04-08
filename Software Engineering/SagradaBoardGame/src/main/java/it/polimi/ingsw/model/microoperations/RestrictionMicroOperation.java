package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Couple;
import it.polimi.ingsw.utils.Logger;

import static java.lang.Integer.parseUnsignedInt;

/**
 * Implementes the RESTRICTION MicroOperation
 */
public class RestrictionMicroOperation extends AbstractMicroOperation {

    public RestrictionMicroOperation (String ... parameters) {
        super("restriction", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(parameters.size() == 3) {
            if (parameters.get(0).equals("number"))
            {
                int startingNumber;
                int endingNumber;

                try {
                    startingNumber = parseUnsignedInt(parameters.get(1));
                    endingNumber = parseUnsignedInt(parameters.get(2));
                    flow.getMicroOperationVariables().addNumberRestriction(new Couple<>(Number.getNumberById(startingNumber), Number.getNumberById(endingNumber)));
                } catch (NumberFormatException | InvalidIdException e) {
                    Logger.std().error("RestrictionMicroOperation: paramters error: " + parameters.get(0));
                    throw new IllegalParameterException();
                }
            }
            else
                throw new IllegalParameterException();
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof RestrictionMicroOperation;
    }
}
