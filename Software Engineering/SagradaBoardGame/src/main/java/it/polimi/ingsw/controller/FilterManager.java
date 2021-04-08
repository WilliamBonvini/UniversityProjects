package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.CantAccessCellException;
import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.exceptions.InvalidComponentException;
import it.polimi.ingsw.model.Cell;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Logger;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Initiate and manage a FilterChain
 */
public class FilterManager {

    private GameManager gm;
    private List<IDView> targets;
    private boolean result;

    private FilterChain chain;

    public FilterManager(GameManager gm) {
        this.gm = gm;
        targets = new LinkedList<>();
        result = false;

        chain = new FilterChain();

        chain.addFilter(new LoggerFilter());
        chain.addFilter(new PlayerFilter());
        chain.addFilter(new PassFilter());
        chain.addFilter(new ComponentFilter());
        chain.addFilter(new ToolsTurnFilter());
        chain.addFilter(new RoundTrackFullCellFilter());
        chain.addFilter(new FrameFilter());
        chain.addFilter(new ModifyFilter());

        /*
         * Filter the IDs based on the game rule which says that
         * a die must be put near another die
         * Success:
         *      The Die is near another Die
         * Failure:
         *      The Die is not near another Die
         */
        chain.addFilter(new SingleCellFilter("neardie", (cell, id) ->
                Arrays.stream(new Integer[]{0, 1, 2, 3, 5, 6, 7, 8})
                        .anyMatch(index ->
                                cell[index]
                                        .orElse(new Cell(Number.NONE, Color.NONE))
                                        .hasDie()
                        )
                ||
                        id.getGameManager().getTable().getPlayer(id.getPlayer()).getBoard().isEmpty()
        ));
        /*
         * Filter the IDs based on the game rule (for the 9 tool) which says that
         * a die must be put far from all the other dice
         * Success:
         *      The Die is not near another Die
         * Failure:
         *      The Die is near another Die
         */
        chain.addFilter(new SingleCellFilter("fardie", (cell, id) ->
                Arrays.stream(new Integer[]{0, 1, 2, 3, 5, 6, 7, 8})
                        .noneMatch(index ->
                                cell[index]
                                        .orElse(new Cell(Number.NONE, Color.NONE))
                                        .hasDie()
                        )
        ));

        /*
         * Filter the IDs based on the Cell. It needs to be empty.
         * Success:
         *      The Cell is empty
         * Failure:
         *      The Cell is not empty
         */
        chain.addFilter(new SingleCellFilter("emptycell", (cell, id) ->
                !cell[4]
                        .orElseThrow(CantAccessCellException::new)
                        .hasDie()));
        /*
         * Filter the IDs based on the Cell. It needs to contain a die.
         * Success:
         *      The Cell is not empty
         * Failure:
         *      The Cell is empty
         */
        chain.addFilter(new SingleCellFilter("fullcell", (cell, id) ->
                cell[4]
                        .orElseThrow(CantAccessCellException::new)
                        .hasDie()));

        /*
         * Filter the IDs based on the game rule which says that
         * a die can't be put on a restriction of a different number
         * Success:
         *      The die is not placed on a restriction with a different number
         * Failure:
         *      The die is placed on a restriction with a different number
         */
        chain.addFilter(new SingleCellFilter("boardnumber", (cell, id) ->
                cell[4]
                        .orElseThrow(CantAccessCellException::new)
                        .getValueConstraint()
                        ==
                        id
                                .getGameManager()
                                .getFlow()
                                .getMicroOperationVariables()
                                .getCurrentPlayer()
                                .orElseThrow(CantAccessPlayerException::new)
                                .getAll()
                                .get(0)
                                .getValue()
                        ||
                        cell[4]
                                .orElseThrow(CantAccessCellException::new)
                                .getValueConstraint()
                                ==
                                Number.NONE
        ));
        /*
         * Filter the IDs based on the game rule which says that
         * a die can't be put on a restriction of a different color
         * Success:
         *      The die is not placed on a restriction with a different color
         * Failure:
         *      The die is placed on a restriction with a different color
         */
        chain.addFilter(new SingleCellFilter("boardcolor", (cell, id) ->
                cell[4]
                        .orElseThrow(CantAccessCellException::new).getColorConstraint()
                        ==
                        id
                                .getGameManager()
                                .getFlow()
                                .getMicroOperationVariables()
                                .getCurrentPlayer()
                                .orElseThrow(CantAccessPlayerException::new)
                                .getAll()
                                .get(0)
                                .getColor()
                        ||
                        cell[4]
                                .orElseThrow(CantAccessCellException::new)
                                .getColorConstraint()
                                ==
                                Color.NONE
        ));

        /*
         * Filter the IDs based on the game rule which says that
         * a die can't be put adjacent another die with the same number
         * Success:
         *      The die is not placed adjacent to a die with the same number
         * Failure:
         *      The die is placed adjacent to a die with the same number
         */
        chain.addFilter(new SingleCellFilter("dienumber", (cell, id) ->
                Arrays.stream(new Integer[]{1, 3, 5, 7})
                        .filter(index ->
                                cell[index]
                                        .orElse(new Cell(Number.NONE, Color.NONE))
                                        .getDie()
                                        .orElse(new Die(Color.NONE, Number.NONE))
                                        .getValue() !=
                                        id
                                                .getGameManager()
                                                .getFlow()
                                                .getMicroOperationVariables()
                                                .getCurrentPlayer()
                                                .orElseThrow(CantAccessPlayerException::new)
                                                .getDie(1)
                                                .getValue()
                                        ||
                                        !cell[index]
                                                .orElse(new Cell(Number.NONE, Color.NONE))
                                                .hasDie()
                        )
                        .reduce(
                                0,
                                (a, b) -> a + 1)
                        == 4
        ));
        /*
         * Filter the IDs based on the game rule which says that
         * a die can't be put adjacent another die with the same color
         * Success:
         *      The die is not placed adjacent to a die with the same color
         * Failure:
         *      The die is placed adjacent to a die with the same color
         */
        chain.addFilter(new SingleCellFilter("diecolor", (cell, id) ->
                Arrays.stream(new Integer[]{1, 3, 5, 7})
                        .filter(index ->
                                cell[index]
                                        .orElse(new Cell(Number.NONE, Color.NONE))
                                        .getDie()
                                        .orElse(new Die(Color.NONE, Number.NONE))
                                        .getColor()
                                        !=
                                        id
                                                .getGameManager()
                                                .getFlow()
                                                .getMicroOperationVariables()
                                                .getCurrentPlayer()
                                                .orElseThrow(CantAccessPlayerException::new)
                                                .getDie(1)
                                                .getColor()
                                        ||
                                        !cell[index]
                                                .orElse(new Cell(Number.NONE, Color.NONE))
                                                .hasDie()
                        )
                        .reduce(
                                0,
                                (a, b) -> a + 1)
                        == 4
        ));

        /*
         * Filter the IDs based on the game rule for the tool 12 which says that
         * the color of the die must be the same of the selected one
         * Success:
         *      The die is of the same color of the selected one
         * Failure:
         *      The die is not of the same color of the selected one
         */
        chain.addFilter(new SingleCellFilter("selectedcolor", (cell, id) ->
                cell[4]
                        .orElse(new Cell(Number.NONE, Color.NONE))
                        .getDie()
                        .orElse(new Die(Color.NONE, Number.NONE))
                        .getColor()
                ==
                id
                        .getGameManager()
                        .getTable()
                        .getRoundTrack()
                        .getDie(
                        id
                                .getGameManager()
                                .getFlow()
                                .getMicroOperationVariables()
                                .getSetAsideIDView()
                        )
                .getColor()
        ));
    }

    /**
     * Test the chain. If an active Filter fail the test, the whole chain fails
     * @return the result of the test
     */
    public boolean execute() {
        Logger.std().verbose("FilterManager.execute(): Executing chain ");
        return chain.execute();
    }

    /**
     * Set the target to test
     * @param target to be tested
     */
    void setTarget(IDView target) {
        chain.setTarget(target);
    }

    public void addTarget(IDView target) {
        synchronized (this) {
            targets.add(target);
        }
    }

    /**
     * Activate or deactivate a filter
     * @param filter to be changed
     * @param use Status that the filter have to assume
     */
    public void useFilter(String filter, boolean use) {
        chain.setUse(filter, use);
    }

    /**
     * Tell the FilterManager to filter idviews until the list is empty or until we found a valid idview
     */
    public boolean filterUntilFoundOneOrEmpty () {
        IDView candidate = null;

        synchronized (this) {
            result = false;
            while (!targets.isEmpty() && !result)
            {
                Logger.std().verbose("FilterManager.filterOne(): 1/3 - Filtering " + targets.get(0));
                chain.setTarget(targets.get(0));
                candidate = targets.get(0);
                Logger.std().verbose("FilterManager.filterOne(): 2/3 - Executing chain " + targets.get(0));
                result = chain.execute();
                Logger.std().verbose("FilterManager.filterOne(): 3/3 - Chain executed " + targets.get(0));
                targets.remove(0);
            }
        }
        if(result) {
            List<Integer> idList = new ArrayList<>(1);
            idList.add(candidate.getId());
            try {
                gm.getFlow().getMicroOperationVariables().fill(candidate.getComponent(),idList);
            } catch (InvalidComponentException invalidComponent) {
                Logger.std().error("FilterManager.filterUntilFoundOneOrEmpty(): throwed InvalidComponentException for " + candidate.getComponent());
            }
        }
        return result;
    }
}
