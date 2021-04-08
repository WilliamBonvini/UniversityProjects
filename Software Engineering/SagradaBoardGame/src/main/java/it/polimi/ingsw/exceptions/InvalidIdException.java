package it.polimi.ingsw.exceptions;

/**
 *is thrown when we try to pass to a method, such as Color.getColorById(int), a number (id) which is not in the range of the values
 * accepted as identifiers of the object.
 */
public class InvalidIdException extends RuntimeException {
}
