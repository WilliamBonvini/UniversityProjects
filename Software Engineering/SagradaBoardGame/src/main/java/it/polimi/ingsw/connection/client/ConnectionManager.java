package it.polimi.ingsw.connection.client;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.connection.messages.client.LoginMessage;
import it.polimi.ingsw.globals.ConnectionGlobals;
import it.polimi.ingsw.connection.messages.client.AbstractClientMessage;
import it.polimi.ingsw.connection.server.IRMIListener;
import it.polimi.ingsw.exceptions.connection.UnavailableConnectionException;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

/**
 * Singleton. For Client is the reference to connect, disconnect and send messages to the Server
 */
public class ConnectionManager {

    private static final ConnectionManager INSTANCE = new ConnectionManager();
    private AbstractServerHandler serverHandler;

    private static final String TYPE_RMI = "rmi";
    private static final String TYPE_SOCKET = "socket";

    private boolean waitForAnswer;
    private String loggedUsername;
    private String connectedIP;
    private String connectionType;

    private boolean logged;
    private boolean isConnected;

    private IRMIListener irmiListener;

    private ConnectionManager() {
        waitForAnswer = false;
        logged = false;
        isConnected = false;
    }

    /**
     * get the singleton
     * @return the singleton
     */
    public static ConnectionManager instance() {
        return INSTANCE;
    }

    /**
     * send a message to the server
     * @param message
     */
    public void sendMessage(AbstractClientMessage message) {
        serverHandler.sendMessage(message);
    }

    /**
     * Retrieve stored messages from server, if there are any
     * @return
     */
    public List<String> retrieveMessages() {
        return serverHandler.retrieveMessages();
    }

    /**
     * Connect the UIManager with socket to the server
     * @param ip the ip address used for connection
     * @throws UnavailableConnectionException if the connection fails
     */
    public void connectWithSocket(String ip) throws UnavailableConnectionException {
        try {
            serverHandler = new SocketServerHandler(ip);
            isConnected = true;
            connectedIP = ip;
            connectionType = TYPE_SOCKET;
        } catch (RemoteException e) {
            throw new UnavailableConnectionException();
        }
    }

    /**
     * Connect the UIManager with RMI to the server
     * @param ip the ip address used for connection
     * @throws UnavailableConnectionException if the connection fails
     */
    public void connectWithRMI(String ip) throws UnavailableConnectionException {
        try {
            irmiListener = (IRMIListener) Naming.lookup(ConnectionGlobals.rmiURL(ip));
            serverHandler = new RMIServerHandler();
            isConnected = true;
            connectedIP = ip;
            connectionType = TYPE_RMI;
        } catch (NotBoundException | MalformedURLException | RemoteException e) {
            throw new UnavailableConnectionException();
        }

    }


    /**
     * Switch the connection from RMI to Socket and vice versa
     */
    public void switchConnection() {
        serverHandler.setSilentMode(true);
        isConnected = false;
        logged = false;
        waitForAnswer = false;
        serverHandler.disconnect();
        try {
            if(connectionType.equals(TYPE_RMI)) {

                connectWithSocket(connectedIP);
                Thread.sleep(1500);
                serverHandler.sendMessage(new LoginMessage(loggedUsername));
                for (int i = 0; i < 5 && !logged; i++) {
                    serverHandler.sendMessage(new LoginMessage(loggedUsername));
                    Thread.sleep(1500);
                }
            }
            else {
                connectWithRMI(connectedIP);
                serverHandler.sendMessage(new LoginMessage(loggedUsername));
            }

        } catch (UnavailableConnectionException | InterruptedException e) {
            UIManager.instance().getUIGame().gameClosed();
        }
        UIManager.instance().getUIGame().printMessage("Ti sei riconnesso correttamente con " + connectionType);


    }

    /**
     * disconnect from server
     */
    public void disconnect() {
        isConnected = false;
        logged = false;
        waitForAnswer = false;
        serverHandler.disconnect();
        serverHandler = null;
        loggedUsername = null;
        connectedIP = "";
    }



    public IRMIListener getIrmiListener() {
        return irmiListener;
    }


    public String getLoggedUsername() {
        return loggedUsername;
    }

    public void setLoggedUsername(String loggedUsername) {
        this.loggedUsername = loggedUsername;
    }

    public boolean isWaitingForAnswer() {
        return waitForAnswer;
    }

    public boolean isNotWaitingForAnswer() { return !waitForAnswer; }

    public void setWaitForAnswer(boolean waitForAnswer) {
        this.waitForAnswer = waitForAnswer;
    }

    public boolean isLogged() {
        return logged;
    }

    public void setLogged(boolean logged) {
        this.logged = logged;
    }

    public boolean isConnected() {
        return isConnected;
    }
}
