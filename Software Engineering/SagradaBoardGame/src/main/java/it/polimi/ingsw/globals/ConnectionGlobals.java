package it.polimi.ingsw.globals;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.utils.Logger;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 * Global class which stores connection's parameters
 */
public class ConnectionGlobals {

    private static final ConnectionGlobals INSTANCE = new ConnectionGlobals(FilepathGlobals.CONNECTION_GLOBALS_PATH);

    private static final int DEF_RMI_PORT = 42022;
    private static final int DEF_SOCKET_PORT = 42021;
    private static final String DEF_RMI_URL_POSTFIX = "sagrada17";
    private static final long DEF_HEARTBEAT_MILLIS = 12000;
    private static final String DEF_RMI_URL = "//127.0.0.1:"+DEF_RMI_PORT+"/"+DEF_RMI_URL_POSTFIX;

    private int rmiPort;
    private int socketPort;
    private String rmiUrlPostfix;
    private long heartbeatMillis;
    private String rmiUrl;


    private ConnectionGlobals(String filepath) {
        try (Reader reader = new FileReader(filepath)) {
            Gson gson = new GsonBuilder().create();
            ConnectionGlobals loadedGlobals = gson.fromJson(reader, ConnectionGlobals.class);
            //set the variables from the loaded file
            loadFromOther(loadedGlobals);


        } catch (IOException |JsonSyntaxException e) {
            Logger.std().warning("Error while loading connection_globals.json file! will be used default values!");
            loadDefault();
        }
    }

    private void loadDefault() {
        rmiPort = DEF_RMI_PORT;
        socketPort = DEF_SOCKET_PORT;
        rmiUrlPostfix = DEF_RMI_URL_POSTFIX;
        heartbeatMillis = DEF_HEARTBEAT_MILLIS;
        rmiUrl = DEF_RMI_URL;
    }

    private void loadFromOther(ConnectionGlobals other) {
        if(other == null) {
            loadDefault();
            return;
        }
        rmiPort = (other.rmiPort >= 1 && other.rmiPort <= 65535) ? other.rmiPort : DEF_RMI_PORT;
        socketPort = (other.socketPort >= 1 && other.socketPort <= 65535) ? other.socketPort : DEF_SOCKET_PORT;
        rmiUrlPostfix = other.rmiUrlPostfix == null ? DEF_RMI_URL_POSTFIX : other.rmiUrlPostfix;
        heartbeatMillis = other.heartbeatMillis > 0 ? other.heartbeatMillis : DEF_HEARTBEAT_MILLIS;
        rmiUrl = other.rmiUrl == null ? DEF_RMI_URL : other.rmiUrl;
    }

    /**
     * @return the port's number used for connection with UI_TYPE_GUI and socket
     */
    public static final int getRMIPort() {
        return INSTANCE.rmiPort;
    }

    public static final int getSocketPort() { return INSTANCE.socketPort; }

    /**
     * @return the URL used for binding classes with rmi. Structure is:
     * '//[address]:[rmi port]/[postfix]' where the postfix is default one (sagrada17) or specified from file
     */
    public static final String rmiURL(String address) {
        return "//"+address+":"+getRMIPort()+"/" + INSTANCE.rmiUrlPostfix;
    }

    public static final String rmiURL() {
        return INSTANCE.rmiUrl;
    }

    public static final long getRMIHeartBeatMillis() {
        return INSTANCE.heartbeatMillis;
    }
}
