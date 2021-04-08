package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.connection.server.clienthandlers.RMIClientHandler;
import it.polimi.ingsw.connection.server.util.ClientContainer;
import it.polimi.ingsw.exceptions.WrongParametersNumberException;
import it.polimi.ingsw.model.Player;
import it.polimi.ingsw.model.SetupGameManager;
import it.polimi.ingsw.model.Table;
import it.polimi.ingsw.model.factories.BoardFactory;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ControlMicroOperationTest {

    private GameManager gm;

    @BeforeEach
    void setUp() {
        gm = SetupGameManager.setUp();
    }

    @Test
    void doOperation() {
        ControlMicroOperation op = new ControlMicroOperation("0");
        try {
            op.doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException e) {
            e.printStackTrace();
        }
        assert gm.getFlow().getMicroOperationVariables().getCurrentPlayer().isPresent();
        gm.getFlow().getMicroOperationVariables().getCurrentPlayer().ifPresent(
                player -> assertEquals(player, gm.getTable().getPlayers().get(0))
        );

        op = new ControlMicroOperation("3");
        try {
            op.doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException e) {
            e.printStackTrace();
        }
        assert gm.getFlow().getMicroOperationVariables().getCurrentPlayer().isPresent();
        gm.getFlow().getMicroOperationVariables().getCurrentPlayer().ifPresent(
                player -> assertEquals(player, gm.getTable().getPlayers().get(3))
        );

        op = new ControlMicroOperation("2");
        try {
            op.doOperation(gm, gm.getFlow());
        } catch (WrongParametersNumberException e) {
            e.printStackTrace();
        }
        assert gm.getFlow().getMicroOperationVariables().getCurrentPlayer().isPresent();
        gm.getFlow().getMicroOperationVariables().getCurrentPlayer().ifPresent(
                player -> assertEquals(player, gm.getTable().getPlayers().get(2))
        );
    }
}