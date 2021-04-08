
package it.polimi.ingsw.client.view.ui.uimenu;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.client.view.ui.uigame.uiutils.GUILauncher;
import it.polimi.ingsw.connection.client.ConnectionManager;
import it.polimi.ingsw.connection.messages.client.LoginMessage;
import it.polimi.ingsw.exceptions.connection.UnavailableConnectionException;
import it.polimi.ingsw.utils.Console;
import it.polimi.ingsw.utils.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.text.Text;


public class GUIMenuController {
    private static final String SOCKET="SOCKET";
    private static final String RMI="RMI";
    private String ip;
    private AbstractUIMenu guiMenu;
    private GUILauncher guiLauncher;

    @FXML
    private Button connectButton;
    @FXML
    private Text typeOfConnectionText;
    @FXML
    private Button socketButton;
    @FXML
    private Button rmiButton;
    @FXML
    private Text connectionText;
    @FXML
    private Text ipText;
    @FXML
    private Button localHostButton;
    @FXML
    private Button externalIPButton;
    @FXML
    private TextField ipTextField;
    @FXML
    private TextField usernameTextField;
    @FXML
    private Button startButton;
    @FXML
    private Text loginText;
    @FXML
    private Text headerText;
    @FXML
    private Text gameTerminatedText;

    private String username;

    public GUIMenuController(){
        guiMenu = UIManager.instance().getUiMenu();
    }

    /**
     * This method is called by the FXMLLoader when initialization is complete
     * sets the visibility of the menu scene, which means that sets invisible all the buttons and texts that
     * are not useful at the beginning of the scene
     */
    @FXML
    void initialize() {

        ipText.setVisible(false);
        localHostButton.setVisible(false);
        externalIPButton.setVisible(false);
        ipTextField.setVisible(false);
        connectionText.setVisible(false);
        usernameTextField.setVisible(false);
        startButton.setVisible(false);
        gameTerminatedText.setVisible(false);
        connectButton.setVisible(false);

        //adds an event listener in usernameTextField that detects when the string inserted in the textfield is not null, and
        //when it's so it enables the startButton
        usernameTextField.textProperty().addListener((observable) -> {
            if(usernameTextField.getText().length()>0){
                startButton.setDisable(false);
            }else{
                startButton.setDisable(true);
            }
        });
    }

    /**
     * Sets the reference to the guiLauncher
     * @param guiLauncher the javafx application that launches the Menu scene
     */
    public void setGUILauncher(GUILauncher guiLauncher){
        this.guiLauncher = guiLauncher;
    }


    /**
     * method called when the player clicks on the rmi button -> connects the client via rmi to the server
     * @param event on action event
     */
    @FXML
    void connectViaRMI(MouseEvent event) {
        socketButton.setDisable(true);
        rmiButton.setCancelButton(true);
        rmiButton.setStyle("-fx-background-color: orange;");
        setIPSelection();
        ipHandler(RMI);
    }

    /**
     * method called when the player clicks on the socket button -> connects the client via socket to the server
     * @param event on action event
     */
    @FXML
    void connectViaSocket(MouseEvent event) {
        rmiButton.setDisable(true);
        socketButton.setCancelButton(true);
        socketButton.setStyle("-fx-background-color: orange;");
        setIPSelection();
        ipHandler(SOCKET);
    }

    /**
     * method called when the player clicks on the login button -> starts the game scene
     * @param event on action event
     */
    @FXML
    void login(ActionEvent event) {
        boolean logged = false;
        //as long as is not logged
        while (!logged) {
            //ask for username and send a login message, then wait for reply
            ConnectionManager.instance().setWaitForAnswer(true);
            ConnectionManager.instance().sendMessage(new LoginMessage(usernameTextField.getText()));

            //Gets the reference to the username to pass it later to the GUIGame().
            //GUIReferences.
            username = usernameTextField.getText();

            //wait until the reply login message unlocks the ConnectionManager
            loginText.setText("Login in corso...");
            Console.waitAndPrintUntil(".", 1000, 10, ConnectionManager.instance()::isNotWaitingForAnswer);

            //the reply is arrived
            if (ConnectionManager.instance().isLogged()) {
                ConnectionManager.instance().setLoggedUsername(usernameTextField.getText());
                loginText.setText("Login avvenuto con successo!");
                Logger.std().info("login avvenuto con successo");
                logged = true;
            } else {
                if (!guiMenu.isGameClosed()) {
                    loginText.setText("Login fallito, Riprova.");
                    Logger.std().info("Login fallito");
                }else{
                    showGameTerminatedMessage();
                    return;
                }
            }
        }

        guiLauncher.startGame();
    }

    /**
     * This method is called by the GUIGame to get the reference of the username
     * @return the username of the player who logged in
     */
    public String getUsername(){
        return username;
    }

    private void connect(String typeOfConnection, String ip){
        try {
            if(typeOfConnection.equals(SOCKET)){
                ConnectionManager.instance().connectWithSocket(ip);
                setUsernameSelection();
            }else if(typeOfConnection.equals(RMI)){
                ConnectionManager.instance().connectWithRMI(ip);
                setUsernameSelection();
            }
        } catch (UnavailableConnectionException e) {
            ipText.setVisible(false);
            typeOfConnectionText.setVisible(false);
            headerText.setText("Il server è offline");
            Console.println("The server is offline");
        }
    }

    /**
     * Sets the listener to the ip buttons and gives to the connect method such reference
     * @param typeOfConnection socket or rmi
     */
    private void ipHandler(String typeOfConnection){
        localHostButton.setOnAction(e -> {
                    ip = "localhost";
                    connect(typeOfConnection,ip);
                    localHostButton.setStyle("-fx-background-color: orange;");
                    externalIPButton.setDisable(true);
                }
        );
        externalIPButton.setOnAction(e -> {
            ipTextField.setVisible(true);
            externalIPButton.setStyle("-fx-background-color: orange;");
            localHostButton.setDisable(true);
            connectButton.setVisible(true);

            connectButton.setOnAction(event -> {
                ip = ipTextField.getText();
                connect(typeOfConnection, ip);
            });
        });
    }

    /**
     * Sets visible the local host and external ip buttons
     */
    private void setIPSelection(){
        ipText.setVisible(true);
        localHostButton.setVisible(true);
        externalIPButton.setVisible(true);
    }

    /**
     * sets visible the username textfield and the login button (startButton)
     */
    private void setUsernameSelection(){
        connectionText.setVisible(true);
        connectionText.setText("Connected");
        usernameTextField.setVisible(true);
        startButton.setVisible(true);
        startButton.setDisable(true);
    }

    /**
     * Communicates to the user that the game has terminated
     */
    public void showGameTerminatedMessage(){
        gameTerminatedText.setText("Il gioco è terminato in modo inaspettato");
    }
}
