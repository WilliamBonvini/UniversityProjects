package it.polimi.ingsw.globals;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.utils.Logger;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 * this class contains all the model-globals constants used across the code. Loaded from file
 */
public class ModelGlobals {
    //components
    private String componentPool;
    private String componentBoard;
    private String componentRoundTrack;
    private String componentPlayer;
    private String componentTool;
    private String componentBag;
    private String componentFavours;
    private String componentChoose;
    private String componentPass;

    //board grid size
    private int gridSizeX;
    private int gridSizeY;

    //rounds
    private int numOfRounds;

    public static final ModelGlobals instance = new ModelGlobals(FilepathGlobals.MODEL_GLOBALS_PATH);

    private ModelGlobals(String filepath) {
        try (Reader reader = new FileReader(filepath)) {
            Gson gson = new GsonBuilder().create();
            ModelGlobals loadedGlobals = gson.fromJson(reader, ModelGlobals.class);
            //set the variables from the loaded file
            loadFromOther(loadedGlobals);

        } catch (IOException |JsonSyntaxException e) {
            Logger.std().warning("Error while loading model_globals.json file! will be used default values!");
            loadDefault();
        }
    }

    private void loadDefault() {
        componentBag = "bag";
        componentBoard = "board";
        componentFavours = "favours";
        componentPlayer = "player";
        componentPool = "pool";
        componentRoundTrack = "roundtrack";
        componentTool = "tool";
        componentChoose = "choose";
        componentPass = "pass";
        gridSizeX = 5;
        gridSizeY = 4;
        numOfRounds = 10;

    }

    private void loadFromOther(ModelGlobals loadedGlobals) {
        componentBag = loadedGlobals.componentBag == null ? "bag" : loadedGlobals.componentBag;
        componentBoard = loadedGlobals.componentBoard == null ? "board" : loadedGlobals.componentBoard;
        componentFavours = loadedGlobals.componentFavours == null ? "favours" : loadedGlobals.componentFavours;
        componentPlayer = loadedGlobals.componentPlayer == null ? "player" : loadedGlobals.componentPlayer;
        componentPool = loadedGlobals.componentPool == null ? "pool" : loadedGlobals.componentPool;
        componentRoundTrack = loadedGlobals.componentRoundTrack == null ? "roundtrack" : loadedGlobals.componentRoundTrack;
        componentTool = loadedGlobals.componentTool == null ? "tool" : loadedGlobals.componentTool;
        componentChoose = loadedGlobals.componentChoose == null ? "choose" : loadedGlobals.componentChoose;
        componentPass = loadedGlobals.componentPass == null ? "pass" : loadedGlobals.componentPass;
        gridSizeX = loadedGlobals.gridSizeX == 0 ? 5 : loadedGlobals.gridSizeX;
        gridSizeY = loadedGlobals.gridSizeY == 0 ? 4 : loadedGlobals.gridSizeY;
        numOfRounds = loadedGlobals.numOfRounds == 0 ? 10 : loadedGlobals.numOfRounds;
    }

    public static final String componentPool() {
        return instance.componentPool;
    }
    public static final String componentBag() {
        return instance.componentBag;
    }
    public static final String componentBoard() {
        return instance.componentBoard;
    }
    public static final String componentFavours() {
        return instance.componentFavours;
    }
    public static final String componentPlayer() {
        return instance.componentPlayer;
    }
    public static final String componentRoundTrack() {
        return instance.componentRoundTrack;
    }
    public static final String componentTool() {
        return instance.componentTool;
    }
    public static final String componentChoose() {
        return instance.componentChoose;
    }
    public static final String componentPass() {
        return instance.componentPass;
    }

    public static final int boardSizeX() {
        return instance.gridSizeX;
    }
    public static final int boardSizeY() {
        return instance.gridSizeY;
    }

    public static final int numOfRounds() { return instance.numOfRounds;}
}
