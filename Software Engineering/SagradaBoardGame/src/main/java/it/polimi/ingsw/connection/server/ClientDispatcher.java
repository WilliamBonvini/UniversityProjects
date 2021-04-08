package it.polimi.ingsw.connection.server;

import it.polimi.ingsw.connection.messages.server.GeneralMessage;
import it.polimi.ingsw.globals.ConnectionGlobals;
import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.exceptions.connection.UserIsOnlineException;
import it.polimi.ingsw.exceptions.connection.UserNotFoundException;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Logger;
import it.polimi.ingsw.utils.StringVerifier;

import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.util.ArrayList;
import java.util.List;

/**
 * Singleton.
 * Create the threads which will listen for RMI and Socket connections, and manage where to send a user when is logged
 * or registered, or when goes offline
 */
public class ClientDispatcher {

    private static final int MIN_NICKNAME_LENGTH = 3;
    private static final int MAX_NICKNAME_LENGTH = 15;

    private final Logger logger = new Logger("[Client Dispatcher] ");
    private static final ClientDispatcher CD = new ClientDispatcher();
    IRMIListener rmiListenerInterface;
    //number of currently active games
    private List<GameManager> activeGames;
    //number of game started
    private int gamesStarted;
    private Lobby waitingLobby;


    private StringVerifier nicknameVerifier;

    public static ClientDispatcher instance() {
        return CD;
    }

    private ClientDispatcher() {
        logger.setColorMode(false);
        nicknameVerifier = new StringVerifier(MIN_NICKNAME_LENGTH, MAX_NICKNAME_LENGTH, true,
                true, true, '_');
        waitingLobby = new Lobby(this);
        activeGames = new ArrayList<>();
        gamesStarted = 0;
    }

    /**
     * Start the Client Dispatcher. It will listen for RMI and Socket connections
     */
    public void start() {
        logger.info(" started");
        startRMI();
        startSocket();
    }

    /**
     * Create registry and bind the RMIListener
     */
    private void startRMI() {
        try {
            //create and bind rmiListener for UI_TYPE_GUI connections
            logger.info("Creating RMI register...");
            LocateRegistry.createRegistry(ConnectionGlobals.getRMIPort());
            rmiListenerInterface= new RMIListener();
            logger.info("Binding the RMI Listener...");
            Naming.rebind(ConnectionGlobals.rmiURL(), rmiListenerInterface);
            logger.info("Listener binded correctly on '" + ConnectionGlobals.rmiURL() + "'");

        } catch (RemoteException e) {
            logger.error("Could not bind RMI Listener!");
        } catch (MalformedURLException e) {
            logger.error("RMI URL malformed!");
        }
    }

    /**
     * Create SocketListener Thread and starts it
     */
    private void startSocket() {
        //start the Socket Listener Thread
        try {
            logger.info("Starting Socket Listener...");
            new SocketListener(ConnectionGlobals.getSocketPort()).start();
            logger.info("Socket Listener started");
        } catch (IOException e) {
            logger.error("Error while starting socket listener!");
        }
    }


    /**
     * Start and add to its list of GameManagers a new GameManager.
     * @param gm the new game
     */
    public synchronized void startNewGame(GameManager gm) {
        if (gm == null)
            return;
        activeGames.add(gm);
        gm.setGameID(gamesStarted++);
        gm.start();
        logger.info("GAME #"+gm.getGameID()+" STARTED! Players: "+gm.getClientContainer().toString());
    }


    /**
     * Close a game, by removing it from the activeGameList
     * @param gm
     */
    public void closeGame(GameManager gm) {
        if(gm == null)
            return;
        if(activeGames.contains(gm)) {
            activeGames.remove(gm);
        }
        logger.info("Closed Game #" + gm.getGameID());
    }


    /**
     * A request for login made by a client handler, which has to pass himself as reference.
     * This method also bind the username to the client handler and set its status to logged if the login is successful
     * @param username
     * @param clientHandler the clientHandler who request to log in.
     * @return true if logged correctly, meaning also that the username has been bound to the clientHandler passed,
     * false if there's already a user online and the login fails
     */
    public synchronized boolean login(String username, AbstractClientHandler clientHandler) {
        //if it's already online return false
        if(isOnline(username)) {
            logger.info("User tried to log with username currently online ("+username+")");
            return false;
            //if the user is found, but is offline, then retrieve him from manager and add him to its game Manager
            //and set him online
        } else if(isInGame(username)) {
            logger.info("User in game offline (" + username + ") has relogged");
            clientHandler.setUsername(username);
            relogClientHandler(clientHandler);
            clientHandler.setLogged(true);
            return true;

            //if the user has not a valid nickname (e.g. too long) do not register him
        } else if (!nicknameVerifier.verifyString(username)) {
            clientHandler.sendMessage(new GeneralMessage("Nickname non valido! minimo "+ MIN_NICKNAME_LENGTH +
                ", massimo "+ MAX_NICKNAME_LENGTH +" caratteri di lunghezza. Permessi numeri, lettere e underscore"));
            //if the user is not found then add a new ClientHandler with its nickname to the lobby
        } else {
            clientHandler.setUsername(username);
            //add him to the lobby and if done correctly set him logged and save its data if is a new player
            if(waitingLobby.addClient(clientHandler)) {
                logger.info("User '" + username + "' entered in the lobby");
                clientHandler.setLogged(true);
                return true;
            }
            else //if not reset the name of the client handler to null
                clientHandler.setUsername(null);

        }
        return false;
    }


    /**
     * notify the client dispatcher that the specified user/client handler has gone offline, therefore the dispatcher can
     * update a game
     * @param ach the client handler which is now offline
     * @throws UserNotFoundException if the user contained in the client handler passed is not online
     * @throws UserIsOnlineException if the client handler is still online
     */
    public void notifyUserWentOffline(AbstractClientHandler ach)  {

        checkAchOkForUserOffline(ach);

        //the name is hence valid and in some game or in lobby: notify who contains it
        //search in lobby
        if(isInLobby(ach.getUsername())) {
            waitingLobby.remove(ach.getUsername());
            return;
            //search in a game
        } else if (isInGame(ach.getUsername())) {
            for(GameManager gm: activeGames) {
                //check if is in the selected game
                if(gm.getClientContainer().isIn(ach.getUsername())) {
                    //if is online, throw exception
                    if(gm.getClientContainer().isOnline(ach.getUsername())) {
                        throw new UserIsOnlineException();
                        //if is correctly offline, then notify the gameManager of this
                    } else {
                        gm.notifySomeoneOffline(ach.getUsername());
                        return;
                    }

                }
            }
        }
        throw new UserNotFoundException();
    }

    private void checkAchOkForUserOffline(AbstractClientHandler ach) {
        //if there's no nickname or the nickname of ach is not in lobby or in a game, throw exception
        if(ach == null || ach.getUsername() == null ||
                (!isInLobby(ach.getUsername()) && !isInGame(ach.getUsername()) )
                ) {
            if(ach!= null)
                logger.warning("User "+ach.getUsername()+" tried to go offline but was not found in a game or in lobby");
            throw new UserNotFoundException();
        }
        //if is online, throw exception
        if(ach.isOnline())
            throw new UserIsOnlineException();
    }


    /**
     * Ask if the username passed is in the current waiting lobby
     * @param username
     * @return true if is in the lobby, false otherwise
     */
    public boolean isInLobby(String username) {
        return waitingLobby.isIn(username);
    }

    /**
     * @return a list containing the usernames of the users in lobby
     */
    public List<String> getUsersInLobby() {
        return waitingLobby.getUsers();
    }



    /**
     * Check if a user is online, in lobby or in one of the current active games
     * @param username
     * @return true if the username is online, false otherwise
     */
    public boolean isOnline(String username) {
        if(username == null)
            return false;
        //check if is in lobby
        if(waitingLobby.isIn(username))
            return true;

        //check if is in one of the games, and if it is, if it's online
        for(GameManager gm : activeGames) {
            if(gm.getClientContainer().isIn(username) && gm.getClientContainer().isOnline(username))
                return true;
        }
        //if not found online, false
        return false;
    }


    /**
     * ask if this user if in a game playing now
     * @param username the user
     * @return true if is in one of the games
     */
    public boolean isInGame(String username) {
        for(GameManager gm: activeGames) {
            if(gm.getClientContainer().isIn(username))
                return true;
        }
        return false;
    }

    /**
     * Get the {@code GameManager} which contains the specified user
     * @param username the username of the player which is in a game
     * @return the GameManager which contains the specified user, if there is one
     * @throws UserNotFoundException if the user is not found in an active game of the Dispatcher
     */
    public GameManager getGameOf(String username) {
        for(GameManager gm: activeGames) {
            if(gm.hasPlayer(username))
                return gm;
        }
        throw new UserNotFoundException();
    }


    /**
     * Relog in an existing game this user, through its new client handler. Is supposed the check of its belonging to
     * a game is already made
     * @param clientHandler
     * @throws UserIsOnlineException if the clientHandler to replace is online now
     */
    private boolean relogClientHandler(AbstractClientHandler clientHandler) {
        for(GameManager gm: activeGames) {
            if(gm.getClientContainer().isIn(clientHandler.getUsername())) {
                gm.getClientContainer().replaceClientHandler(clientHandler);
                gm.notifySomeoneRelog(clientHandler.getUsername());
                return true;
            }
        }
        return false;
    }

}
