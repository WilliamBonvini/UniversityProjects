package it.polimi.ingsw.client.view.viewelements;

import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Number;

import java.io.Serializable;

/**
 * View representation for the single cell of the board, or a die, from view-side
 */
public class ViewComponent implements Serializable {
    private Color color;
    private Number number;

    public ViewComponent(Color color,Number number){
        this.color=color;
        this.number=number;
    }

    public boolean isNone() {
        return color == Color.NONE && number == Number.NONE;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Number getNumber() {
        return number;
    }

    public void setNumber(Number number) {
        this.number = number;
    }


    /**
     * @return the unicode representation of the component
     */
    @Override
    public String toString(){
        return getColor().toString()+getNumber().toString();
    }


}
