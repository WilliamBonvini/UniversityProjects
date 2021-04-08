package it.polimi.ingsw.globals;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.utils.Logger;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;

public class ToolGlobals {

    public static final ToolGlobals instance = new ToolGlobals(FilepathGlobals.TOOLS_PROPERTIES_PATH);

    private ArrayList<Integer> needDraft;
    private ArrayList<Integer> needFirstTurn;
    private ArrayList<Integer> needSecondTurn;

    private ToolGlobals(String filepath) {
        needDraft = new ArrayList<>();
        needFirstTurn = new ArrayList<>();
        needSecondTurn = new ArrayList<>();
        try (Reader reader = new FileReader(filepath)) {
            Gson gson = new GsonBuilder().create();
            ToolGlobals loaded = gson.fromJson(reader, ToolGlobals.class);
            //set the variables from the loaded file
            loadFromOther(loaded);
        } catch (IOException |JsonSyntaxException e) {
            Logger.std().warning("Error while loading " + filepath + " file! will be used default values!");
            loadDefault();
        }
    }

    private void loadDefault() {
        needDraft.add(1);
        needDraft.add(5);
        needDraft.add(6);
        needDraft.add(7);
        needDraft.add(9);
        needDraft.add(10);
        needDraft.add(11);

        needFirstTurn.add(8);

        needSecondTurn.add(7);
    }

    public boolean needDraft (int tool) {
        return needDraft.contains(tool);
    }
    public boolean needFirstTurn (int tool) {
        return needFirstTurn.contains(tool);
    }
    public boolean needSecondTurn (int tool) {
        return needSecondTurn.contains(tool);
    }

    private void loadFromOther(ToolGlobals toolGlobals) {
        needDraft.addAll(toolGlobals.needDraft);
        needFirstTurn.addAll(toolGlobals.needFirstTurn);
        needSecondTurn.addAll(toolGlobals.needSecondTurn);
    }
}
