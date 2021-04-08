package it.polimi.ingsw.connection.server;

import it.polimi.ingsw.connection.messages.server.GeneralMessage;
import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.exceptions.connection.UserNotFoundException;
import it.polimi.ingsw.model.factories.GameFactory;
import it.polimi.ingsw.globals.GamePreferences;
import it.polimi.ingsw.utils.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class Lobby {
    private List<AbstractClientHandler> clientsInLobby;
    private final ClientDispatcher clientDispatcher;
    private final long timeout;
    private final int maxPlayers;
    private LobbyTimer lobbyTimer;

    /**
     * Creates a new lobby. parameters for configuration are taken from GamePreferences
     * @param clientDispatcher which contains the lobby
     */
    public Lobby(ClientDispatcher clientDispatcher) {
        this.clientDispatcher = clientDispatcher;
        this.timeout = GamePreferences.lobbyTimeout();
        this.maxPlayers = GamePreferences.maxPlayers();
        clientsInLobby = new ArrayList<>(maxPlayers);
    }

    /**
     * add a user to the lobby
     * @param ach the new Abstract Client Handler
     * @return true if added correctly, false otherwise
     */
    public synchronized boolean addClient(AbstractClientHandler ach) {
        if(ach == null || ach.getUsername() == null || clientsInLobby.size()== maxPlayers)
            return false;
        //if the same user is in do not add
        for(AbstractClientHandler abstractClientHandler : clientsInLobby) {
            if (abstractClientHandler.getUsername().equals(ach.getUsername()))
                return false;
        }
        //add the client
        clientsInLobby.add(ach);
        //and if now the lobby is full, creates a new GameManager and empties itself
        updateOnEnter();
        //send messages to all
        notifyAllUsers(ach.getUsername()+" e' entrato in lobby di attesa");
        return true;
    }

    /**
     * remove the username specified from this lobby, notify others and eventually reset timer
     * @param username
     * @throws UserNotFoundException if the username is not found in this lobby
     */
    public synchronized void remove(String username) {
        for (int i = 0; i < clientsInLobby.size(); i++) {
            if(clientsInLobby.get(i).getUsername().equals(username)) {
                clientsInLobby.remove(i);
                notifyAllUsers(username + " ha lasciato la lobby di attesa");
                Logger.std().info("[LOBBY]: "+username + " left the lobby. "+clientsInLobby.size()+" user(s) left");
                updateOnExit();
                return;
            }
        }
        throw new UserNotFoundException();
    }


    public boolean isFull() {
        return clientsInLobby.size() == maxPlayers;
    }

    /**
     *
     * @param username
     * @return true if the user specified is in lobby
     */
    public boolean isIn(String username) {
        if(username != null){
            for(AbstractClientHandler ach: clientsInLobby) {
                if(ach.getUsername().equals(username))
                    return true;
            }
        }
        return false;
    }


    public List<String> getUsers() {
        List<String> usernames = new ArrayList<>(clientsInLobby.size());
        for (AbstractClientHandler ach: clientsInLobby) {
            usernames.add(ach.getUsername());
        }
        return usernames;
    }


    /**
     * Notify every user in lobby with the message passed
     * @param message
     */
    public synchronized void notifyAllUsers(String message) {
        for(AbstractClientHandler ach: clientsInLobby) {
            ach.sendMessage(new GeneralMessage(message));
        }
    }

    public void notifyAllUserExcept(String user, String message) {
        for(AbstractClientHandler ach: clientsInLobby) {
            if(!ach.getUsername().equals(user))
                ach.sendMessage(new GeneralMessage(message));
        }
    }

    /**
     * Update lobby and timer in event of someone exited from the lobby (called after removing the user)
     */
    private void updateOnExit() {
        //if size is 1 from 2 players, delete schedules from timer
        if(clientsInLobby.size() == 1) {
            lobbyTimer.cancelTimer();
            notifyAllUsers("Un giocatore rimasto, conto alla rovescia sospeso");
            Logger.std().info("[LOBBY]: Only one player in lobby, timer suspended");
        }
    }

    /**
     * Update lobby and timer in event of someone entered in the lobby (called after adding the user)
     */
    private void updateOnEnter() {
        //if the lobby is full, start a game and reset the timer
        if(isFull()) {
            startGame();
            //if from 1 to 2 players, start the timer and notify the players of this
        } else if(clientsInLobby.size()==2) {
            lobbyTimer = new LobbyTimer(timeout, GamePreferences.lobbyNotifyTime(), GamePreferences.lobbyLastNotifyTime());
            notifyAllUsers("Conto alla rovescia cominciato: "+ timeout/1000 + " secondi rimasti all'inizio della partita");
            Logger.std().verbose("[LOBBY]: Lobby timer started ("+timeout/1000+" secs)");
        }
    }

    private synchronized void startGame() {
        if(clientsInLobby.size() >=2) {
            notifyAllUsers("Tempo scaduto, partita cominciata!");
            clientDispatcher.startNewGame(GameFactory.createNewGame(clientsInLobby));
            clientsInLobby = new ArrayList<>();
        }
        lobbyTimer.cancelTimer();
    }


////////////PRIVATE TIMER CLASS

    /**
     * The timer used by the lobby. Starts the game and sends notifies on time left
     */
    private class LobbyTimer extends Timer{

        private final long totalSecTime;
        private final long periodSecTime;
        private final long lastNotifyTime;
        private int notifyCount;
        /**
         * Initializate and start this timer. All params are in millis
         * @param timeout the global timeout of the lobby. When it ends the game starts
         * @param notifyPeriod the time which passes between each notify for all users of how much time has left
         * @param lastNotify the time in millis BEFORE the main timer is called
         */
        private LobbyTimer(long timeout, long notifyPeriod, long lastNotify) {
            totalSecTime = timeout/1000;
            periodSecTime = notifyPeriod/1000;
            lastNotifyTime = lastNotify/1000;
            notifyCount = 1;
            //schedule the main timeout task
            this.schedule(new TimerTask() {
                @Override
                public void run() {
                    startGame();
                }
            }, timeout);

            //schedule the notify multiple times timer
            this.schedule(new TimerTask() {
                @Override
                public void run() {
                    notifyAllUsers((totalSecTime - periodSecTime*(notifyCount++)) + " secondi rimasti all'inizio della partita.");
                }
            }, notifyPeriod, notifyPeriod);

            //schedule the last notify
            this.schedule(new TimerTask() {
                @Override
                public void run() {
                    notifyAllUsers(lastNotifyTime + " secondi rimasti all'inizio della partita.");
                }
            }, timeout-lastNotify);
        }

        /**
         * after this the timer must be reinitializated
         */
        private void cancelTimer() {
            this.cancel();
            this.purge();
        }
    }
}
