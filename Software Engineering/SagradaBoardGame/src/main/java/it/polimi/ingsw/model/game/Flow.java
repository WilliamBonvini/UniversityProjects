package it.polimi.ingsw.model.game;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.factories.MicroOperationProgramFactory;
import it.polimi.ingsw.model.microoperations.*;
import it.polimi.ingsw.utils.Logger;

import java.util.List;

/**
 * Flow representing the MicroOperations' flow
 */
public class Flow implements Runnable {

    private MicroOperationProgram microOperationList;
    private int currentIndex;
    private GameManager gameManager;
    private MicroOperationVariables mov;
    private boolean stopped;

    public Flow(GameManager gameManager) {
        this.gameManager = gameManager;
        microOperationList = new MicroOperationProgram();
        currentIndex = -1;
        mov = new MicroOperationVariables();
        mov.setCurrentPlayer(gameManager.getTable().getPlayers().get(0));
        stopped = false;
    }

    /**
     * Used to start the flow of micro operations: will call all the microoperations in order inserted
     * before calling this method.
     */
    @Override
    public void run() {
        currentIndex = 0;
        for(currentIndex = 0; currentIndex < microOperationList.size() && !stopped; currentIndex++) {
            try {
                Logger.std().verbose("Flow executing (" + currentIndex + "): " + microOperationList.get(currentIndex).getType() + " " + microOperationList.get(currentIndex).getParameters());
                microOperationList.get(currentIndex).doOperation(gameManager, this);
            } catch (MicroOperationSyntaxErrorException | QuantityDifferFromViewIDsException | WrongParametersNumberException | IllegalParameterException e) {
                Logger.std().error("Error executing last flow operation at index " + currentIndex);
            }
        }
        //at the end of the flow, the real game is ended, notify that is score phase
        gameManager.notifyScorePhase();
    }

    /**
     * Insert a MicroOperation next to the current one. When the current micro operation will terminate, if
     * this is the last added, this will be called
     * @param microOperation the micro operation to insert in the flow
     */
    public void insertAfterCurrent(AbstractMicroOperation microOperation) {
        microOperationList.add(currentIndex+1, microOperation);
    }

    /**
     * Insert a list of MicroOperations next to the current micro operation. When the current micro operation
     * will terminate, if this is the last added, will be called the first MicroOperation in the list passed
     * @param microOperations the list of MicroOperations
     */
    public void insertAfterCurrent(List<AbstractMicroOperation> microOperations) {
        microOperationList.addAll(currentIndex+1, microOperations);
    }

    /**
     * @param index of the operation to get
     * @return the AbstractMicroOperation placed at the specified index
     * @throws IndexOutOfBoundsException if index is out of flow's bounds
     */
    public AbstractMicroOperation getOperationAt(int index) {
        return microOperationList.get(index);
    }

    /**
     * get the current index of the flow. Can be used to navigate through the Flow
     * @return the current index
     */
    public int getCurrentIndex() {
        return currentIndex;
    }

    /**
     * Delete an AbstractMicroOperation at the specified Index
     * @param index the index of flow which indicates the operation to remove from the flow
     * @throws IndexOutOfBoundsException if index is out of flow's bounds
     */
    public void deleteAt(int index) {
        microOperationList.remove(index);
    }

    public MicroOperationVariables getMicroOperationVariables () {
        return mov;
    }

    public void setupFlow () {
        microOperationList = MicroOperationProgramFactory.createDefault(
                gameManager
                .getTable()
                .getPlayers()
                .size(),
                10
        );
    }

    void stop () {
        stopped = true;
    }

    public void pass () {
        int newIndex;
        int oldIndex;

        // Wait until we can actually pass
        while (!getOperationAt(getCurrentIndex()).getClass().equals(InputMicroOperation.class)) {
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                Logger.std().error("Flow.pass(): error calling Thread.sleep(10) while waiting for pass");
                Thread.currentThread().interrupt();
            }
        }

        // Find the next operation to jump in
        newIndex = getCurrentIndex();
        while(
            !(
                (
                getOperationAt(newIndex).getParameters().size() == 1 &&
                getOperationAt(newIndex).getClass().equals(ProgramMicroOperation.class) &&
                getOperationAt(newIndex).getParameters().get(0).contains("src/main/resources/programs/turn")
                )
            ||
                getOperationAt(newIndex).getClass().equals(RotateMicroOperation.class)
            ||
                getOperationAt(newIndex).getClass().equals(RoundMicroOperation.class)
            )
            ) newIndex++;
        oldIndex = getCurrentIndex();
        currentIndex = newIndex - 1; // We need to adjust the currentIndex++ in the Flow.run() for cycle

        // Restore the model to the checkpoint
        gameManager.setTable(mov.getTable());
        // Change current player in the MOV with the actual old current player
        gameManager
                .getFlow()
                .getMicroOperationVariables()
                .setCurrentPlayer(
                        gameManager
                                // This table is the checkpoint table,
                                // so the player is the checkpoint player
                                .getTable()
                                .getPlayer(
                                        gameManager
                                                .getFlow()
                                                .getMicroOperationVariables()
                                                .getCurrentPlayer()
                                                .orElseThrow(CantAccessPlayerException::new)
                                                .getName()
                                )
                );

        // Set the flow to the new operation
        if (getOperationAt(oldIndex).getClass().equals(InputMicroOperation.class)) {
            Logger.std().verbose("Flow.pass(): current MicroOperation is of INPUT type, interrupting");
            mov.pass();
        } else
            Logger.std().error("Flow.pass(): current MicroOperation is not of INPUT type");
    }

}
