package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.AlreadyEmptyException;
import it.polimi.ingsw.exceptions.AlreadyFullException;

import java.util.Optional;

public class Cell {
    private Color colorConstraint;
    private Number valueConstraint;
    private Die die;

    /**
     * @param shade the numeric constraint of the cell (it can be NONE)
     * @param color the color constraint of the cell (it can be NONE)
     */
    public Cell(Number shade, Color color) {
        this.valueConstraint=shade;
        this.colorConstraint=color;
        this.die=null;
    }

    public Cell(Cell cell) {
        if (cell != null) {
            this.valueConstraint = cell.getValueConstraint();
            this.colorConstraint = cell.getColorConstraint();
            die = cell.die == null ? null : new Die(cell.die);
        } else {
            this.valueConstraint = Number.NONE;
            this.colorConstraint = Color.NONE;
            this.die = null;
        }

    }

    /**
     * @return the die that has been put in the cell. it returns null if there is no die on the cell
     */
    public Optional<Die> getDie() {
        return Optional.ofNullable(die);
    }

    /**
     * Check if has a Die
     * @return true if there is a Die in
     */
    public boolean hasDie() {
        return this.die != null;
    }

    /**
     * @return the numeric constraint of the cell
     */
    public Number getValueConstraint() {
        return this.valueConstraint;
    }


    /**
     * @return the color constraint of the cell
     */
    public Color getColorConstraint() {
        return this.colorConstraint;
    }

    /**
     * @param die the die that needs to be placed in the cell
     * @throws AlreadyFullException is thrown if the cell already has a die in it
     */
    void placeDie(Die die) {
        if(!this.hasDie()){
            this.die    =   die;
        }else{
            throw new AlreadyFullException();
        }
    }

    /**
     * Saves the die into a temporary variable and set to null the die attribute of the class Cell,
     * @return the die that was taken from the cell
     * @throws AlreadyEmptyException if the cell is already empty
     */
    Die takeDie() throws AlreadyEmptyException {
        Die temp;
        if(this.die!=null){
            temp        =   new Die(this.die.getColor(),this.die.getValue());
            this.die    =   null;
        }else throw new AlreadyEmptyException();
        return temp;
    }


    /**
     * @return the concatenation between the ANSI color constraint and the Unicode value constraint if there is no die on the cell
     *         the concatenation between the ANSI color  and the Unicode die value if there is a die on the cell
     */
    public String toString() {
        if(this.die==null){
            return getColorConstraint().toString()+getValueConstraint().toString();
        }
        return this.die.toString();
    }

    @Override
    public boolean equals(Object obj) {
        return (obj instanceof Cell &&
                ((Cell) obj).getColorConstraint() == this.getColorConstraint() &&
                ((Cell) obj).getValueConstraint() == this.getValueConstraint());
    }

}

