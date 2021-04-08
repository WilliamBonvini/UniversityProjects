package it.polimi.ingsw.model;

import java.util.Random;

public class Die {
    private Color color;
    private Number value;

    public Die(Color color, Number value) {
        this.color = color;
        this.value = value;
    }

    public Die(Die die) {
        if(die != null) {
            this.color = die.getColor();
            this.value = die.getValue();
        } else {
            this.value = Number.NONE;
            this.color = Color.NONE;
        }
    }


    /**
     * Sets the value of a die. it comes in handy when the player wants to use the tool card
     * that allows him to flip a die in his Board.
     * @param value
     */
    public void setValue(Number value) {
        this.value = value;
    }


    /**
     * @return the value of the die
     */
    public Number getValue() {
        return this.value;
    }

    /**
     * @return the color of the die
     */
    public Color getColor() {
        return this.color;
    }



    /**
     * this method is used every time a turn ends to define a new pool, and in case the player wants to
     * use tool cards as the sixth one that allows him to roll a die that he has chosen from the pool.
     */
    public void roll() {
        Random r = new Random();
        int temp = r.nextInt(6) + 1;
        switch (temp) {
            case 1:
                this.setValue(Number.ONE);
                break;
            case 2:
                this.setValue(Number.TWO);
                break;
            case 3:
                this.setValue(Number.THREE);
                break;
            case 4:
                this.setValue(Number.FOUR);
                break;
            case 5:
                this.setValue(Number.FIVE);
                break;
            case 6:
                this.setValue(Number.SIX);
                break;
            default:
                break;
        }
    }


    /**
     * @param obj the object I want to compare to the caller
     * @return true if the color and the value of the dice are equal, false if they are different,
     * and false if the objects are different objects.
     */
    public boolean equals(Object obj) {
        if (obj instanceof Die) {
            return (
                    this.getColor() == ((Die) obj).getColor() &&
                            this.getValue() == ((Die) obj).getValue()
            );
        }
        return false;
    }

    /**
     * @return the concatenation between the ANSI color code and tbe Unicode of the die value
     */
    public String toString(){
        return this.getColor().toString()+this.getValue().toString();
    }



}


