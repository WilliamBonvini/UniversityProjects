package it.polimi.ingsw.client.view.ui;

/**
 * Interface of a generic user interface. must be able to print a message and close the game
 */
public interface IUserInterface {

    void printMessage(String message);

    void gameClosed();
}
