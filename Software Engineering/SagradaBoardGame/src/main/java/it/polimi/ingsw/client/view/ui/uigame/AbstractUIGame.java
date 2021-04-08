package it.polimi.ingsw.client.view.ui.uigame;

import it.polimi.ingsw.client.view.factories.ViewObjectiveFactory;
import it.polimi.ingsw.client.view.factories.ViewToolCardFactory;
import it.polimi.ingsw.client.view.viewelements.*;
import it.polimi.ingsw.client.view.ui.IUserInterface;
import it.polimi.ingsw.client.view.viewelements.ViewObjective;
import it.polimi.ingsw.exceptions.client.InvalidViewParameterException;
import it.polimi.ingsw.globals.ViewGlobals;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.utils.Couple;

import java.util.ArrayList;
import java.util.List;


/**
 * This class is the container of all the information needed by the user interfaces for displaying the game
 */
public abstract class AbstractUIGame implements IUserInterface {

    private ViewComponent[] pool;
    private ViewRoundTrack roundtrack;
    private ViewBoard[] boards;
    private int numOfPlayers;
    private String username;
    private String currentPlayer;
    private String diceBagOwner; // identifies the player who has the diceBagOwner in a certain round
    private ViewToolCard[] toolcards; //each int identifies one of the tool cards used in the game
    private ViewObjective[] publicObjectives; // each int identifies a publicObjectives used in the game
    private ViewObjective privateObjective; // identifies the privateObjective of the player
    private List<ViewComponent> currentPlayerHand;


    private boolean chooseBoardReady;
    private boolean setupReady;
    private boolean changed;
    private boolean endGame;

    //if is active a choice, and the id of the choice
    private boolean activeChoose;
    private int chooseId;

    private List<Couple<String, Integer>> playersAndScores;
    private boolean isForfeitWin;
    private boolean isStillInGame;

    //check if the game is terminated unexpectedly (e.g. server shutdown)
    private boolean gameTerminated;



    public AbstractUIGame() {
        isStillInGame = true;
        currentPlayer="";

        pool = new ViewComponent[9];
        for (int i = 0; i < 9; i++) {
            pool[i] = new ViewComponent(Color.NONE, Number.NONE);
        }

        roundtrack = new ViewRoundTrack(ViewGlobals.roundTrackRounds(), ViewGlobals.roundTrackMaxPileHeight());

        boards = new ViewBoard[4];
        for (int i = 0; i < 4; i++) {
            boards[i] = new ViewBoard();
        }

        toolcards = new ViewToolCard[3];
        for (int i = 0; i < toolcards.length; i++) {
            toolcards[i] = new ViewToolCard();
        }

        publicObjectives = new ViewObjective[3];
        for (int i = 0; i < 3; i++) {
            publicObjectives[i] = new ViewObjective();
        }

        currentPlayerHand = new ArrayList<>();

        privateObjective = new ViewObjective();

        chooseBoardReady = false;

        setupReady       = false;

        changed          = false;

        endGame          = false;
    }


    public abstract void start();

    public ViewComponent[] getPool() {
        return pool;
    }

    public int poolSize() {
        return pool.length;
    }

    public ViewRoundTrack getRoundtrack() {
        return roundtrack;
    }

    /**
     * @param i index that goes from 1 to num of boards in game (4 max default)
     * @return
     */
    public ViewBoard getBoard(int i) {
        return boards[i - 1];
    }

    public int boardSize() {
        return ViewGlobals.viewBoardSize();
    }

    public int numOfBoards() {
        return boards.length;
    }

    public String getDiceBagOwner() {
        return diceBagOwner;
    }

    public ViewToolCard[] getToolcards() {
        return toolcards;
    }

    /**
     *
     * @param num from 1 to num of tools in game (3 default)
     * @return
     */
    public ViewToolCard getToolCard(int num) {
        return toolcards[num-1];
    }

    public int numOfToolCards() {
        return toolcards.length;
    }

    public ViewObjective[] getPublicObjectives() {
        return publicObjectives;
    }

    public int numOfPublicObjectives() {
        return publicObjectives.length;
    }

    /**
     *
     * @param num from 1 to the num of objectives in game (3 default)
     * @return
     */
    public ViewObjective getPublicObjective(int num) {
        return publicObjectives[num-1];
    }

    public ViewObjective getPrivateObjective() {
        return privateObjective;
    }

    /**
     * changedPool aims to add or remove dice from the pool
     *
     * @param id  identifies the cell occupied by the die - goes from 1 to 9
     * @param die if has both Number and Color different from NONE it identifies the die that will be inserted in the id's position
     *            if has both Number and Color equals to NONE removes the die in the id's position
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void changedPool(int id, ViewComponent die) {
        if (    (id < 1 || id > 9) ||
                (die.getColor() == Color.NONE && die.getNumber()!=Number.NONE) ||
                (die.getNumber() == Number.NONE && die.getColor()!=Color.NONE)
            )
            throw new InvalidViewParameterException(); //the id value is not valid or the die has only one of his attributes set to NONE
        int i = id - 1;
        pool[i].setColor(die.getColor());
        pool[i].setNumber(die.getNumber());
    }


    /**
     * @param id  of the cell in the roundtrack, goes from 1 to 90
     * @param die if has both Number and Color different from NONE it identifies the die that will be inserted in the id's position
     *            *     if has both Number and Color equals to NONE removes the die in the id's position
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void changedRoundtrack(int id, ViewComponent die) {
        if (    (id < 1 || id > 90) ||
                (die.getColor() == Color.NONE && die.getNumber()!=Number.NONE) ||
                (die.getNumber() == Number.NONE && die.getColor()!=Color.NONE)
                )
            throw new InvalidViewParameterException(); //the id value is not valid or the die has only one of his attributes set to NONE
        roundtrack.setDie(id, die);
    }

    /**
     * changes the constraint in the cell identified by cellID of the board identified by boardPlayer
     *
     * @param boardPlayer   the name of the owner of the board
     * @param cellID        identifies a cell in a specific board (goes from 1 to 20)
     * @param newConstraint identifies the new constraint that will be put in the cell of the board instead of the old one
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void changedCellConstraint(String boardPlayer, int cellID, ViewComponent newConstraint) {
        if (cellID < 1 || cellID > 20 || (newConstraint.getColor() != Color.NONE && newConstraint.getNumber() != Number.NONE))
            throw new InvalidViewParameterException(); //the cellID value is not valid or the constraint is a double constraint

        for (int i = 0; i < 4; i++) {
            if (boards[i].getName().equals(boardPlayer)) {
                boards[i].getCell(cellID).setConstraint(newConstraint);
                return;
            }
        }
        throw new InvalidViewParameterException(); //there is no player whose username is the same of boardPlayer
    }


    /**
     * changes the die in the cell identified by cellID of the board identified by boardPlayer
     *
     * @param boardPlayer the name of the owner of the board
     * @param cellID      identifies a cell in a specific board (goes from 1 to 20)
     * @param newDie      identifies the new die that will be put in the cell of the board instead of the old one
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void changedCellDie(String boardPlayer, int cellID, ViewComponent newDie) {
        if (    (cellID < 1 || cellID > 20) ||
                (newDie.getColor() == Color.NONE && newDie.getNumber()!=Number.NONE) ||
                (newDie.getNumber() == Number.NONE && newDie.getColor()!=Color.NONE)
            )
            throw new InvalidViewParameterException(); //the CellID value is not valid or the die has just one attribute set to NONE


        for (int i = 0; i < 4; i++) {
            if (boards[i].getName().equals(boardPlayer)) {
                boards[i].getCell(cellID).setDie(newDie);
                return;
            }
        }
        throw new InvalidViewParameterException(); //there is no player whose username is the same of boardPlayer

    }

    /**
     * sets a name to a board in such a way the board can be identified by the name of the one the uses it
     *
     * @param boardID the id of the board that will be modified (goes from 1 to 4)
     * @param name    the name that will be set as a board's attribute
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void setBoardName(int boardID, String name) {
        if (boardID < 1 || boardID > 4)
            throw new InvalidViewParameterException(); //The BoardID value is not valid
        boards[boardID - 1].setName(name);
    }

    /**
     * changes the owner of the diceBagOwner, which means the one who will start playing the new round
     *
     * @param username the name of the player wanted to own the diceBagOwner
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void changedDiceBagOwner(String username) {
        for (int i = 0; i < 4; i++) {
            if (boards[i] != null && boards[i].getName().equals(username)) {

                this.diceBagOwner = username;
                return;
            }
        }

        throw new InvalidViewParameterException(); // there is no player whose name is the one passed as a parameter to the method

    }

    public void setUsername(String username){
        this.username=username;
    }

    public String getUsername(){
        return username;
    }

    /**
     * Set how much players there are in this game
     * @param numOfPlayers
     */
    public void setNumOfPlayers(int numOfPlayers) {
        this.numOfPlayers = numOfPlayers;
    }

    public int getNumOfPlayers() {
        return numOfPlayers;
    }

    /**
     * @param toolID  1 to 3
     * @param numTool 1 to 12
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void setToolCard(int toolID, int numTool) {
        if (toolID < 1 || toolID > 3)
            throw new InvalidViewParameterException(); //the int passed as parameters are not valid
        toolcards[toolID - 1] = ViewToolCardFactory.getToolCardById(numTool);
    }

    /**
     * @param objectiveID  1 to 3
     * @param numObjective 1 to 10
     * @throws InvalidViewParameterException
     */
    public void setPublicObjective(int objectiveID, int numObjective) {
        if (objectiveID < 1 || objectiveID > 3)
            throw new InvalidViewParameterException(); //the int passed as parameters are not valid
        publicObjectives[objectiveID - 1] = ViewObjectiveFactory.getViewObjectiveById(numObjective);
    }

    /**
     * @param numObjective 1 to 15
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void setPrivateObjective(int numObjective) {
        if (numObjective < 1 || numObjective > 15)
            throw new InvalidViewParameterException(); // because the int passed does not correspond to any actual PrivateObjective card
        privateObjective = ViewObjectiveFactory.getViewObjectiveById(numObjective);
    }

    /**
     * @param username       the username of the player whose favours will be changed
     * @param currentFavours the number of favours the player will have after the usage of this method (goes from 0 to 6)
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */

    public void changedUserFavours(String username, int currentFavours) {
        if (currentFavours < 0 || currentFavours > 6)
            throw new InvalidViewParameterException(); // because the currentFavours value is not valid

        for (int i = 0; i < 4; i++) {
            if (boards[i].getName().equals(username)) {
                boards[i].setFavours(currentFavours);
                return;
            }
        }
        throw new InvalidViewParameterException(); //because the name passed as parameter does not correspond to any of the names of the users
    }

    /**
     * @param id             goes from 1 to 3
     * @param currentFavours represents the number of favours that have been put on the particular tool card (must be positive)
     * @throws InvalidViewParameterException when the parameters passed are not valid
     */
    public void changedToolCardFavours(int id, int currentFavours) {
        if (id < 1 || id > 3 || currentFavours < 0)
            throw new InvalidViewParameterException(); //because the currentFavours value or the id value is not valid
        toolcards[id - 1].setNumFavourPoints(currentFavours);
    }

    public String getCurrentPlayer() {
        return currentPlayer;
    }

    public void changedCurrentPlayer(String currentPlayer) {
        if(!this.currentPlayer.equals(currentPlayer)){
            this.currentPlayer   = currentPlayer;
        }
    }


    /**
     *
     * @return true if it's time to choose the board, false if it's not time yet
     */
    public boolean isChooseBoardReady() {
        return chooseBoardReady;
    }

    /**
     * The server invokes this method when it's time for the player to choose his board
     */
    public void notifyChooseBoard() {
        chooseBoardReady = true;
    }

    /**
     *
     * @return true if it's time to receive the setup (get all the information needed to start the game), false if it's not time yet
     */
    public boolean isSetupReady(){
        return setupReady;
    }

    /**
     * The server handler invokes this method when it's time for the player to receive the setup (get all the
     * information needed to start the game). The setup could be a relog, so chooseBoard must be ready
     */
    public void notifySetup(){
        chooseBoardReady = true;
        setupReady = true;
    }

    /**
     *
     * @return true if the UI needs to be updated, false if not
     */
    public boolean isChanged(){
        return changed;
    }

    /**
     * the server handler invokes this method when a data has changed, and the players need to update their UI
     * If something changes when a choice is active, means the choice was made or the turn has passed,
     * either way there's no more a choice
     */
    public void notifyChanged(){
        changed=true;
    }

    public void setChanged(boolean changed){
        this.changed=changed;
    }
    /**
     * @return true if the game is over, false if not
     */
    public boolean isEndgame() {
        return endGame;
    }

    public void setEndGame(boolean endGame){
        this.endGame=endGame;
    }

    /**
     *the server handler invokes this method when the game is over.
     */
    public void notifyEndGame(List<Couple<String, Integer>> playersAndScores, boolean isForfeitWin){
        this.playersAndScores = playersAndScores;
        this.isForfeitWin = isForfeitWin;
        endGame=true;
    }

    public boolean isForfeitWin() {
        return isForfeitWin;
    }

    public List<Couple<String, Integer>> getPlayersAndScores() {
        return playersAndScores;
    }

    /**
     * the UIGame asks itself if is its turn
     * @return true if the username stored in the UIGame is the same as currentPlayer
     */
    public boolean isMyTurn() {
        return username.equals(currentPlayer);
    }



    /**
     * Set that a user has to make a precise choice, loaded from file and specified with the ID passed
     * @param choiceID the ID which identifies the choice
     */
    public void setChoice(int choiceID) {
        if(choiceID == 0) {
            activeChoose = false;
        } else if (isMyTurn()) {
            chooseId = choiceID;
            activeChoose = true;
        }
        else {
            printMessage(currentPlayer + " sta eseguendo una scelta...");
        }

    }


    /**
     * notify that the game has terminated unexpectedly
     */
    public void notifyGameTerminated() {
        gameTerminated = true;
        endGame = true;
    }

    public boolean isGameTerminated() {
        return gameTerminated;
    }

    public boolean isActiveChoose() {
        return activeChoose;
    }

    public int getChooseId() {
        return chooseId;
    }

    public void setStillInGame(boolean stillInGame) {
        this.isStillInGame = stillInGame;
    }

    public boolean isStillInGame() {
        return isStillInGame;
    }

    public List<ViewComponent> getCurrentPlayerHand() {
        return currentPlayerHand;
    }

    public void changedCurrentPlayerHand(List<ViewComponent> currentPlayerHand) {
        this.currentPlayerHand = currentPlayerHand;
    }
}