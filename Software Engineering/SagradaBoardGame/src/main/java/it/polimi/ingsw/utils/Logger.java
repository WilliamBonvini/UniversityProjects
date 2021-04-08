package it.polimi.ingsw.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.globals.FilepathGlobals;
import it.polimi.ingsw.globals.ViewGlobals;
import org.fusesource.jansi.Ansi;

import java.io.*;

import static org.fusesource.jansi.Ansi.ansi;

/**
 * Custom logger. Configurable via file, can print colored or not and set a filter level
 */
public class Logger {

    private static final String LOGGER_FILE = "logger_std_config.json";
    private static final Logger STANDARD_LOGGER = new Logger("", FilepathGlobals.LOG_FOLDER_PATH + LOGGER_FILE);

    private String name;
    private final PrintStream stream;

    private String logFile;


    private static final Ansi.Color COLOR_INFO = Ansi.Color.CYAN;
    private static final Ansi.Color COLOR_WARNING = Ansi.Color.YELLOW;
    private static final Ansi.Color COLOR_ERROR = Ansi.Color.RED;
    private static final Ansi.Color COLOR_DEBUG = Ansi.Color.GREEN;

    private boolean colorMode;


    /**
     * Logs are ordered based on severity: order is verbose, debug, info, warning, error.
     * 0 to include everything, 1 for debug (and above), 2 for info, 3 for warning, 4 for only error,
     * 5 or more for nothing.
     */
    private int filterLevel;


    /**
     * Default logger. Default colors and log only on console. Colors on
     */
    private Logger() {
        name = ""; //empty name for standard logging
        stream = System.out;
        filterLevel = 0;
        colorMode = true;
    }

    /**
     * The standard logger but with a name associated and the inputStream specified (System.out for default).
     * Colors are default ones
     * @param name
     */
    public Logger(String name) {
        this.name = name; //empty name for standard logging
        stream = System.out;
        filterLevel = 0;
        colorMode = true;
    }

    /**
     * build a logger with the parameters loaded from file in filepath
     * @param name
     * @param filepath
     */
    private Logger(String name, String filepath) {
        if (ViewGlobals.passThroughProperty())
            System.setProperty("jansi.passthrough", "true");
        logFile = "";
        this.name = name;
        stream = System.out;

        try (Reader reader = new FileReader(filepath)) {
            Gson gson = new GsonBuilder().create();
            Logger loadedGlobals = gson.fromJson(reader, Logger.class);
            //set the variables from the loaded file
            loadFromOther(loadedGlobals);

        } catch (IOException |JsonSyntaxException e) {
            filterLevel = 0;
            colorMode = false;
            Logger.std().warning("Error while loading "+ filepath +" file! will be used default values!");
            colorMode = true;
        }

    }

    private void loadFromOther(Logger logger) {
        name = logger.name;
        logFile = logger.logFile;
        filterLevel = logger.filterLevel;
        colorMode = logger.colorMode;
    }

    /**
     * set on or off the color mode, to enable colors in console
     * @param turnOn
     */
    public void setColorMode(boolean turnOn) {
        colorMode = turnOn;
    }

    /**
     * @return the standard logger, to not instantiate a new one. Default colors and no name
     */
    public static Logger std() {
        return STANDARD_LOGGER;
    }

    /**
     * Logs are ordered based on severity: order is verbose, debug, info, warning, error.
     * 0 to include everything, 1 for debug (and above), 2 for info, 3 for warning, 4 for only error,
     * 5 or more for nothing.
     */
    public void setFilterLevel(int filterLevel) {
        this.filterLevel = filterLevel;
    }


    private void log(Ansi.Color color, String message) {
        if(colorMode)
            stream.println(ansi().fg(color).a(name).a(message).fg(Ansi.Color.DEFAULT).toString());
        else
            stream.println(name + message);
    }

    /**
     * print a standard message, in normal message color (default: white)
     * @param message
     */
    public void verbose(String message) {
        if(filterLevel <= 0)
            log(Ansi.Color.DEFAULT, message);
    }


    /**
     * print a debug message, in info message color (default: green)
     * @param message
     */
    public void debug(String message) {
        if(filterLevel <= 1)
            log(COLOR_DEBUG, message);
    }

    /**
     * print a info message, in info message color (default: cyan)
     * @param message
     */
    public void info(String message) {
        if(filterLevel <= 2)
            log(COLOR_INFO, message);
    }

    /**
     * print a warning message, in warning message color (default: yellow)
     * @param message
     */
    public void warning(String message) {
        if(filterLevel <= 3)
            log(COLOR_WARNING, message);
    }

    /**
     * print an error message, in error message color (default: red)
     * @param message
     */
    public void error(String message) {
        if(filterLevel <= 4)
            log(COLOR_ERROR, message);
    }



}
