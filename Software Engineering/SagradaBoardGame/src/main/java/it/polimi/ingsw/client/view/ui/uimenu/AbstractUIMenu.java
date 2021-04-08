package it.polimi.ingsw.client.view.ui.uimenu;


import it.polimi.ingsw.client.view.ui.IUserInterface;

import java.util.Optional;

/**
 * This class purpose is to start the connection with the server, which can be made both with socket or RMI,
 * and log the player in
 *
 */
public abstract class AbstractUIMenu implements IUserInterface {
    /**
     * this string tells whether the ServerHandler should use socket connections or RMI
     */
    public static final String RMI = "r";
    public static final String SOCKET = "s";
    protected String username;

    private boolean isGameClosed = false;


    private Optional<String> connectionType;
    private Optional<String> ipAddress;
    private Optional<String> nickname;

    public AbstractUIMenu() {
        connectionType = Optional.empty();
        ipAddress = Optional.empty();
        nickname = Optional.empty();
    }


    public abstract void start();

    @Override
    public void gameClosed() {
        isGameClosed = true;
    }

    /**
     * @return a boolean that tells you if the game has shut down in an unexpected way
     */

    public boolean isGameClosed() {
        return isGameClosed;
    }

    public String getUsername(){
        return username;
    }

    public void setConnectionType(Optional<String> connectionType) {
        this.connectionType = connectionType;
    }

    public Optional<String> getConnectionType() {
        return connectionType;
    }

    public Optional<String> getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(Optional<String> ipAddress) {
        this.ipAddress = ipAddress;
    }

    public Optional<String> getNickname() {
        return nickname;
    }

    public void setNickname(Optional<String> nickname) {
        this.nickname = nickname;
    }

}
