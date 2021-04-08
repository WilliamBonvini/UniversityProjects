package it.polimi.ingsw.connection.server.clienthandlers;

import it.polimi.ingsw.connection.messages.server.AbstractServerMessage;
import it.polimi.ingsw.connection.server.ClientDispatcher;
import it.polimi.ingsw.exceptions.connection.UserNotFoundException;
import it.polimi.ingsw.utils.Logger;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 * The abstract client handler. Handle a single user, with a generic connection
 */
public abstract class AbstractClientHandler extends UnicastRemoteObject {
    //if the user has correctly logged into the server
    protected boolean logged;
    protected String username;
    //true if there is effectively a connection: if the client disconnect and closes the socket, the ClientHandler
    //will remain alive and will respond as if the player is not playing
    protected boolean isOnline;

    private boolean heartBeatTracker = false;

    public AbstractClientHandler() throws RemoteException {
        logged = false;
        isOnline = true;
    }


    /**
     * Send a generic message to the client, in form of a AbstractServerMessage
     * @param message
     */
    public abstract void sendMessage(AbstractServerMessage message);

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setLogged(boolean logged) {
        this.logged = logged;
    }

    public boolean isLogged() {
        return logged;
    }

    public boolean isOnline() {
        return isOnline;
    }

    public void goOffline() {
        if(isOnline) {
            isOnline = false;
            try {
                //if the handler had a name, then means it was logged so it's important to notify the client handler
                if(getUsername()!= null)
                    ClientDispatcher.instance().notifyUserWentOffline(this);
            } catch (UserNotFoundException unfe) {
                Logger.std().info("User " + getUsername() + " went offline, but wasn't in a game");
            }
        }
    }

    public void heartbeat() {
        heartBeatTracker = !heartBeatTracker;
    }
}
