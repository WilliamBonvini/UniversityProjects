package it.polimi.ingsw.client.view.viewelements;

import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Number;

/**
 * Represents a client-side Cell on a board. Possesses two ViewComponent, representing the die and the constraint
 */
public class ViewBoardCell {
    private ViewComponent die;
    private ViewComponent constraint;

    public ViewBoardCell() {
        constraint = new ViewComponent(Color.NONE,Number.NONE);
        die        = new ViewComponent(Color.NONE,Number.NONE);
    }

    public ViewComponent getDie() {
        return die;
    }

    public void setDie(ViewComponent die) {
        this.die = die;
    }

    public ViewComponent getConstraint() {
        return constraint;
    }

    public void setConstraint(ViewComponent constraint) {
        this.constraint = constraint;
    }

}
