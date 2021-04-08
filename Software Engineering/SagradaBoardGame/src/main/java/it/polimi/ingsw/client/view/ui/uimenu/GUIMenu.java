package it.polimi.ingsw.client.view.ui.uimenu;


import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.client.view.ui.uigame.uiutils.GUILauncher;
import it.polimi.ingsw.utils.Logger;
import javafx.application.Application;

public class GUIMenu extends AbstractUIMenu {

    private boolean isGameClosed;

    /**
     * the constructor of the GUIMenu gives to the UIManager his reference and sets to null the booleans that
     * communicate the client if the game has to be closed or not.
     */
    public GUIMenu() {
        UIManager.instance().setUiMenu(this);
        isGameClosed=false;
    }


    /**
     * Launches the javafx application in GUILauncher
     */
    @Override
    public void start() {
        new Thread(() -> Application.launch(GUILauncher.class)).start();
    }

    @Override
    public void printMessage(String message) {
        Logger.std().info(message);
    }


    /**
     * called by the ConnectionManager when the connection shuts down in an unexpected way
     */
    @Override
    public void gameClosed() {
        if(!isGameClosed) {
            super.gameClosed();
            Logger.std().info("The connection shut down in an unexpected way");
            isGameClosed = true;
        }
    }
}