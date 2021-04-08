package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.connection.server.clienthandlers.RMIClientHandler;
import it.polimi.ingsw.connection.server.util.ClientContainer;
import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.SetupGameManager;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

class InputMicroOperationTest {


    private GameManager gm;

    private MicroOperationVariables mov;

    @BeforeEach
    void setUp() {
        gm = SetupGameManager.setUp();
        mov = gm.getFlow().getMicroOperationVariables();
    }

    @Test
    void doOperation() {
        InputMicroOperation op = new InputMicroOperation("board");
        new Thread(() -> {
            try {
                op.doOperation(gm, gm.getFlow());
            } catch (WrongParametersNumberException | IllegalParameterException | QuantityDifferFromViewIDsException | MicroOperationSyntaxErrorException e) {
                e.printStackTrace();
            }
        }).start();

        Timer t = new Timer();
        t.schedule(new TimerTask() {
            @Override
            public void run() {
                try {
                    // this could fail but it shouldn't, 1 second should be enough
                    assert mov.isRequested("board");
                    mov.popAll("board");
                    assert !mov.isRequested("board");
                } catch (InvalidComponentException invalidComponent) {
                    invalidComponent.printStackTrace();
                }
            }
        }, 1000);
    }
}