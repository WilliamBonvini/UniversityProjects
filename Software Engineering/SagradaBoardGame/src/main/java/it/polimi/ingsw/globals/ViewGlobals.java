package it.polimi.ingsw.globals;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.utils.Logger;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/**
 * Global class which stores useful parameters for view-classes
 */
public class ViewGlobals {

    private int roundTrackMaxPileHeight;
    private int roundTrackRounds;
    private int viewBoardSize;
    private boolean passThroughProperty;

    private static final ViewGlobals INSTANCE = new ViewGlobals(FilepathGlobals.VIEW_GLOBALS_PATH);

    private ViewGlobals(String filepath) {
        try (Reader reader = new FileReader(filepath)) {
            Gson gson = new GsonBuilder().create();
            ViewGlobals loadedGlobals = gson.fromJson(reader, ViewGlobals.class);
            //set the variables from the loaded file
            loadFromOther(loadedGlobals);

        } catch (IOException |JsonSyntaxException e) {
            Logger.std().warning("Error while loading view_globals.json file! will be used default values!");
            loadDefault();
        }
    }

    private void loadDefault() {
        roundTrackMaxPileHeight = 9;
        roundTrackRounds = 10;
        viewBoardSize = 20;
        passThroughProperty = false;
    }

    private void loadFromOther(ViewGlobals other) {
        roundTrackMaxPileHeight = other.roundTrackMaxPileHeight == 0 ? 9 : other.roundTrackMaxPileHeight;
        roundTrackRounds = other.roundTrackRounds == 0 ? 10 : other.roundTrackRounds;
        viewBoardSize = other.viewBoardSize == 0 ? 20 : other.viewBoardSize;
        passThroughProperty = other.passThroughProperty;
    }

    public static final int roundTrackMaxPileHeight() {
        return INSTANCE.roundTrackMaxPileHeight;
    }

    public static final int roundTrackRounds() {
        return INSTANCE.roundTrackRounds;
    }

    public static final int viewBoardSize() {
        return INSTANCE.viewBoardSize;
    }

    public static final boolean passThroughProperty(){return INSTANCE.passThroughProperty;}
}
