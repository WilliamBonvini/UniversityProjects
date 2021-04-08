package it.polimi.ingsw.model.factories;

import com.google.gson.*;
import it.polimi.ingsw.globals.MicroOperationDefinitions;
import it.polimi.ingsw.model.microoperations.*;
import it.polimi.ingsw.utils.Logger;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Factory that generate all the MicroOperationPrograms
 */
public class MicroOperationProgramFactory {

    private MicroOperationProgramFactory () {}

    public static MicroOperationProgram createDefault (int numberOfPlayers, int numberOfTurns) {
        List<Integer> players = new ArrayList<>();
        for(int i = 0;i < numberOfPlayers;i++)
            players.add(i);

        MicroOperationProgram program = new MicroOperationProgram();

        //using proper filters
        program.add(new ProgramMicroOperation("src/main/resources/programs/reset_filters"));

        //creating turns
        for(int i = 0;i < numberOfTurns;i++)
        {
            //drawing dice
            program.add(new RoundMicroOperation("forward"));
            program.add(new MoveMicroOperation(Integer.toString(numberOfPlayers * 2 + 1), "bag", "random", "current", "append"));
            program.add(new MoveMicroOperation("all", "current", "random", "pool", "append"));

            //creating turns
            for(int j = 0;j < numberOfPlayers;j++)
                program.add(new ProgramMicroOperation("src/main/resources/programs/turn" + Integer.toString(players.get(j))));

            //now going backwards
            program.add(new RoundMicroOperation("backward"));

            //creating the remainings turns
            for(int j = numberOfPlayers - 1;j >= 0;j--)
                program.add(new ProgramMicroOperation("src/main/resources/programs/turn" + Integer.toString(players.get(j))));

            //rotating the dicebag
            program.add(new RotateMicroOperation());
            Collections.rotate(players, numberOfPlayers - 1);

            //filling the roundtrack
            program.add(new MoveMicroOperation("all", "pool", "random", "current", "append"));
            program.add(new MoveMicroOperation("all", "current", "random", "roundtrack", "append"));
        }

        return program;
    }

    public static MicroOperationProgram getProgram (String name) {
        try {
            return loadFromFile(name + ".json");
        } catch (FileNotFoundException e) {
            Logger.std().error("MicroOperationProgramFactory: FileNotFoundException: " + name + ".json");
        }
        throw new UnsupportedOperationException();
    }

    private static MicroOperationProgram loadFromFile (String fileName) throws FileNotFoundException{
        try (Reader reader = new FileReader(fileName)) {
            GsonBuilder gson = new GsonBuilder();
            gson.registerTypeAdapter(AbstractMicroOperation.class, new AbstractMicroOperationDeserializer());
            return gson.create().fromJson(reader, MicroOperationProgram.class);
        } catch (FileNotFoundException fnfe) {
            Logger.std().warning(fileName + " file was not found");
        } catch (IOException ioe) {
            Logger.std().warning("error while opening " + fileName);
        }
        throw new FileNotFoundException();
    }

    private static class AbstractMicroOperationDeserializer implements JsonDeserializer<AbstractMicroOperation> {
        @Override
        public AbstractMicroOperation deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            String type = json
                    .getAsJsonObject()
                    .getAsJsonPrimitive("type")
                    .getAsString();
            JsonArray jsonParameter = json
                    .getAsJsonObject()
                    .getAsJsonArray("parameters");

            String[] parameters = new String[jsonParameter.size()];
            for(int i = 0;i < jsonParameter.size();i++)
                parameters[i] = jsonParameter.get(i).getAsString();

            try {
                return (AbstractMicroOperation) MicroOperationDefinitions
                        .getDefinition(type)
                        .getConstructors()[0]
                        .newInstance((Object) parameters);
            } catch (InvocationTargetException | InstantiationException | IllegalAccessException  e) {
                Logger.std().error("MicroOperationProgramFactory.AbstractMicroOperationDeserializer.deserialize(): can't deserialize \"" + type + "\" with parameters: " + parameters);
            }
            return null;
        }
    }
}
