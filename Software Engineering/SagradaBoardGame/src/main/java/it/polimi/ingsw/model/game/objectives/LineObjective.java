package it.polimi.ingsw.model.game.objectives;

import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Board;
import it.polimi.ingsw.model.Cell;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.utils.Logger;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.function.Function;

/**
 * Calculate the points relative to a line
 */
public class LineObjective implements IObjective {

    private Direction direction;
    private Restriction restriction;
    private int value;

    public LineObjective (Direction direction, Restriction restriction, int value) {
        this.direction = direction;
        this.restriction = restriction;
        this.value = value;
    }

    @Override
    public int calculate(Board board) {
        int score = 0;
        List<Object> line = new ArrayList<>();
        Function<Cell, Object> restrictionFunction = null;
        int externalFor = 0;
        int nestedFor = 0;

        if (restriction == Restriction.COLOR)
            restrictionFunction = cell -> cell.getDie().orElse(new Die(Color.NONE, Number.NONE)).getColor();
        else if (restriction == Restriction.NUMBER)
            restrictionFunction = cell -> cell.getDie().orElse(new Die(Color.NONE, Number.NONE)).getValue();
        else
            Logger.std().error("LineObjective.calculate(): not a valid restriction: " + restriction);

        if (direction == Direction.HORIZONTAL) {
            externalFor = ModelGlobals.boardSizeY();
            nestedFor = ModelGlobals.boardSizeX();
        } else if (direction == Direction.VERTICAL) {
            externalFor = ModelGlobals.boardSizeX();
            nestedFor = ModelGlobals.boardSizeY();
        }
        else
            Logger.std().error("LineObjective.calculate(): not a valid direction: " + direction);

        for (int i = 0; i < externalFor; i++) {
            for (int j = 0; j < nestedFor; j++)
                if (direction == Direction.HORIZONTAL) {
                    if (board.getCell(j, i).hasDie())
                        line.add(restrictionFunction.apply(board.getCell(j, i)));
                } else {
                    if (board.getCell(i, j).hasDie())
                        line.add(restrictionFunction.apply(board.getCell(i, j)));
                }

            int requiredSize;

            if (direction == Direction.HORIZONTAL)
                requiredSize = ModelGlobals.boardSizeX();
            else
                requiredSize = ModelGlobals.boardSizeY();

            if (line.stream().allMatch(new HashSet<>()::add) && line.size() == requiredSize)
                score += value;

            line.clear();
        }

        return score;
    }
}
