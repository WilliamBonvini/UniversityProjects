package it.polimi.ingsw.model.game;

import it.polimi.ingsw.connection.messages.server.GeneralMessage;
import it.polimi.ingsw.controller.IDView;
import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.globals.GamePreferences;
import it.polimi.ingsw.globals.ModelGlobals;

import java.util.*;

/**
 * Handles the timers of players' turns. When started, will automatically start the timers.
 * Must be notified when a player's new turn occur, to reset the timer and check the new current player.
 * Also keeps a blacklist for users who didn't play in their turn. For these, the turn won't be playable.
 * If such user returns active must be notified to reset the timer to its original duration
 */
public class TurnManager {

    private GameManager gameManager;
    private List<String> blacklistedPlayers;

    private Timer timer;
    private boolean isTimerActive;

    private long totalTurnTime;
    private long turnEndAlertTime;

    /**
     * Create a TurnManager with the players specified
     * @param gameManager the gameManager which contains the flow used to check the current player
     *                    and make the flow pass the turn when needed. Also used to send notifications for turn ending
     */
    public TurnManager(GameManager gameManager) {
        this.gameManager = gameManager;
        blacklistedPlayers = new ArrayList<>();
        timer = new Timer();
        isTimerActive = false;
        totalTurnTime = GamePreferences.turnTime();
        turnEndAlertTime = GamePreferences.turnEndAlertTime();
    }


    /**
     * notify that a new turn is started.
     */
    public void startNewTurn() {
        //first stop the old timer
        if(isTimerActive) {
            isTimerActive = false;
            timer.cancel();
            timer.purge();
        }

        //now check the current player, and pass the turn if is blacklisted
        String player = gameManager.getFlow().getMicroOperationVariables().getCurrentPlayer().orElseThrow(CantAccessPlayerException::new).getName();
        if(blacklistedPlayers.contains(player))
            passTurn(player);
        //else set up his timer
        else
            setUpTimer(player);

    }

    /**
     * Pass the turn for the specified player
     * @param player if is the current player the turn will be passed. Otherwise not
     * @param toBlacklist true if is a pass due to time ended, so the player is to blacklist, false otherwise
     */
    private void passTurn(String player, boolean toBlacklist) {
        gameManager.getFilter().addTarget(new IDView(gameManager, player, ModelGlobals.componentPass(), 0));
        //if is to blacklist and is not already in, add it to the list
        if(toBlacklist && !blacklistedPlayers.contains(player)) {
            blacklistedPlayers.add(player);
        }
    }


    /**
     * Do an active pass turn. A user calls this method, and hence won't be blacklisted
     * @param player the player which calls this method
     */
    public synchronized void passTurn(String player) {
        passTurn(player, false);
    }


    /**
     * Add a set of player to the blacklist of this manager, to make their turn skip. If one or more are already in will not
     * be added. Also will skip current turn if is of a blacklisted player
     * @param playersToBlackList
     */
    public void blacklist(List<String> playersToBlackList) {
        for (String playerName :
                playersToBlackList) {
            if (!blacklistedPlayers.contains(playerName)) {
                blacklistedPlayers.add(playerName);
                passTurn(playerName, false);
            }
        }
    }


    /**
     * Unblacklists a player, because he notified he's online again, or reconnected
     * @param player the player which returns active. If wasn't blacklisted this method won't do anything
     */
    public void returnActive(String player) {
        if(blacklistedPlayers.contains(player))
            blacklistedPlayers.remove(player);
    }


    /**
     * Set up the timer for the specified player's turn
     * @param playerName
     */
    private void setUpTimer(String playerName) {
        timer = new Timer();
        final boolean isBlacklisted = blacklistedPlayers.contains(playerName);

                //set the total turn time task
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                //at the end, automatically passes the turn and blacklists the player
                passTurn(playerName, isBlacklisted ? false : true);
                //duration based on if is blacklisted or not
            }
        }, totalTurnTime);

        //set the alert timer, if not a blacklisted user

        timer.schedule(new TimerTask() {
                @Override
                public void run() {
                    gameManager.getClientContainer().sendMessageTo(playerName,
                            new GeneralMessage(turnEndAlertTime / 1000 + " secondi rimasti alla fine del turno!"));
                }
                }, totalTurnTime - turnEndAlertTime);

        isTimerActive = true;
    }

    public void setTotalTurnTime(long totalTurnTime) {
        this.totalTurnTime = totalTurnTime;
    }

    public void setTurnEndAlertTime(long turnEndAlertTime) {
        this.turnEndAlertTime = turnEndAlertTime;
    }

    /**
     * Set both the total time in a turn, and the time of alert at the end of the turn
     * @param totalTurnTime
     * @param turnEndAlertTime
     */
    public void setTimes(long totalTurnTime, long turnEndAlertTime) {
        setTotalTurnTime(totalTurnTime);
        setTurnEndAlertTime(turnEndAlertTime);
    }
}
