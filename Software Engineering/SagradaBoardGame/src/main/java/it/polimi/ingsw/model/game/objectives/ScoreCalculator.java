package it.polimi.ingsw.model.game.objectives;

import it.polimi.ingsw.model.*;
import it.polimi.ingsw.model.Number;

import java.util.function.Function;

/**
 * Gives method to calculate scores
 */
public class ScoreCalculator {

    private ScoreCalculator () {}

    /**
     * Calculate the score based on the given objective ID and the specified board
     *
     * @param objectiveID to be used for the calculation
     * @param board       to be inspected
     * @return the total score
     */
    public static int calculateScore(int objectiveID, Board board) {
        Function<Die, Boolean> one = die -> die.getValue().equals(Number.ONE);
        Function<Die, Boolean> two = die -> die.getValue().equals(Number.TWO);
        Function<Die, Boolean> three = die -> die.getValue().equals(Number.THREE);
        Function<Die, Boolean> four = die -> die.getValue().equals(Number.FOUR);
        Function<Die, Boolean> five = die -> die.getValue().equals(Number.FIVE);
        Function<Die, Boolean> six = die -> die.getValue().equals(Number.SIX);

        switch (objectiveID) {
            case 1:
                return new LineObjective(Direction.HORIZONTAL, Restriction.COLOR, 6).calculate(board);
            case 2:
                return new LineObjective(Direction.VERTICAL, Restriction.COLOR, 5).calculate(board);
            case 3:
                return new LineObjective(Direction.HORIZONTAL, Restriction.NUMBER, 5).calculate(board);
            case 4:
                return new LineObjective(Direction.VERTICAL, Restriction.NUMBER, 4).calculate(board);
            case 5:
                return new DiceGroupObjective(new Function[]{one, two}, 2).calculate(board);
            case 6:
                return new DiceGroupObjective(new Function[]{three, four}, 2).calculate(board);
            case 7:
                return new DiceGroupObjective(new Function[]{five, six}, 2).calculate(board);
            case 8:
                return new DiceGroupObjective(new Function[]{one, two, three, four, five, six}, 5).calculate(board);
            case 10:
                return new DiceGroupObjective(new Function[]{
                        die -> ((Die) die).getColor().equals(Color.RED),
                        die -> ((Die) die).getColor().equals(Color.BLUE),
                        die -> ((Die) die).getColor().equals(Color.YELLOW),
                        die -> ((Die) die).getColor().equals(Color.GREEN),
                        die -> ((Die) die).getColor().equals(Color.PURPLE)
                }, 4).calculate(board);
            case 9:
                return new SingleCellObjective(cell ->
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .hasDie()
                        &&
                                (
                        cell[0]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                        ==
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                ||
                        cell[2]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                        ==
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                ||
                        cell[6]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                        ==
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                ||
                        cell[8]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                        ==
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                                )
                        , die -> 1).calculate(board);
            case 11:
                return new SingleCellObjective(cell ->
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                                .equals(Color.RED)
                , die -> die.getValue().toNumber()).calculate(board);
            case 12:
                return new SingleCellObjective(cell ->
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                                .equals(Color.YELLOW)
                        , die -> die.getValue().toNumber()).calculate(board);
            case 13:
                return new SingleCellObjective(cell ->
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                                .equals(Color.GREEN)
                        , die -> die.getValue().toNumber()).calculate(board);
            case 14:
                return new SingleCellObjective(cell ->
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                                .equals(Color.BLUE)
                        , die -> die.getValue().toNumber()).calculate(board);
            case 15:
                return new SingleCellObjective(cell ->
                        cell[4]
                                .orElse(new Cell(Number.NONE, Color.NONE))
                                .getDie()
                                .orElse(new Die(Color.NONE, Number.NONE))
                                .getColor()
                                .equals(Color.PURPLE)
                        , die -> die.getValue().toNumber()).calculate(board);
            default:
                throw new UnsupportedOperationException();
        }
    }
}
