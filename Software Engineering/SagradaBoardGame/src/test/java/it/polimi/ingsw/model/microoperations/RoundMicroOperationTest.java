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
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class RoundMicroOperationTest {

    private GameManager gm;
    private Flow flow;

    @BeforeEach
    void setUp() {
        gm = SetupGameManager.setUp();

        flow = gm.getFlow();
    }

    @Test
    void doOperation() {
        RoundMicroOperation round = new RoundMicroOperation("forward");
        try {
            round.doOperation(gm, flow);
            assertFalse(flow.getMicroOperationVariables().isSecondTurn());
        } catch (WrongParametersNumberException | QuantityDifferFromViewIDsException | MicroOperationSyntaxErrorException | IllegalParameterException e) {
            e.printStackTrace();
        }

        round = new RoundMicroOperation("backward");
        try {
            round.doOperation(gm, flow);
            assertTrue(flow.getMicroOperationVariables().isSecondTurn());
        } catch (WrongParametersNumberException | QuantityDifferFromViewIDsException | MicroOperationSyntaxErrorException | IllegalParameterException e) {
            e.printStackTrace();
        }
    }
}