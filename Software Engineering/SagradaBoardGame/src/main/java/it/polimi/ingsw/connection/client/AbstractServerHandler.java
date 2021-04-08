package it.polimi.ingsw.connection.client;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.connection.messages.client.AbstractClientMessage;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;

/**
 * Abstract class which communicate with the server and manage messages to and from it
 */
public abstract class AbstractServerHandler extends UnicastRemoteObject{

    private List<String> storedMessages;
    private boolean isConnected;

    private boolean silentMode;


    private boolean heartBeatTracker = false;

    public AbstractServerHandler() throws RemoteException {
        storedMessages = new ArrayList<>();
        isConnected = true;
        silentMode = false;
    }


    /**
     * Send a message to the server
     * @param message the sent message
     */
    public abstract void sendMessage(AbstractClientMessage message);

    /**
     * Store a message in this client handler. Is useful to call if the ConnectionManager's instance is waiting for
     * an answere, therefore is better storing the messages from the server, as the client will retrieve them after
     * has received an answer
     * @param message the stored message
     */
    public void storeMessage(String message) {
        storedMessages.add(message);
    }

    /**
     * Retrieve, if there are any, the messages stored by the client handler. Generally messages are stored because
     * the client is waiting for an answer and the messages generated in the middle are to be read after the answer.
     * This method also empties the list of messages stored by this server handler
     * @return the list of message stored by this handler. Never null but possibly empty
     */
    public List<String> retrieveMessages() {
        List<String> res = storedMessages;
        storedMessages = new ArrayList<>();
        return res;
    }


    /**
     * notify that the game is closed, if not in silent mode
     */
    public void serverClosed() {
        if(!silentMode && UIManager.instance().hasFocusUI())
            UIManager.instance().getFocusUI().gameClosed();
    }

    public abstract void disconnect();

    protected void setDisconnected() {
        isConnected = false;
    }

    public boolean isConnected() {
        return isConnected;
    }

    /**
     * set the silent mode on or off. If on will not notify anyone if this server handler closes
     * @param silentMode
     */
    public void setSilentMode(boolean silentMode) {
        this.silentMode = silentMode;
    }

    public void heartbeat() {
        heartBeatTracker = !heartBeatTracker;
    }
}
