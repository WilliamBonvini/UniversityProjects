package it.polimi.ingsw.exceptions;

import it.polimi.ingsw.utils.Logger;

/**
 * Throwed if the number of ID from the view doesn't match with the quantity specified in the MicroOperation
 */
public class QuantityDifferFromViewIDsException extends Exception {
    public QuantityDifferFromViewIDsException(){
    }
    public QuantityDifferFromViewIDsException(String string){
        Logger.std().verbose(string);
    }
}
