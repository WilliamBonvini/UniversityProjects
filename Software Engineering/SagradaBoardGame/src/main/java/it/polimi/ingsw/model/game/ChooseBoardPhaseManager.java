package it.polimi.ingsw.model.game;

import it.polimi.ingsw.connection.messages.server.ChooseBoardMessage;
import it.polimi.ingsw.exceptions.connection.UserNotFoundException;
import it.polimi.ingsw.globals.GamePreferences;
import it.polimi.ingsw.model.Board;
import it.polimi.ingsw.model.factories.BoardFactory;
import it.polimi.ingsw.utils.Couple;
import it.polimi.ingsw.utils.Logger;

import java.io.IOException;
import java.util.*;

/**
 * Manager which handle the phase of choosing boards for a GameManager
 */
public class ChooseBoardPhaseManager {

    private List<Couple<String, List<Integer>>> usersBoardsList;
    private List<Couple<String, Integer>> boardsIDForMatch;
    private GameManager gameManager;

    private boolean hasFinishedPhase;

    public ChooseBoardPhaseManager(int players, GameManager gm) {
        usersBoardsList = new ArrayList<>(players);
        boardsIDForMatch = new ArrayList<>(players);
        gameManager = gm;
        hasFinishedPhase = false;
    }

    /**
     * Create for each user in the list four associated boards to choose.
     * Also starts a timer for choose Phase. When timer ends, will choose the first board for each non-chosing player
     * @param users
     */
    public void setUpBoardsForUsers(Set<String> users) throws IOException {

        BoardFactory bf = new BoardFactory();
        for(String player: users) {
            List<Integer> boardIDs = new ArrayList<>(4);
            //extract two couples of boards and add their IDs to a list of integers
            Couple<Board, Board> boardCouple = bf.getBoardCouple();
            boardIDs.add(boardCouple.getFirst().getId());
            boardIDs.add(boardCouple.getSecond().getId());
            boardCouple = bf.getBoardCouple();
            boardIDs.add(boardCouple.getFirst().getId());
            boardIDs.add(boardCouple.getSecond().getId());

            //now add that list of integer to the boardPhaseManager and bind it with the name
            addUserBoardsCouple(new Couple<>(player, boardIDs));
        }

        startPhaseTimer();
    }

    private void startPhaseTimer() {
        Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                //at the end, set a default choice for each user who didn't choose
                fillChoices();
            }
        }, GamePreferences.chooseBoardPhaseTime());
    }


    /**
     * Make a default choice for the remaining users which didn't choose yet
     */
    private void fillChoices() {
        //for each user
        for (Couple<String, List<Integer>> c: usersBoardsList) {
            //if has not yet chosen, do a default choice for him
            if(!hasAlreadyChose(c.getFirst())) {
                setUserChoice(c.getFirst(), 1);
            }
        }
    }


    /**
     *
     * @param username
     * @return true if this user has already chose a board
     */
    private boolean hasAlreadyChose(String username) {
        for (Couple<String, Integer> c :
                boardsIDForMatch) {
            if (c.getFirst().equals(username))
                return true;
        }
        return false;
    }

    /**
     * The List of integer in the couple should be long 4
     * @param newCouple must contains the user name (the string in the couple), and the list of boards IDs for that player
     */
    private void addUserBoardsCouple(Couple<String, List<Integer>> newCouple) {
        usersBoardsList.add(newCouple);
    }

    /**
     * add to the chosen boards the one the player chose
     * @param user the username which made a choice
     * @param choice is the int that represent the index of the list stored in the {@code addUserBoardsCouple} method.
     *               Notice that choice index should go from 1 to 4. 0 Is default value for no choice
     */
    public synchronized void setUserChoice(String user, int choice) {
        //if the user already made a choice, return
        for (Couple<String, Integer> c : boardsIDForMatch) {
            if(c.getFirst().equals(user)) {
                Logger.std().info("user"+user+" already made a choice");
                return;
            }

        }

        //find the user in the list
        for(Couple<String, List<Integer>> couple : usersBoardsList) {
            if (couple.getFirst().equals(user)) {
                //now add the first element in the list if he didn't do a choice (0 is default value for no choice)
                if(choice <= 0 || choice > couple.getSecond().size())
                    boardsIDForMatch.add(new Couple<>(user, couple.getSecond().get(0)));
                //else add the specified choice
                else
                    boardsIDForMatch.add(new Couple<>(user, couple.getSecond().get(choice-1)));
                //if all choices are made and game is not already started, start it
                if(allChose() && !gameManager.isGameStarted()) {
                    hasFinishedPhase = true;
                    gameManager.startGame();
                }

                return;
            }
        }
        throw new UserNotFoundException();
    }

    /**
     * Generate a message to send to the user to choose his board
     * @param username
     * @return the message ready to be sent to the corresponding user
     * @throws UserNotFoundException if the user is not in the list of users
     */
    public ChooseBoardMessage generateMessage(String username) {
        //check the user is in
        for (Couple<String, List<Integer>> couple: usersBoardsList){
            if (couple.getFirst().equals(username)) {
                //generate an array of IDs
                int[] boardIDs = new int[couple.getSecond().size()];
                for (int i = 0; i < couple.getSecond().size(); i++) {
                    boardIDs[i] = couple.getSecond().get(i);
                }
                //return a message built with the ids in correct order
                return new ChooseBoardMessage(boardIDs);
            }
        }
        throw new UserNotFoundException();
    }

    /**
     *
     * @return true if all choices were made (by user or default with timeout)
     */
    public boolean allChose() {
        //if the size is the same,
        return boardsIDForMatch.size() == usersBoardsList.size();
    }

    /**
     * @return the couples of user-board built during the choice. Should be called when {@code allChose()} is true
     */
    public List<Couple<String,Integer>> getUserBoardCouples() {
        return boardsIDForMatch;
    }

    /**
     * force a choice for a specific user, if he has not already made one
     * @param username the user for who's needed to force a choice
     */
    protected void forceChoice(String username) {
        setUserChoice(username, 1);
    }

    /**
     * Check if the board phase is finished
     * @return
     */
    public boolean hasFinishedPhase() {
        return hasFinishedPhase;
    }

}
