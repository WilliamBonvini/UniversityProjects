package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.SetupGameManager;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class DeleteNextMicroOperationTest {

    private GameManager gm;

    @BeforeEach
    void setup() {
        gm = SetupGameManager.setUp();
        Flow flow = new Flow(gm);
        gm.setFlow(flow);
    }

    @Test
    void doOperation() {
        List<AbstractMicroOperation> testProgram = new ArrayList<>();

        testProgram.add(new DeleteNextMicroOperation());

        testProgram.add(new ForceIdMicroOperation(ModelGlobals.componentPool(), "1"));
        testProgram.add(new ProgramMicroOperation("src/main/resources/programs/turn" + Integer.toString(
                gm
                        .getFlow()
                        .getMicroOperationVariables()
                        .getCurrentPlayer()
                        .orElseThrow(CantAccessPlayerException::new)
                        .getID()
        )));

        gm.getFlow().insertAfterCurrent(testProgram);
        gm.getFlow().run();

        assertThrows(IndexOutOfBoundsException.class, () -> gm.getFlow().deleteAt(2));
    }
}