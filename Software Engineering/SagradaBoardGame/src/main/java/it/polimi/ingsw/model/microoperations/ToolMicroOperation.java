package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.IllegalParameterException;
import it.polimi.ingsw.exceptions.MicroOperationSyntaxErrorException;
import it.polimi.ingsw.exceptions.QuantityDifferFromViewIDsException;
import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.globals.ToolGlobals;
import it.polimi.ingsw.model.factories.MicroOperationProgramFactory;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;

import java.util.List;

/**
 * Implementes the TOOL MicroOperation
 */
public class ToolMicroOperation extends AbstractMicroOperation {

    public ToolMicroOperation (String ... parameters) {
        super("tool", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(parameters.size() == 1) {
            List<Integer> idviews = flow
                    .getMicroOperationVariables()
                    .popAll(ModelGlobals.componentTool());

            int program;
            if (idviews.get(0) == 0)
                program = 0;
            else if (idviews.get(0) > 0 && idviews.get(0) <= 3)
                program = gameManager.getTable().getToolCard(idviews.get(0));
            else
                throw new MicroOperationSyntaxErrorException("ToolMicroOperation: " + idviews.get(0) + " is not a valid idview (Valid values: 0, 1, 2, 3)");

            /*
             * tool draft && tool0
             * 	draft
             * 	tool nodraft
             *
             * tool draft && toolqualsiasi
             * 	effetto
             * 	draft
             *
             * tool nodraft && tool0
             * 	fineturno
             *
             * tool nodraft && toolqualsiasi
             * 	effetto
             * 	fineturno
             */
            switch(parameters.get(0))
            {
                case "draft":
                    if(program == 0)
                    {
                        // obviously these operations are written from the last to the first
                        flow.insertAfterCurrent(new ToolMicroOperation("nodraft"));
                        flow.insertAfterCurrent(new InputMicroOperation("tool"));
                        flow.insertAfterCurrent(new ProgramMicroOperation("src/main/resources/programs/draft"));
                    }
                    else
                    {
                        if(!ToolGlobals.instance.needDraft(program)) {
                            // obviously these operations are written from the last to the first
                            flow.insertAfterCurrent(
                                    MicroOperationProgramFactory
                                            .getProgram("src/main/resources/programs/draft")
                                            .getAll()
                            );
                            flow.insertAfterCurrent(
                                    MicroOperationProgramFactory
                                            .getProgram("src/main/resources/programs/tool" + program)
                                            .getAll()
                            );
                        }
                        else
                            flow.insertAfterCurrent(
                                    MicroOperationProgramFactory
                                            .getProgram("src/main/resources/programs/tool" + program)
                                            .getAll()
                            );
                    }
                    break;
                case "nodraft":
                    if(program != 0 && !ToolGlobals.instance.needDraft(program))
                        flow
                                .insertAfterCurrent(
                                        MicroOperationProgramFactory
                                                .getProgram("src/main/resources/programs/tool" + program)
                                                .getAll()
                                );
                    break;
                default:
                    throw new IllegalParameterException();
            }
        }
        else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof ToolMicroOperation;
    }
}
