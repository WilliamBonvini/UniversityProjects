package it.polimi.ingsw.client.view.ui;

import it.polimi.ingsw.client.view.ui.uigame.AbstractUIGame;
import it.polimi.ingsw.client.view.ui.uigame.CLIGame;
import it.polimi.ingsw.client.view.ui.uimenu.AbstractUIMenu;
import it.polimi.ingsw.client.view.ui.uimenu.CLIMenu;
import it.polimi.ingsw.client.view.ui.uimenu.GUIMenu;
import it.polimi.ingsw.exceptions.client.InvalidTypeException;

import java.util.Optional;

/**
 * The general manager of UI focus and settings for a client. Singleton.
 */
public class UIManager {

    private static final UIManager INSTANCE = new UIManager();

    public static final String UI_TYPE_CLI = "CLI";
    public static final String UI_TYPE_GUI = "GUI";
    public static final String CONNECTION_TYPE_SOCKET = "SOCKET";
    public static final String CONNECTION_TYPE_RMI = "RMI";

    private AbstractUIGame uiGame;
    private AbstractUIMenu uiMenu;
    private IUserInterface focusUI;

    private UIManager() {

    }

    /**
     * Launch the manager with the type specified. Is advised to use the public constants of this class to choose what
     * use
     * @param uiType
     * @throws InvalidTypeException if the type is not one of the "UI_TYPE..." constants of this class
     */
    public void launch(String uiType) {
        launch(uiType, Optional.empty(), Optional.empty(), Optional.empty());
    }


    /**
     * Launch the manager with the specified fields.
     * @param uiType must be one of this class' constants (UI_TYPE_CLI / UI_TYPE_GUI)
     * @param connectionType optional representing the type of connection to force, if present
     * @param ip optional representing the ip to force, if present
     * @param nickname optional representing the nickname to force, if present
     */
    public void launch(String uiType, Optional<String> connectionType, Optional<String> ip, Optional<String> nickname) {
        if(uiType == null)
            throw new InvalidTypeException();

        //if equals UI_TYPE_CLI, start a new CLI game
        if(uiType.equals(UI_TYPE_CLI)) {
            //Construction of classes
            uiMenu = new CLIMenu();
            uiGame = new CLIGame();

        } else if(uiType.equals(UI_TYPE_GUI)) {
            uiMenu = new GUIMenu();

        } else {
            throw new InvalidTypeException();
        }


        setMenuOptionals(connectionType, ip, nickname);

        //starts and sets focus on the uiMenu
        focusUI = uiMenu;
        uiMenu.start();

    }



    private void setMenuOptionals(Optional<String> connectionType, Optional<String> ip, Optional<String> nickname) {
        if(connectionType.isPresent()) {
            if(connectionType.get().equals(CONNECTION_TYPE_RMI)) {
                uiMenu.setConnectionType(Optional.of(AbstractUIMenu.RMI));
            } else if(connectionType.get().equals(CONNECTION_TYPE_SOCKET)){
                uiMenu.setConnectionType(Optional.of(AbstractUIMenu.SOCKET));
            }
        }

        if(ip.isPresent())
            uiMenu.setIpAddress(ip);

        if(nickname.isPresent())
            uiMenu.setNickname(nickname);

    }





    /**
     * assign to the UIManager a new UIGame
     * @param uiGame
     */
    public void setUIGame(AbstractUIGame uiGame) {
        this.uiGame = uiGame;
    }


    /**
     * Get the class' singleton
     * @return the only instance of this class
     */
    public static UIManager instance() {
        return INSTANCE;
    }


    public boolean hasFocusUI() { return focusUI != null; }

    public IUserInterface getFocusUI() {
        return focusUI;
    }

    public void setFocusUI(IUserInterface focusUI) {
        this.focusUI = focusUI;
    }

    public AbstractUIGame getUIGame(){
        return uiGame;
    }

    public AbstractUIMenu getUiMenu() {
        return uiMenu;
    }

    public void setUiMenu(AbstractUIMenu uiMenu) {
        this.uiMenu = uiMenu;
    }
}
