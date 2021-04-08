package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.RoundIndexOutOfBoundException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.SetupGameManager;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

class MoveMicroOperationTest {

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

        // current -> pool
        gm.getTable().getPlayer("test0").addDie(new Die(Color.YELLOW, Number.FIVE));
        gm.getTable().getPlayer("test0").addDie(new Die(Color.GREEN, Number.ONE));
        gm.getTable().getPlayer("test0").addDie(new Die(Color.BLUE, Number.FOUR));
        testProgram.add(new MoveMicroOperation("all", "current", "random", "pool", "append"));

        // pool -> board
        testProgram.add(new ForceIdMicroOperation(ModelGlobals.componentPool(), "1"));
        testProgram.add(new MoveMicroOperation("1", "pool", "user", "current", "append"));
        testProgram.add(new ForceIdMicroOperation("board", "3"));
        testProgram.add(new MoveMicroOperation("all", "current", "random", "board", "user"));

        // pool -> roundtrack
        testProgram.add(new MoveMicroOperation("all", "pool", "random", "current", "append"));
        testProgram.add(new MoveMicroOperation("all", "current", "random", "roundtrack", "append"));

        gm.getFlow().insertAfterCurrent(testProgram);
        gm.getFlow().run();

        assertEquals(0, gm.getTable().getPlayer("test0").size());
        assertEquals(0, gm.getTable().getPool().size());
        assertEquals(1, gm.getTable().getPlayer("test0").getBoard().getAll().size());
        assertEquals(2, gm.getTable().getRoundTrack().getAll().size());
        try {
            assertEquals(2, gm.getTable().getRoundTrack().getDice(0).size());
        } catch (RoundIndexOutOfBoundException e) {
            e.printStackTrace();
        }

    }
}