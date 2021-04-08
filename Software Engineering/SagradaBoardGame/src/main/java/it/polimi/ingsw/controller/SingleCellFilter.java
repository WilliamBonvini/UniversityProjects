package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.CantAccessPlayerException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Board;
import it.polimi.ingsw.model.Cell;
import it.polimi.ingsw.utils.Logger;

import java.util.Optional;
import java.util.function.BiFunction;

/**
 * Filter the IDs based on the rules applicable to a single Cell in the Board.
 * Success:
 *      The specified rule is respected
 * Failure:
 *      The specified rule is not respected
 */
public class SingleCellFilter extends Filter {

    private BiFunction<Optional<Cell>[], IDView, Boolean> function;

    private String name;

    SingleCellFilter (String name, BiFunction<Optional<Cell>[], IDView, Boolean> function) {
        this.name = name;
        this.function = function;
    }

    @Override
    public boolean execute(IDView id) {
        boolean result = true;
        if (id.getComponent().equals(ModelGlobals.componentBoard()))
        {
            Optional<Cell>[] cells = new Optional [9];
            Board board = id
                .getGameManager()
                .getFlow()
                .getMicroOperationVariables()
                .getCurrentPlayer()
                .orElseThrow(CantAccessPlayerException::new)
                .getBoard();

            int row = (id.getId() - 1) / 5;
            int boundLeft;
            int boundRight;
            boundLeft = 5 * row + 1;
            boundRight = 5 * row + 5;
            for (int i = 0;i < 3;i++) {
                // Top 3 cells row
                if (id.getId() - 5 - 1 + i >= boundLeft - 5 &&
                    id.getId() - 5 - 1 + i <= boundRight - 5 &&
                    id.getId() - 5 - 1 + i > 0)
                    cells[i] = Optional.ofNullable(board.getCellById(id.getId() - 5 - 1 + i));
                else
                    cells[i] = Optional.empty();

                // Mid 3 cells row
                if (id.getId() - 1 + i >= boundLeft &&
                    id.getId() - 1 + i <= boundRight)
                    cells[i + 3] = Optional.ofNullable(board.getCellById(id.getId() - 1 + i));
                else
                    cells[i + 3] = Optional.empty();

                // Bot 3 cells row
                if (id.getId() + 5 - 1 + i >= boundLeft + 5 &&
                    id.getId() + 5 - 1 + i <= boundRight + 5 &&
                    id.getId() + 5 - 1 + i <= 20)
                    cells[i + 6] = Optional.ofNullable(board.getCellById(id.getId() + 5 - 1 + i));
                else
                    cells[i + 6] = Optional.empty();
            }
            Logger.std().verbose("SingleCellFilter: Cells: ");
            result = function.apply(cells, id);
        }
        if (!result)
            Logger.std().verbose("Filter failed: " + getName());
        return result;
    }

    @Override
    String getName() {
        return name;
    }
}
