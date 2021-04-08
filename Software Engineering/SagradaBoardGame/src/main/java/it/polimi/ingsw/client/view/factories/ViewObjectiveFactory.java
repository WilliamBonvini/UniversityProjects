package it.polimi.ingsw.client.view.factories;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.client.view.viewelements.ViewObjective;
import it.polimi.ingsw.globals.FilepathGlobals;
import it.polimi.ingsw.utils.Logger;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;

public class ViewObjectiveFactory {

    private static final List<ViewObjective> OBJECTIVES = loadObjectives(FilepathGlobals.VIEW_OBJECTIVE_PATH);

    private ViewObjectiveFactory() {}
    /**
     *
     * @return a viewObjective with the specified id, based
     * @throws NoSuchElementException if the id is invalid
     */
    public static final ViewObjective getViewObjectiveById(int id) {
        for (int i = 0; i < OBJECTIVES.size(); i++) {
            if(OBJECTIVES.get(i).getID() == id)
                return new ViewObjective(OBJECTIVES.get(i));
        }
        return new ViewObjective();
    }



    private static List<ViewObjective> loadObjectives(String filepath) {
        try (Reader reader = new FileReader(filepath)){
            Gson gson = new GsonBuilder().create();
            return Arrays.asList(gson.fromJson(reader, ViewObjective[].class));
        } catch (JsonSyntaxException | IOException e) {
            Logger.std().warning("Errore nel caricamento degli obiettivi da file!");
        }
        return new ArrayList<>(0);
    }
}
