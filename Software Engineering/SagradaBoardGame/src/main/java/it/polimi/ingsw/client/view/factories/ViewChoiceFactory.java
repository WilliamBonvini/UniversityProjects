package it.polimi.ingsw.client.view.factories;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.client.view.viewelements.ViewChoice;
import it.polimi.ingsw.globals.FilepathGlobals;
import it.polimi.ingsw.utils.Logger;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ViewChoiceFactory {

    private static final List<ViewChoice> CHOICES = loadChoices(FilepathGlobals.VIEW_CHOICES_PATH);
    private static final ViewChoice MOCKUP_CHOICE = new ViewChoice(0, "Effettua una scelta (errore nel riconoscimento domanda)");


    private ViewChoiceFactory(){}

    /**
     * get a choice from an ID. if the choice is not recognised, a mockup choice will be sent, which specify to
     * the user that there's a question but was not recognised
     * @param id
     * @return
     */
    public static final ViewChoice getViewChoiceById(int id) {
        for (ViewChoice choice : CHOICES) {
            if (choice.getId() == id) {
                return choice;
            }
        }
        return MOCKUP_CHOICE;
    }



    private static List<ViewChoice> loadChoices(String path) {
        try (Reader reader = new FileReader(path)){
            Gson gson = new GsonBuilder().create();
            return Arrays.asList(gson.fromJson(reader, ViewChoice[].class));
        } catch (JsonSyntaxException | IOException e) {
            Logger.std().warning("Errore nel caricamento delle scelte da file!");
        }
        return new ArrayList<>(0);
    }
}
