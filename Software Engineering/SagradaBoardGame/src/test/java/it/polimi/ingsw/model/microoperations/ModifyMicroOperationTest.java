package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.SetupGameManager;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Couple;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ModifyMicroOperationTest {

    private GameManager gm;
    private MicroOperationVariables mov;

    @BeforeEach

    void setUp() {
        gm = SetupGameManager.setUp();

        mov = gm.getFlow().getMicroOperationVariables();
    }

    @Test
    void modifyExistingDieByRandom() {
        AbstractMicroOperation op = new ModifyMicroOperation("random");

        // setting up restrictions
        mov.addNumberRestriction(new Couple<>(Number.SIX, Number.FIVE));
        mov.addNumberRestriction(new Couple<>(Number.SIX, Number.FOUR));

        // test 1: modify an existing die by random
        mov.getCurrentPlayer().ifPresent(player ->
            player.addDie(new Die(Color.BLUE, Number.SIX))
        );
        try {
            op.doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException | IllegalParameterException | MicroOperationSyntaxErrorException | QuantityDifferFromViewIDsException e) {
            e.printStackTrace();
        }
        mov.getCurrentPlayer().ifPresent(player ->
            assertTrue(player.getAll().get(0).getValue() == Number.FIVE ||
                player.getAll().get(0).getValue() == Number.FOUR)
        );
    }

    @Test
    void modifyNonModificableDieByRandom () {
        AbstractMicroOperation op = new ModifyMicroOperation("random");

        // setting up restrictions
        mov.addNumberRestriction(new Couple<>(Number.SIX, Number.FIVE));
        mov.addNumberRestriction(new Couple<>(Number.SIX, Number.FOUR));

        // test 2: try to modify a non-modificable die by random
        mov.getCurrentPlayer().ifPresent(player ->
                player.addDie(new Die(Color.BLUE, Number.FIVE))
        );
        try {
            op.doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException | IllegalParameterException | MicroOperationSyntaxErrorException | QuantityDifferFromViewIDsException e) {
            e.printStackTrace();
        }
        mov.getCurrentPlayer().ifPresent(player ->
                assertEquals(player.getAll().get(0).getValue(), Number.FIVE)
        );
    }

    @Test
    void modifyModificableDieByUser () {
        AbstractMicroOperation op = new ModifyMicroOperation("user");

        // setting up restrictions
        mov.addNumberRestriction(new Couple<>(Number.SIX, Number.FIVE));
        mov.addNumberRestriction(new Couple<>(Number.SIX, Number.FOUR));
        mov.setSchema(1);

        // setting up idview
        List<Integer> idviews = new ArrayList<>();
        idviews.add(1);
        try {
            gm.getFlow().getMicroOperationVariables().request("choose");
            mov.fill("choose", idviews);
        } catch (InvalidComponentException invalidComponent) {
            invalidComponent.printStackTrace();
        }

        // test 3: try to modify a modificable die by user
        mov.getCurrentPlayer().ifPresent(player ->
                player.addDie(new Die(Color.BLUE, Number.SIX))
        );
        try {
            op.doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException | IllegalParameterException | MicroOperationSyntaxErrorException | QuantityDifferFromViewIDsException e) {
            e.printStackTrace();
        }
        mov.getCurrentPlayer().ifPresent(player ->
                assertEquals(player.getAll().get(0).getValue(), Number.FIVE)
        );
    }


    @Test
    void failModify () {
        AbstractMicroOperation op = new ModifyMicroOperation("user");

        // setting up restrictions and schema
        mov.addNumberRestriction(new Couple<>(Number.SIX, Number.FIVE));
        mov.addNumberRestriction(new Couple<>(Number.SIX, Number.FOUR));
        mov.setSchema(1);

        // setting up idview
        List<Integer> idviews = new ArrayList<>();
        idviews.add(2);
        try {
            gm.getFlow().getMicroOperationVariables().request("choose");
            mov.fill("choose", idviews);
        } catch (InvalidComponentException invalidComponent) {
            invalidComponent.printStackTrace();
        }

        // test 4: try to modify a die with the wrong id
        mov.getCurrentPlayer().ifPresent(player ->
                player.addDie(new Die(Color.BLUE, Number.SIX))
        );
        assertThrows(IllegalParameterException.class, () -> op.doOperation(gm, gm.getFlow()));
    }
}