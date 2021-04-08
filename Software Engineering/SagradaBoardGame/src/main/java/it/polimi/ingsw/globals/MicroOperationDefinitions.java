package it.polimi.ingsw.globals;

import it.polimi.ingsw.exceptions.NotDefinedMicroOperationException;
import it.polimi.ingsw.model.microoperations.*;
import it.polimi.ingsw.utils.Logger;

import java.util.HashMap;

/**
 * Container of all the possible MicroOperations and his definitions
 */
public class MicroOperationDefinitions {
    private static final MicroOperationDefinitions instance = new MicroOperationDefinitions();

    private static HashMap<String, Class> definitions;

    private MicroOperationDefinitions() {
        definitions = new HashMap<>();
        definitions.put(new CheckPointMicroOperation().getType(), CheckPointMicroOperation.class);
        definitions.put(new ChooseMicroOperation().getType(), ChooseMicroOperation.class);
        definitions.put(new ControlMicroOperation().getType(), ControlMicroOperation.class);
        definitions.put(new DeleteNextMicroOperation().getType(), DeleteNextMicroOperation.class);
        definitions.put(new FilterMicroOperation().getType(), FilterMicroOperation.class);
        definitions.put(new ForceIdMicroOperation().getType(), ForceIdMicroOperation.class);
        definitions.put(new InputMicroOperation().getType(), InputMicroOperation.class);
        definitions.put(new ModifyMicroOperation().getType(), ModifyMicroOperation.class);
        definitions.put(new MoveMicroOperation().getType(), MoveMicroOperation.class);
        definitions.put(new ProgramMicroOperation().getType(), ProgramMicroOperation.class);
        definitions.put(new ResetMicroOperation().getType(), ResetMicroOperation.class);
        definitions.put(new RestrictionMicroOperation().getType(), RestrictionMicroOperation.class);
        definitions.put(new RotateMicroOperation().getType(), RotateMicroOperation.class);
        definitions.put(new RoundMicroOperation().getType(), RoundMicroOperation.class);
        definitions.put(new SetAsideMicroOperation().getType(), SetAsideMicroOperation.class);
        definitions.put(new SubFavoursMicroOperation().getType(), SubFavoursMicroOperation.class);
        definitions.put(new ToolMicroOperation().getType(), ToolMicroOperation.class);
    }

    public static Class getDefinition (String name) {
        if (definitions.containsKey(name))
            return definitions.get(name);
        Logger.std().error("MicroOperationDefinitions.getDefinition(), not defined microoperation: " + name);
        throw new NotDefinedMicroOperationException();
    }
}
