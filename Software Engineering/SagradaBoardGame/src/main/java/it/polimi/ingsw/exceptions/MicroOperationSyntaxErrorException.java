package it.polimi.ingsw.exceptions;

/**
 * Throwed if a MicroOperation receive parameters can't go together
 * Example: MOVE 7 FROM bag BY user ....
 * bag and user can't go together because the user cannot specify
 * in any way what dice to get from the bag (bag don't have IDviews)
 */
public class MicroOperationSyntaxErrorException extends Exception {

    private final String message;

    public MicroOperationSyntaxErrorException(String message){
        this.message = message;
    }

    @Override
    public String getMessage(){
        return message;
    }
}
