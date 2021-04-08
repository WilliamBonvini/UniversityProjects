package it.polimi.ingsw.globals;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.utils.Logger;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 * Global class for game preferences, server-side
 */
public class GamePreferences {
    private static final int DEF_MAX_PLAYERS = 4;
    private static final int DEF_LOBBY_TIMEOUT = 120000;
    private static final int DEF_LOBBY_NOTIFY_TIME = 15000;
    private static final int DEF_LOBBY_LAST_NOTIFY_TIME = 3000;
    private static final int DEF_TURN_TIME = 60000;
    private static final int DEF_TURN_END_ALERT_TIME = 15000;
    private static final int DEF_CHOOSE_BOARD_TIME = 30000;

    private int maxPlayers;
    private long lobbyTimeout;
    private long lobbyNotifyTime;
    private long lobbyLastNotifyTime;
    //time given for a turn
    private long turnTime;
    //time before end of turn when the user is notified of remaining time
    private long turnEndAlertTime;
    //the time for the choice of board phase
    private long chooseBoardTime;

    private static final GamePreferences instance = new GamePreferences(FilepathGlobals.GAME_PREFERENCES_PATH);


    private GamePreferences(String filepath) {
        try (Reader reader = new FileReader(filepath)) {
            Gson gson = new GsonBuilder().create();
            GamePreferences loadedGlobals = gson.fromJson(reader, GamePreferences.class);
            //set the variables from the loaded file
            loadFromOther(loadedGlobals);


        } catch (IOException |JsonSyntaxException e) {
            Logger.std().warning("Error while loading game_preferences.json file! will be used default values!");
            loadDefault();
        }

    }




    private void loadDefault() {
        maxPlayers = DEF_MAX_PLAYERS;
        lobbyTimeout = DEF_LOBBY_TIMEOUT;
        lobbyNotifyTime = DEF_LOBBY_NOTIFY_TIME;
        lobbyLastNotifyTime = DEF_LOBBY_LAST_NOTIFY_TIME;
        turnTime = DEF_TURN_TIME;
        turnEndAlertTime = DEF_TURN_END_ALERT_TIME;
        chooseBoardTime = DEF_CHOOSE_BOARD_TIME;
    }

    private void loadFromOther(GamePreferences other) {
        maxPlayers = other.maxPlayers == 0 ? DEF_MAX_PLAYERS : other.maxPlayers;
        lobbyTimeout = other.lobbyTimeout == 0 ? DEF_LOBBY_TIMEOUT : other.lobbyTimeout;
        lobbyNotifyTime = other.lobbyNotifyTime == 0 ? DEF_LOBBY_NOTIFY_TIME : other.lobbyNotifyTime;
        lobbyLastNotifyTime = other.lobbyLastNotifyTime;
        turnTime = other.turnTime == 0 ? DEF_TURN_TIME : other.turnTime;
        turnEndAlertTime = other.turnEndAlertTime == 0 ? DEF_TURN_END_ALERT_TIME : other.turnEndAlertTime;
        if(turnEndAlertTime > turnTime)
            turnEndAlertTime = turnTime;
        chooseBoardTime = other.chooseBoardTime == 0 ? DEF_CHOOSE_BOARD_TIME : other.chooseBoardTime;
    }


    public static final int maxPlayers() {
        return instance.maxPlayers;
    }

    /**
     *
     * @return the timeout in millis
     */
    public static final long lobbyTimeout() {
        return instance.lobbyTimeout;
    }

    public static final long lobbyNotifyTime() {
        return instance.lobbyNotifyTime;
    }

    public static final long lobbyLastNotifyTime() {
        return instance.lobbyLastNotifyTime;
    }

    /**
     *
     * @return the max time given for a turn
     */
    public static final long turnTime() {
        return instance.turnTime;
    }

    /**
     * @return the time in millis, before the turn ends, when the player should be alerted of remaining time
     */
    public static final long turnEndAlertTime() {
        return instance.turnEndAlertTime;
    }


    /**
     * @return the time in millis given for the choose board phase
     */
    public static final long chooseBoardPhaseTime() {
        return instance.chooseBoardTime;
    }


}
