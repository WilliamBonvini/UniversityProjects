package it.polimi.ingsw.globals;

/**
 * Globals class which is the reference for file-paths
 */
public class FilepathGlobals {

    private FilepathGlobals(){}

    /**
     * The base resource folder path. Includes the '/', so to append a string it should not start with a '/'
     */
    public static final String RESOURCES_FOLDER_PATH = "src/main/resources/";

    public static final String LOG_FOLDER_PATH = RESOURCES_FOLDER_PATH + "logs/";

    public static final String BOARDS_JSON_PATH = RESOURCES_FOLDER_PATH + "boards/boards.json";

    public static final String MODEL_GLOBALS_PATH = RESOURCES_FOLDER_PATH + "globals/model_globals.json";

    public static final String GAME_PREFERENCES_PATH = RESOURCES_FOLDER_PATH + "globals/game_preferences.json";

    public static final String CLI_COMMAND_LIST_PATH = RESOURCES_FOLDER_PATH + "cli/cli_command_list.json";

    public static final String VIEW_TOOLCARDS_PATH = RESOURCES_FOLDER_PATH + "view/tool_cards.json";

    public static final String VIEW_CHOICES_PATH = RESOURCES_FOLDER_PATH + "view/choices.json";

    public static final String VIEW_OBJECTIVE_PATH = RESOURCES_FOLDER_PATH + "view/objectives.json";

    public static final String TOOLS_PROPERTIES_PATH = RESOURCES_FOLDER_PATH + "globals/tools_globals.json";

    public static final String CONNECTION_GLOBALS_PATH = RESOURCES_FOLDER_PATH + "globals/connection_globals.json";

    public static final String VIEW_GLOBALS_PATH = RESOURCES_FOLDER_PATH + "globals/view_globals.json";
}
