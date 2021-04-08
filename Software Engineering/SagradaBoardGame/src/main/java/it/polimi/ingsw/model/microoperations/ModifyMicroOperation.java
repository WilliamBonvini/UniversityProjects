package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Couple;
import it.polimi.ingsw.utils.Logger;

import java.util.List;

/**
 * Implementes the MODIFY MicroOperation
 */
public class ModifyMicroOperation extends AbstractMicroOperation {

    public ModifyMicroOperation (String ... parameters) {
        super("modify", parameters);
    }

    @Override
    public void doOperation(GameManager gameManager, Flow flow) throws WrongParametersNumberException, IllegalParameterException {
        if (parameters.size() == 1) {
            MicroOperationVariables mov = flow.getMicroOperationVariables();
            switch (parameters.get(0)) {
                case "user":
                    if (mov.getSchema() == 1) {
                        // This is basically Toolcard 1
                        try {
                            List<Integer> ids = mov.popAll("choose");
                            Die die = mov.getCurrentPlayer().orElseThrow(CantAccessCellException::new).getAll().get(0);
                            Couple<Number, Number> choosed = new Couple<>(die.getValue(), Number.NONE);
                            if (ids.get(0) == 1) {
                                switch (die.getValue()) {
                                    case TWO:
                                        choosed.setSecond(Number.ONE);
                                        break;
                                    case THREE:
                                        choosed.setSecond(Number.TWO);
                                        break;
                                    case FOUR:
                                        choosed.setSecond(Number.THREE);
                                        break;
                                    case FIVE:
                                        choosed.setSecond(Number.FOUR);
                                        break;
                                    case SIX:
                                        choosed.setSecond(Number.FIVE);
                                        break;
                                    default:
                                        Logger.std().error("ModifyMicroOperation: cannot subtract one to " + die.getValue());
                                        throw new IllegalParameterException();
                                }
                            } else if (ids.get(0) == 2) {
                                switch (die.getValue()) {
                                    case ONE:
                                        choosed.setSecond(Number.TWO);
                                        break;
                                    case TWO:
                                        choosed.setSecond(Number.THREE);
                                        break;
                                    case THREE:
                                        choosed.setSecond(Number.FOUR);
                                        break;
                                    case FOUR:
                                        choosed.setSecond(Number.FIVE);
                                        break;
                                    case FIVE:
                                        choosed.setSecond(Number.SIX);
                                        break;
                                    default:
                                        Logger.std().error("ModifyMicroOperation: cannot add one to " + die.getValue());
                                        throw new IllegalParameterException();
                                }
                            } else
                                throw new IllegalParameterException();

                            if (mov.getRestrictedNumbers().contains(choosed))
                                die.setValue(choosed.getSecond());
                        } catch (InvalidIdException | InvalidComponentException e) {
                            Logger.std().error("ModifyMicroOperation: illegal parameter");
                        }
                    } else if (mov.getSchema() == 11) {
                        // This is basically Toolcard 11
                        try {
                            List<Integer> ids = mov.popAll("choose");
                            Die die = mov.getCurrentPlayer().orElseThrow(CantAccessCellException::new).getAll().get(0);
                            Couple<Number, Number> choosed = new Couple<>(die.getValue(), Number.NONE);
                            choosed.setSecond(Number.getNumberById(ids.get(0)));

                            if (mov.getRestrictedNumbers().contains(choosed))
                                die.setValue(choosed.getSecond());
                        } catch (InvalidIdException | InvalidComponentException e) {
                            Logger.std().error("ModifyMicroOperation: illegal parameter");
                        }
                    }
                    break;
                case "random":
                    mov
                        .getCurrentPlayer()
                        .orElseThrow(CantAccessPlayerException::new)
                        .getAll()
                        .forEach(
                            die -> die
                                .setValue( mov
                                    .getRestrictedNumbers()
                                    .stream()
                                    .filter(c -> c.getFirst() == die.getValue())
                                    .findAny()
                                    .orElse(new Couple<>(Number.NONE, die.getValue()))
                                    .getSecond()
                        )
                    );
                    break;
                default:
                    throw new IllegalParameterException();
            }
            gameManager.notifyChanged();
        } else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof ModifyMicroOperation;
    }
}
