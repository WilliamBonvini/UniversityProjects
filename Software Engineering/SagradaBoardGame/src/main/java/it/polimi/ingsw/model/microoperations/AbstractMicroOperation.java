package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.IllegalParameterException;
import it.polimi.ingsw.exceptions.MicroOperationSyntaxErrorException;
import it.polimi.ingsw.exceptions.QuantityDifferFromViewIDsException;
import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Used to store basic informations and logic about a single MicroOperation. Every MicroOperation need to extend this class
 */
public abstract class AbstractMicroOperation {
    List<String> parameters;
    private String type;

    public AbstractMicroOperation(String type, String... parameter) {
        this.type = type;
        this.parameters = new ArrayList<>(Arrays.asList(parameter));
    }

    /**
     * Execute this MicroOperation
     * @param gameManager the GameManager context of the MicroOperation
     * @param flow the FlowManager context of the MicroOperation
     */
    public abstract void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException;

    /**
     * Return the parameters of the MicroOperation
     * @return the parameters
     */
    public List<String> getParameters () {
        return new ArrayList<>(parameters);
    }

    /**
     * Return the type of this operation
     * @return the type
     */
    public String getType () {
        return type;
    }

    /**
     * Compare the MicroOperation type of this and obj
     * @param obj the MicroOperation to compare with this
     * @return True if the MicroOperations are of the same type
     */
    public abstract boolean equalsType (Object obj);

    /**
     * Compare the MicroOperation and his parameters of this and obj
     * @param obj the MicroOperation to compare with this
     * @return True if the MicroOperations are of the same type and have the sames parameters
     */
    public boolean equals (Object obj) {
        if(equalsType(obj))
            return this.getParameters().equals(((AbstractMicroOperation) obj).getParameters());
        return false;
    }
}
