package it.polimi.ingsw.model.game.objectives;

import it.polimi.ingsw.exceptions.CantAccessCellException;
import it.polimi.ingsw.model.*;
import it.polimi.ingsw.model.Number;

import java.util.Optional;
import java.util.function.Function;

public class SingleCellObjective implements IObjective {

    private Function<Optional<Cell>[], Boolean> function;
    private Function<Die, Integer> value;

    public SingleCellObjective (Function<Optional<Cell>[], Boolean> function, Function<Die, Integer> value) {
        this.function = function;
        this.value = value;
    }

    @Override
    public int calculate(Board board) {
        int score = 0;
        Optional<Cell>[] cells = new Optional [9];

        for (int index = 1;index <= 20;index++) {
            int row = (index - 1) / 5;
            int boundLeft;
            int boundRight;
            boundLeft = 5 * row + 1;
            boundRight = 5 * row + 5;
            for (int i = 0; i < 3; i++) {
                // Top 3 cells row
                if (index - 5 - 1 + i >= boundLeft - 5 &&
                        index - 5 - 1 + i <= boundRight - 5 &&
                        index - 5 - 1 + i > 0)
                    cells[i] = Optional.ofNullable(board.getCellById(index - 5 - 1 + i));
                else
                    cells[i] = Optional.empty();

                // Mid 3 cells row
                if (index - 1 + i >= boundLeft &&
                        index - 1 + i <= boundRight)
                    cells[i + 3] = Optional.ofNullable(board.getCellById(index - 1 + i));
                else
                    cells[i + 3] = Optional.empty();

                // Bot 3 cells row
                if (index + 5 - 1 + i >= boundLeft + 5 &&
                        index + 5 - 1 + i <= boundRight + 5 &&
                        index + 5 - 1 + i <= 20)
                    cells[i + 6] = Optional.ofNullable(board.getCellById(index + 5 - 1 + i));
                else
                    cells[i + 6] = Optional.empty();
            }
            if (function.apply(cells))
                score += value.apply(cells[4].orElseThrow(CantAccessCellException::new).getDie().orElse(new Die(Color.NONE, Number.NONE)));
        }
        return score;
    }
}
