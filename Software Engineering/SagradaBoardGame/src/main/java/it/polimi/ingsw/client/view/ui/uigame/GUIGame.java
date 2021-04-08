package it.polimi.ingsw.client.view.ui.uigame;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.client.view.ui.uigame.uiutils.*;
import it.polimi.ingsw.client.view.ui.uimenu.GUIMenuController;
import it.polimi.ingsw.connection.client.ConnectionManager;
import it.polimi.ingsw.connection.messages.client.ChooseBoardReplyMessage;
import it.polimi.ingsw.connection.messages.client.QuitMessage;
import it.polimi.ingsw.utils.Console;
import it.polimi.ingsw.utils.Couple;
import it.polimi.ingsw.utils.Logger;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

import java.util.List;


public class GUIGame extends AbstractUIGame {

    @FXML
    private Button switchButton;
    @FXML
    private HBox boardsBox;
    @FXML
    private BorderPane root;
    @FXML
    private VBox privateObjectiveBox;
    @FXML
    private VBox publicObjectiveBox;
    @FXML
    private VBox toolCardBox;
    @FXML
    private Button chooseBoard1Button;
    @FXML
    private Button chooseBoard2Button;
    @FXML
    private Button chooseBoard3Button;
    @FXML
    private Button chooseBoard4Button;
    @FXML
    private Text messagesText;
    @FXML
    private HBox chooseButtons;
    @FXML
    private VBox footerBoxes;
    @FXML
    private HBox poolDiceBox;
    @FXML
    private HBox roundtrackDiceBox;
    @FXML
    private Button roundtrackButton;

    private UICommandParser uiCommandParser;

    private StringBuilder stringBuilder;

    private GUIGameDrawer guiGameDrawer;

    private GUIMenuController guiMenuController;

    private GUILauncher guiLauncher;


    /**
     * Instantiates a UICommandParser to parse to events into communications with the server.
     * In case a player wants to re-enter a game that has already started it copies the references to the old GUIGame
     * instantiation into the new one
     */
    public GUIGame() {
        super();
        stringBuilder = new StringBuilder();
        uiCommandParser = new UICommandParser(this);


        if (UIManager.instance().getUIGame() != null && UIManager.instance().getUIGame().isSetupReady()) {

            AbstractUIGame uiGame = UIManager.instance().getUIGame();

            // Sets the pool
            for (int i = 1; i <= getPool().length; i++) {
                changedPool(i, uiGame.getPool()[i - 1]);
            }

            // Sets the roundtrack
            for (int i = 1; i <= 90; i++) {
                changedRoundtrack(i, uiGame.getRoundtrack().getComponent(i));
            }

            // Sets the boards
            for (int i = 1; i <= uiGame.getNumOfPlayers(); i++) {
                getBoard(i).setName(uiGame.getBoard(i).getName());
                getBoard(i).setFavours(uiGame.getBoard(i).getFavours());
                for (int j = 1; j <= 20; j++) {
                    changedCellConstraint(getBoard(i).getName(), j, uiGame.getBoard(i).getCell(j).getConstraint());
                    changedCellDie(getBoard(i).getName(), j, uiGame.getBoard(i).getCell(j).getDie());
                }
            }

            // Sets the number of players, username, currentplayer and dicebagOwner
            setNumOfPlayers(uiGame.getNumOfPlayers());
            setUsername(uiGame.getUsername());
            changedCurrentPlayer(uiGame.getCurrentPlayer());
            changedDiceBagOwner(uiGame.getDiceBagOwner());
            changedCurrentPlayerHand(uiGame.getCurrentPlayerHand());

            // Sets the tool cards and the objective cards
            for (int i = 1; i <= 3; i++) {
                setToolCard(i, uiGame.getToolCard(i).getNumToolCard());
                changedToolCardFavours(i, uiGame.getToolCard(i).getNumFavourPoints());
                setPublicObjective(i, uiGame.getPublicObjective(i).getID());
            }
            setPrivateObjective(uiGame.getPrivateObjective().getID());

            //Sets the booleans needed for the handling of the game
            setChanged(uiGame.isChanged());
            setEndGame(uiGame.isEndgame());
            setStillInGame(uiGame.isStillInGame());


            Platform.runLater(()->{
                guiGameDrawer = new GUIGameDrawer(this,boardsBox,root);
                setSetupVisibility();
                guiGameDrawer.printSetupCards();
                guiGameDrawer.setBoardsVisibility(getNumOfPlayers(),boardsBox);
                setEventListeners();
                notifyChanged();
            });
        }
    }


    /**
     * @param guiMenuController the controller of the menu that contains the reference to the username
     */
    public void setGUIMenuController(GUIMenuController guiMenuController){
        this.guiMenuController = guiMenuController;
        UIManager.instance().getUIGame().setUsername(guiMenuController.getUsername());
    }


    /**
     * @param guiLauncher the reference to the javafx application needed to change scenes
     */
    public void setGUILauncher(GUILauncher guiLauncher){
        this.guiLauncher = guiLauncher;
    }

    /**
     * This method is called by the FXMLLoader when initialization is completed
     * Sets the focus on the GUIGame. the General messages (messages displayed in the lobby) sent by
     * the server will be printed using the IUserInterface's method printMessage().
     */
    @FXML
    void initialize() {

        UIManager.instance().setUIGame(this);
        UIManager.instance().setFocusUI(UIManager.instance().getUIGame());
        UIManager.instance().getUIGame().start();

        //Sets up the lobby
        setLobbyVisibility();

        // prints the messages stored in the meanwhile by the server
        printMessage(ConnectionManager.instance().retrieveMessages());

    }


    /**
     * sets all the event listeners needed for the game. they are specified inside the method.
     */
    private void setEventListeners(){
        ImageView imageView;

        //Sets the listeners in the pool
        for (int i = 0; i < poolDiceBox.getChildren().size(); i++) {
            imageView = (ImageView) poolDiceBox.getChildren().get(i);
            imageView.setOnMousePressed(event1 -> {
                Object selectedDie = event1.getSource();
                int selectedDieIndex = poolDiceBox.getChildren().indexOf(selectedDie)+1;
                Logger.std().info("ho selezionato il dado "+ selectedDieIndex+ " dalla pool");
                uiCommandParser.parseAndOperate(uiCommandParser.getCommandList().getPoolCommands().get(0) + "." + selectedDieIndex);
            });
        }


        //Sets the listener for the tool cards
        HBox toolCards = (HBox)toolCardBox.getChildren().get(1);
        for (int i = 0; i < toolCards.getChildren().size(); i++) {
            VBox toolCard = (VBox) toolCards.getChildren().get(i);
            toolCard.setOnMousePressed(event1 -> {
                Object selectedToolCard = event1.getSource();
                int selectedToolCardIndex = toolCards.getChildren().indexOf(selectedToolCard)+1;
                Logger.std().info("ho selezionato la toolCard "+ selectedToolCardIndex+ " dalla pool");
                uiCommandParser.parseAndOperate(uiCommandParser.getCommandList().getToolCommands().get(0) + "." + selectedToolCardIndex);
                printMessage("Hai selezionato la carta utensile numero "+ selectedToolCardIndex);
            });
        }


        //Sets the listeners for the gridPane
        GridPane board;
        for (int i = 0; i < toolCards.getChildren().size(); i++) {
            board = (GridPane) ((VBox) boardsBox.getChildren().get(i)).getChildren().get(1);
            for (Node child : board.getChildren()) {
                child.setOnMousePressed(event1 -> {
                    // get indexes from the cells
                    Integer rowIndex = GridPane.getRowIndex(child);
                    Integer colIndex = GridPane.getColumnIndex(child);
                    int numCell = (rowIndex * 5 + colIndex) + 1;
                    Logger.std().info("Hai cliccato la cella numero " + numCell);
                    uiCommandParser.parseAndOperate(uiCommandParser.getCommandList().getBoardCommands().get(0) + "." + numCell);
                });
            }
        }

        // Sets the listeners for the chooseButton, which will be used to select the various options
        // offered by the tool cards
        for (int i = 0; i < chooseButtons.getChildren().size(); i++) {
            Button chooseButton = (Button) chooseButtons.getChildren().get(i);
            chooseButton.setOnMousePressed(event1 -> {
                Object selectedButton = event1.getSource();
                int selectedButtonIndex =  chooseButtons.getChildren().indexOf(selectedButton)+1;
                Logger.std().info("ho selezionato il bottone numero "+ selectedButtonIndex);
                uiCommandParser.parseAndOperate(uiCommandParser.getCommandList().getToolCommands().get(0) + "." + selectedButtonIndex);
            });
        }


        //Sets the listener for the roundtrack dice and button
        for (int i = 0; i < roundtrackDiceBox.getChildren().size(); i++) {
            ImageView rountrackDieImgView = (ImageView) roundtrackDiceBox.getChildren().get(i);
            rountrackDieImgView.setOnMousePressed(event1 -> {
                Object selectedDie = event1.getSource();
                int index = roundtrackDiceBox.getChildren().indexOf(selectedDie)+1;
                //selectedDieIndex identifies the actual number of the die selected, which can vary from 1 to 90
                int selectedDieIndex = index + (Integer.parseInt(roundtrackButton.getText())-1)*10;
                Logger.std().info("ho selezionato il dado numero "+ selectedDieIndex + " dalla roundtrack");
                uiCommandParser.parseAndOperate(uiCommandParser.getCommandList().getRoundTrackCommands().get(0) + "." + selectedDieIndex);
            });
        }
        roundtrackButton.setOnAction(event1-> {
            int level = Integer.parseInt(roundtrackButton.getText());
            if(level<9){
                roundtrackButton.setText(Integer.toString(level+1));
                guiGameDrawer.printRoundtrack(level);

            }else{
                roundtrackButton.setText("1");
                guiGameDrawer.printRoundtrack(0);
            }
        });

        //Sets the listener for the switchButton, which switches from a type of connection to the other
        switchButton.setOnAction(event-> uiCommandParser.parseAndOperate(uiCommandParser.getCommandList().getSwitchConnectionCommands().get(0)));
    }


    /**
     * logs the beginning of the game
     */
    @Override
    public void start() {
        Logger.std().info("The scene of the game has been set - GUI");
    }

    /**
     * prints a list of sentences on the LobbyMessagesText Text
     * This method is used to print on the menu of the GUI the messages saved in the server before the client's login
     * that tell the client who are the players that entered or exited the lobby
     *
     * @param messages a list of sentences, that will be retrieved via the ConnectionManager method retrieveMessages()
     */
    public void printMessage(List<String> messages) {

        if (messages.isEmpty()) {
            Console.println("There are no messages to retrieve");
        } else {
            while (!messages.isEmpty()) {
                stringBuilder.append(messages.remove(0)).append('\n');
            }
            Console.println("messages retrieved from the server");
            messagesText.setText(stringBuilder.toString());
        }
    }

    /**
     * prints a sentence on the LobbyMessagesText Text
     * This method is used to print on the menu of the GUI the messages saved in the server that
     * tell the client who are the players that entered or exited the lobby. it is called by the ConnectionManager.
     *
     * @param message a sentence, which will correspond to the entering, the exiting of a player from the lobby
     *                or to a informative message sent by the server during the game
     */
    public void printMessage(String message) {
        if (message == null)
            return;
        messagesText.setText(message);
    }


    /**
     * notifies that the boards from which you can choose have been loaded on the client's model and loads all
     * the images of the constraint on the board.
     */
    @Override
    public void notifyChooseBoard() {

        Platform.runLater(() -> {
            super.notifyChooseBoard();
            //Initializes the guiGameDrawer setting the css BoardStyle to the boards
            guiGameDrawer = new GUIGameDrawer(this,boardsBox,root);
            setChooseBoardVisibility();
            setChooseBoardVisibility();
        });
    }

    /**
     * tells to the server that the user wants to pass his turn, or that he has placed the die and not used
     * any of the tool cards.
     */
    @FXML
    void callPassCommand() {
        uiCommandParser.parseAndOperate(uiCommandParser.getCommandList().getPassCommands().get(0));
        guiGameDrawer.printCurrentPlayer(boardsBox);
    }


    /**
     * shows all the nodes needed to play the game and sets the listeners to the game by calling the relative method
     */
    @Override
    public void notifySetup(){
        Platform.runLater(()->{
            super.notifySetup();
            stringBuilder.setLength(0);

            //Shows the cards, the dicebag, the hand of the current player, and the roundtrack
            setSetupVisibility();
            //Prints the tool cards:
            guiGameDrawer.printSetupCards();
            //Prints the dicebagOwner
            guiGameDrawer.printDiceBagOwner();
            //Shows only the relevant boards
            guiGameDrawer.setBoardsVisibility(getNumOfPlayers(),boardsBox);
            //Prints the pool
            guiGameDrawer.printPool(poolDiceBox);
            //Prints the actual player
            guiGameDrawer.printCurrentPlayer(boardsBox);
            // Prints all the info regarding the boards
            guiGameDrawer.printBoards(boardsBox);
            //Prints the roundtrack
            guiGameDrawer.printRoundtrack(0);

            //Sets up the event listeners for the board, the tool cards, the buttons, the pool and the round track
            setEventListeners();
        });
    }

    /**
     * event that happens when the player wants to quit the game
     */
    @FXML
    void endGame() {
        setStillInGame(false);
        ConnectionManager.instance().sendMessage(new QuitMessage());
        setEndGame(true);
        ConnectionManager.instance().disconnect();
        guiLauncher.startMenu();
    }

    /** Event listener that is called when the player selects the first board among the ones
     *  shown by the server
     */
    @FXML
    void sendChooseBoard1ReplyMessage() {
        ConnectionManager.instance().sendMessage(new ChooseBoardReplyMessage(1));
        chooseBoard1Button.setVisible(false);
        chooseBoard2Button.setVisible(false);
        chooseBoard3Button.setVisible(false);
        chooseBoard4Button.setVisible(false);
    }

    /** Event listener that is called when the player selects the second board among the ones
     *  shown by the server
     */
    @FXML
    void sendChooseBoard2ReplyMessage() {
        ConnectionManager.instance().sendMessage(new ChooseBoardReplyMessage(2));
        chooseBoard1Button.setVisible(false);
        chooseBoard2Button.setVisible(false);
        chooseBoard3Button.setVisible(false);
        chooseBoard4Button.setVisible(false);
    }

    /** Event listener that is called when the player selects the third board among the ones
     *  shown by the server
     */
    @FXML
    void sendChooseBoard3ReplyMessage() {
        ConnectionManager.instance().sendMessage(new ChooseBoardReplyMessage(3));
        chooseBoard1Button.setVisible(false);
        chooseBoard2Button.setVisible(false);
        chooseBoard3Button.setVisible(false);
        chooseBoard4Button.setVisible(false);
    }

    /**
     * Event listener that is called when the player selects the fourth board among the ones
     *  shown by the server
     */
    @FXML
    void sendChooseBoard4ReplyMessage() {
        ConnectionManager.instance().sendMessage(new ChooseBoardReplyMessage(4));
        chooseBoard1Button.setVisible(false);
        chooseBoard2Button.setVisible(false);
        chooseBoard3Button.setVisible(false);
        chooseBoard4Button.setVisible(false);
    }


    /**
     * sent by the server every time that table needs to be updated.
     * All the nodes of the javafx application are updated when it is called
     */
    @Override
    public void  notifyChanged(){


        Platform.runLater(()-> {

            super.notifyChanged();

            //Deletes the messages in the gui when it's someone elses turn
            if(!getUsername().equals(getCurrentPlayer())){
                messagesText.setText("");
            }

            //Sets the dicebagOwner
            guiGameDrawer.printDiceBagOwner();

            //Prints the pool
            guiGameDrawer.printPool(poolDiceBox);

            //Prints the actual player
            guiGameDrawer.printCurrentPlayer(boardsBox);

            //Prints all the info regarding the the boards
            guiGameDrawer.printBoards(boardsBox);

            guiGameDrawer.printToolFavourPoints();

            //Prints the current elements in the hand of the player
            guiGameDrawer.printCurrent();

            //If you need to make a choice to use a tool card it shows you the choose buttons, otherwise not
            if(isActiveChoose() /*&& isSetupReady()*/) {
                guiGameDrawer.setChooseButtonsVisible();
            }else if(/*!*/isChooseBoardReady()){
                guiGameDrawer.setChooseButtonsInvisible();
            }

            guiGameDrawer.printRoundtrack(0);
        });
}

    /**
     * notifies that the game has terminated unexpectedly by moving to the menu scene and printing
     * an explanatory message
     */
    @Override
    public void notifyGameTerminated(){
        Platform.runLater(()->{
            super.notifyGameTerminated();
            guiLauncher.startMenu();
            guiMenuController.showGameTerminatedMessage();
        });
    }

    /**
     * the server handler invokes this method when the game is over.
     * @param playersAndScores contains each name and its relative score
     * @param isForfeitWin a boolean that tells if the game has finished even for all the players or not
     */
    @Override
    public void notifyEndGame(List<Couple<String, Integer>> playersAndScores, boolean isForfeitWin){
        Platform.runLater(()->{
            super.notifyEndGame(playersAndScores,isForfeitWin);
            guiLauncher.startRanking(playersAndScores,isForfeitWin);
        });
    }

    /**
     * called by the connection manager in case the type of connection has switch when there are only two players
     * in the game
     * or by the AbstractServerHandler when the server shuts down because the game is over
     */
    @Override
    public void gameClosed() {
        notifyGameTerminated();
    }


    /**
     * Sets up te visibility for the actual game
     */
    private void setSetupVisibility(){
        publicObjectiveBox.setVisible(true);
        privateObjectiveBox.setVisible(true);
        toolCardBox.setVisible(true);
        footerBoxes.setVisible(true);
        roundtrackDiceBox.setVisible(true);

        //Sets none of the choose buttons visible
        for (int i = 0; i < chooseButtons.getChildren().size()-1; i++) {
            chooseButtons.getChildren().get(i).setVisible(false);
        }
    }


    /**
     * Sets up the visibility for the choose board phase, which means that shows only the communication panel
     * and the four board among which the players can choose its.
     */
    private void setChooseBoardVisibility(){
        //Sets the dice in the boards:
        guiGameDrawer.printBoards(boardsBox);

        //Empties the stringBuilder and sets the chooseBoard message
        stringBuilder.setLength(0);
        printMessage("Scegli una tra le board disponibili");

        //Sets visible only the first 4 choose buttons
        for (int i = 0; i < chooseButtons.getChildren().size()-3; i++) {
            chooseButtons.getChildren().get(i).setVisible(true);
        }
    }


    /**
     * Sets up the visibility for the lobby, which consists only in the communication panel
     */
    private void setLobbyVisibility(){
        toolCardBox.setVisible(false);
        publicObjectiveBox.setVisible(false);
        privateObjectiveBox.setVisible(false);
        roundtrackDiceBox.setVisible(false);
        footerBoxes.setVisible(false);

        //Sets invisible all the choose buttons
        for (int i = 0; i < chooseButtons.getChildren().size()-1; i++) {
            chooseButtons.getChildren().get(i).setVisible(false);
        }
    }
}


