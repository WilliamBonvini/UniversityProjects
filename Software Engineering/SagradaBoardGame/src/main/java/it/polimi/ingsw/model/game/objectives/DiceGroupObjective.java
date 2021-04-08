package it.polimi.ingsw.model.game.objectives;

import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Board;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.Number;

import java.util.Arrays;
import java.util.Collections;
import java.util.function.Function;

public class DiceGroupObjective implements IObjective {

    private Function<Die, Boolean>[] functions;
    private int value;

    DiceGroupObjective (Function<Die, Boolean>[] functions, int value) {
        this.functions = functions;
        this.value = value;
    }

    @Override
    public int calculate(Board board) {
        Integer[] occurrences = new Integer[functions.length];
        Arrays.fill(occurrences, 0);

        int k = 0;
        for (Function<Die, Boolean> function : functions) {
            for (int i = 0; i < ModelGlobals.boardSizeY(); i++)
                for (int j = 0; j < ModelGlobals.boardSizeX(); j++)
                    if (function.apply(board.getCell(j, i).getDie().orElse(new Die(Color.NONE, Number.NONE))))
                        occurrences[k]++;
            k++;
        }

        return value * Collections.min(Arrays.asList(occurrences));
    }
}
