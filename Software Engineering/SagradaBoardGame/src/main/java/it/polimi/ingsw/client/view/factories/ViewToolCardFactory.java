package it.polimi.ingsw.client.view.factories;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import it.polimi.ingsw.client.view.viewelements.ViewToolCard;
import it.polimi.ingsw.exceptions.InvalidIdException;
import it.polimi.ingsw.globals.FilepathGlobals;
import it.polimi.ingsw.utils.Logger;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ViewToolCardFactory {

    private static final List<ViewToolCard> ALL_TOOLS = loadViewToolCards(FilepathGlobals.VIEW_TOOLCARDS_PATH);


    private ViewToolCardFactory() {}

    public static ViewToolCard getToolCardById(int id) {
        if(ALL_TOOLS.isEmpty()) //if not correctly loaded, return a mockup ViewCard
            return new ViewToolCard();
        for (ViewToolCard toolCard : ALL_TOOLS) {
            if(toolCard.getNumToolCard() == id)
                return toolCard;
        }
        throw new InvalidIdException();
    }

    private static List<ViewToolCard> loadViewToolCards(String filename) {
        try (Reader reader = new FileReader(filename)){
            Gson gson = new GsonBuilder().create();
            return Arrays.asList(gson.fromJson(reader, ViewToolCard[].class));
        } catch (JsonSyntaxException | IOException e) {
            Logger.std().warning("Errore nel caricamento delle ToolCards da file!");
        }
        return new ArrayList<>(0);
    }
}
