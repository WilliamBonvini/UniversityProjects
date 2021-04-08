package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.SetupGameManager;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.model.microoperations.CheckPointMicroOperation;
import it.polimi.ingsw.model.microoperations.InputMicroOperation;
import it.polimi.ingsw.model.microoperations.RoundMicroOperation;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class FilterManagerTest {

    private GameManager gm;
    private FilterManager manager;

    @BeforeEach
    void setUp() {
        gm = SetupGameManager.setUp();
        manager = new FilterManager(gm);
    }

    @Test
    void execute() {
        manager.useFilter("logger", true);
        manager.useFilter("player", true);
        manager.useFilter("component", true);

        // Testing wrong user
        manager.setTarget(new IDView(gm, "test1", "pool", 1));
        assertFalse(manager.execute());

        // Testing unrequested component
        manager.setTarget(new IDView(gm, "test0", "pool", 1));
        assertFalse(manager.execute());

        // Using the pool
        gm
                .getFlow()
                .getMicroOperationVariables()
                .request("pool");
        manager.setTarget(new IDView(gm, "test0", "pool", 1));
        manager.useFilter("frame", false);
        manager.useFilter("emptycell", false);
        manager.useFilter("fullcell", false);
        manager.useFilter("boardnumber", false);
        manager.useFilter("boardcolor", false);
        manager.useFilter("dienumber", false);
        manager.useFilter("diecolor", false);
        // Test for successfully draw a die from the pool
        gm
                .getTable()
                .getPool()
                .addDie(new Die(Color.YELLOW, Number.TWO));
        assertTrue(manager.execute());
        // Test for unsuccessfully draw a die from the pool
        gm
                .getTable()
                .getPool()
                .removeDie(new Die(Color.YELLOW, Number.TWO));
        assertFalse(manager.execute());

        // Using the board
        gm
                .getFlow()
                .getMicroOperationVariables()
                .request("board");
        manager.setTarget(new IDView(gm, "test0", "board", 1));
        manager.useFilter("emptycell", true);
        manager.useFilter("fullcell", false);
        manager.useFilter("boardnumber", true);
        manager.useFilter("boardcolor", true);
        manager.useFilter("dienumber", true);
        manager.useFilter("diecolor", true);
        gm
                .getFlow()
                .getMicroOperationVariables()
                .getCurrentPlayer()
                .orElseThrow(CantAccessPlayerException::new)
                .addDie(new Die(Color.YELLOW, Number.TWO));
        // Test for successfully put a die in the board
        assertTrue(manager.execute());
        // Test for unsuccessfully put a die in the board
        gm
                .getTable()
                .getPlayer("test0")
                .getBoard()
                .setDie(1, new Die(Color.YELLOW, Number.FIVE));
        assertFalse(manager.execute());
        gm
                .getTable()
                .getPlayer("test0")
                .getBoard()
                .removeDie(1);
        // Test for unsuccesfully put a die adjacent to another die in the board
        gm
                .getTable()
                .getPlayer("test0")
                .getBoard()
                .setDie(2, new Die(Color.BLUE, Number.TWO));
        assertFalse(manager.execute());
        // Test for succesfully put a die adjacent to another die in the board
        gm
                .getFlow()
                .getMicroOperationVariables()
                .getCurrentPlayer()
                .orElseThrow(CantAccessPlayerException::new)
                .setDie(1, new Die(Color.YELLOW, Number.FIVE));
        assertTrue(manager.execute());
    }

    @Test
    void frameFilter () {
        manager.useFilter("frame", true);
        // Test for succesfully put a die in the frame
        gm
                .getFlow()
                .getMicroOperationVariables()
                .getCurrentPlayer()
                .orElseThrow(CantAccessPlayerException::new)
                .addDie(new Die(Color.YELLOW, Number.FIVE));
        manager.setTarget(new IDView(gm, "test0", "board", 1));
        assertTrue(manager.execute());
        // Test for unsuccesfully put a die outside the frame
        manager.setTarget(new IDView(gm, "test0", "board", 7));
        gm
                .getFlow()
                .getMicroOperationVariables()
                .getCurrentPlayer()
                .orElseThrow(CantAccessPlayerException::new)
                .getBoard()
                .removeDie(1);
        assertFalse(manager.execute());
    }

    @Test
    void modifyFilter () {
        manager.useFilter("modify", true);
        // Test for succesfully modify a die from six to five
        gm
                .getFlow()
                .getMicroOperationVariables()
                .getCurrentPlayer()
                .orElseThrow(CantAccessPlayerException::new)
                .addDie(new Die(Color.YELLOW, Number.SIX));
        manager.setTarget(new IDView(gm, "test0", ModelGlobals.componentChoose(), 1));
        assertTrue(manager.execute());
        // Test for succesfully modify a six die using +1
        manager.setTarget(new IDView(gm, "test0", ModelGlobals.componentChoose(), 2));
        assertFalse(manager.execute());
    }

    @Test
    void toolsturnFilter () {
        manager.useFilter("toolsturn", true);

        gm.getTable().setToolCard(1, 1);
        gm.getTable().setToolCard(2, 7);
        gm.getTable().setToolCard(3, 8);

        gm.getTable().getPlayer("test0").setFavourPoints(6);

        manager.setTarget(new IDView(gm, "test0", ModelGlobals.componentTool(), 1));
        assertTrue(manager.execute());
        manager.setTarget(new IDView(gm, "test0", ModelGlobals.componentTool(), 2));
        assertFalse(manager.execute());
        manager.setTarget(new IDView(gm, "test0", ModelGlobals.componentTool(), 3));
        assertTrue(manager.execute());
        try {
            new RoundMicroOperation("backward").doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException | MicroOperationSyntaxErrorException | QuantityDifferFromViewIDsException | IllegalParameterException e) {
            e.printStackTrace();
        }
        manager.setTarget(new IDView(gm, "test0", ModelGlobals.componentTool(), 2));
        assertTrue(manager.execute());
    }

    @Test
    void passFilter () {
        manager.useFilter("pass", true);

        gm.getFlow().insertAfterCurrent(new RoundMicroOperation("forward"));
        gm.getFlow().insertAfterCurrent(new InputMicroOperation("tool"));
        gm.getFlow().insertAfterCurrent(new RoundMicroOperation("forward"));
        gm.getFlow().insertAfterCurrent(new CheckPointMicroOperation());

        new Thread(() -> gm.getFlow().run()).start();

        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        manager.setTarget(new IDView(gm, "test0", ModelGlobals.componentPass(), 1));
        assertFalse(manager.execute());

        manager.setTarget(new IDView(gm, "test0", "passfailure", 1));
        assertTrue(manager.execute());
    }
}