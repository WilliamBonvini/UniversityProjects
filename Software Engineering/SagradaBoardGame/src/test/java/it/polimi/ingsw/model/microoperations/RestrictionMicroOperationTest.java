package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.connection.server.clienthandlers.RMIClientHandler;
import it.polimi.ingsw.connection.server.util.ClientContainer;
import it.polimi.ingsw.exceptions.IllegalParameterException;
import it.polimi.ingsw.exceptions.MicroOperationSyntaxErrorException;
import it.polimi.ingsw.exceptions.QuantityDifferFromViewIDsException;
import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.SetupGameManager;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Couple;
import it.polimi.ingsw.model.Number;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class RestrictionMicroOperationTest {

    private GameManager gm;
    private MicroOperationVariables mov;

    @BeforeEach

    void setUp() {
        gm = SetupGameManager.setUp();

        mov = gm.getFlow().getMicroOperationVariables();
    }

    @Test
    void doOperation() {
        try {
            new RestrictionMicroOperation("number", "1", "2").doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException | IllegalParameterException | QuantityDifferFromViewIDsException | MicroOperationSyntaxErrorException e) {
            e.printStackTrace();
        }

        try {
            new RestrictionMicroOperation("number", "5", "3").doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException | IllegalParameterException | QuantityDifferFromViewIDsException | MicroOperationSyntaxErrorException e) {
            e.printStackTrace();
        }
        assertTrue(mov.getRestrictedNumbers().contains(new Couple<>(Number.ONE, Number.TWO)));
        assertTrue(mov.getRestrictedNumbers().contains(new Couple<>(Number.FIVE, Number.THREE)));
        assertFalse(mov.getRestrictedNumbers().contains(new Couple<>(Number.FOUR, Number.THREE)));
    }
}