package it.polimi.ingsw.client.view.ui.uigame.uiutils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.utils.Logger;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.Arrays;
import java.util.List;

/**
 * This class stores the recognised command prefixes used by the UICommandParser
 */
public class UICommandList {


    private String[] poolCommands;
    private String[] boardCommands;
    private String[] toolCommands;
    private String[] roundTrackCommands;
    private String[] helpCommands;
    private String[] quitCommands;
    private String[] passCommands;
    private String[] switchConnectionCommands;


    public UICommandList() {}

    public UICommandList(String filepath) {
        try (Reader reader = new FileReader(filepath)) {
            Gson gson = new GsonBuilder().create();
            UICommandList loadedCommandList = gson.fromJson(reader, UICommandList.class);
            //set the variables from the loaded file
            loadFromOther(loadedCommandList);


        } catch (IOException |JsonSyntaxException e) {
            Logger.std().warning("Errore nel caricamento dei comandi, verranno usati quelli default.");
            loadDefault();
        }
    }

    private void loadDefault() {
        poolCommands = defaultPoolCommands();
        boardCommands = defaultBoardCommands();
        toolCommands = defaultToolCommands();
        roundTrackCommands = defaultRoundTrackCommands();
        helpCommands = defaultHelpCommands();
        quitCommands = defaultQuitCommands();
        passCommands = defaultPassCommands();
        switchConnectionCommands = defaultSwitchConnectionCommands();

    }

    /**
     * load from the other UICommandList each argument, if has not size 0
     * @param other
     */
    private void loadFromOther(UICommandList other) {
        poolCommands = other.poolCommands.length == 0 ? defaultPoolCommands() : other.poolCommands;
        boardCommands = other.boardCommands.length == 0 ? defaultBoardCommands() : other.boardCommands;
        toolCommands = other.toolCommands.length == 0 ? defaultToolCommands() : other.toolCommands;
        roundTrackCommands = other.roundTrackCommands.length == 0 ? defaultRoundTrackCommands() : other.roundTrackCommands;
        helpCommands = other.helpCommands.length == 0 ? defaultHelpCommands() : other.helpCommands;
        quitCommands = other.quitCommands.length == 0 ? defaultQuitCommands() : other.quitCommands;
        passCommands = other.passCommands.length == 0 ? defaultPassCommands() : other.passCommands;
        switchConnectionCommands = other.switchConnectionCommands.length == 0 ?
                defaultSwitchConnectionCommands() : other.switchConnectionCommands;
    }

    private static final String[] defaultPoolCommands() {
        return new String[]{"riserva", "r", "pool", "p"};
    }

    private static final String[] defaultBoardCommands() {
        return new String[]{"vetrata", "v", "board", "b"};
    }

    private static final String[] defaultToolCommands() {
        return new String[]{"attrezzo", "a", "tool", "t"};
    }

    private static final String[] defaultRoundTrackCommands() {
        return new String[]{"tracciato","tr","roundtrack","rt"};
    }

    private static final String[] defaultHelpCommands() {
        return new String[] {"help","aiuto","h","?","info"};
    }

    private static final String[] defaultQuitCommands() {
        return new String[] {"quit"};
    }

    private static final String[] defaultPassCommands() {
        return new String[] {"passa", "pass", "skip", "fine", "f"};
    }

    private static final String[] defaultSwitchConnectionCommands() {
        return new String[] {"switch", "cambia", "riconnetti"};
    }


    public List<String> getHelpCommands() {
        return Arrays.asList(helpCommands);
    }

    public List<String> getQuitCommands() {
        return Arrays.asList(quitCommands);
    }

    public List<String> getPassCommands() {
        return Arrays.asList(passCommands);
    }

    public List<String> getBoardCommands() {
        return Arrays.asList(boardCommands);
    }

    public List<String> getPoolCommands() {
        return Arrays.asList(poolCommands);
    }

    public List<String> getToolCommands() {
        return Arrays.asList(toolCommands);
    }

    public List<String> getRoundTrackCommands() {
        return Arrays.asList(roundTrackCommands);
    }

    public List<String> getSwitchConnectionCommands() {
        return Arrays.asList(switchConnectionCommands);
    }

    /**
     * @param command
     * @return true if command is recognised as a Pool command
     */
    public boolean isPoolCommand(String command) {
        if(command == null || command.length() == 0)
            return false;
        for (int i = 0; i < poolCommands.length; i++) {
            if(command.equalsIgnoreCase(poolCommands[i]))
                return true;
        }
        return false;
    }

    /**
     * @param command
     * @return true if command is recognised as a Board command. Ignore case
     */
    public boolean isBoardCommand(String command) {
        if(command == null || command.length() == 0)
            return false;
        for (int i = 0; i < boardCommands.length; i++) {
            if(command.equalsIgnoreCase(boardCommands[i]))
                return true;
        }
        return false;
    }

    /**
     * @param command
     * @return true if command is recognised as a RoundTrack command. Ignore case
     */
    public boolean isRoundTrackCommand(String command) {
        if(command == null || command.length() == 0)
            return false;
        for (int i = 0; i < roundTrackCommands.length; i++) {
            if(command.equalsIgnoreCase(roundTrackCommands[i]))
                return true;
        }
        return false;
    }

    /**
     * @param command
     * @return true if command is recognised as a Tool command. Ignore case
     */
    public boolean isToolCommand(String command) {
        if(command == null || command.length() == 0)
            return false;
        for (int i = 0; i < toolCommands.length; i++) {
            if(command.equalsIgnoreCase(toolCommands[i]))
                return true;
        }
        return false;
    }

    /**
     * @param command
     * @return true if command is recognised as a Tool command. Ignore case
     */
    public boolean isHelpCommand(String command) {
        if(command == null || command.length() == 0)
            return false;
        for (int i = 0; i < helpCommands.length; i++) {
            if(command.equalsIgnoreCase(helpCommands[i]))
                return true;
        }
        return false;
    }

    /**
     * @param command the command to recognise
     * @return true if command is recognised as a Tool command. Ignore case
     */
    public boolean isQuitCommand(String command) {
        if(command == null || command.length() == 0)
            return false;
        for (int i = 0; i < quitCommands.length; i++) {
            if(command.equalsIgnoreCase(quitCommands[i]))
                return true;
        }
        return false;
    }

    /**
     * @param command the command to recognise
     * @return true if command is recognised as a pass command. Ignore case
     */
    public boolean isPassCommand(String command) {
        if(command == null || command.length() == 0)
            return false;
        for (int i = 0; i < passCommands.length; i++) {
            if(command.equalsIgnoreCase(passCommands[i]))
                return true;
        }
        return false;
    }

    /**
     * @param command the command to recognise
     * @return true if command is recognised as a switch connection command. Ignore case
     */
    public boolean isSwitchConnectionCommand(String command) {
        if(command == null || command.length() == 0)
            return false;
        for (int i = 0; i < switchConnectionCommands.length; i++) {
            if(command.equalsIgnoreCase(switchConnectionCommands[i]))
                return true;
        }
        return false;
    }


}
