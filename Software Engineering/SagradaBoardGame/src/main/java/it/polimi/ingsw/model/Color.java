package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.InvalidIdException;

public enum Color {
    RED(1),
    BLUE(2),
    YELLOW(3),
    GREEN(4),
    PURPLE(5),
    NONE(0);

    public static final String ANSI_NOCONSTR = "\u001B[37m"; //White --> the cell has no constraints, the die should never be white.
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_PURPLE = "\u001B[35m";


    public static final String NONE_STRING ="";
    public static final String RED_STRING = "red";
    public static final String GREEN_STRING = "green";
    public static final String YELLOW_STRING = "yellow";
    public static final String BLUE_STRING = "blue";
    public static final String PURPLE_STRING = "purple";

    private String colorCode;
    private String colorString;


    /**
     * this constructor builds a Color based on the id that corresponds to it.
     * this constructor comes in handy when we want to generate a random Color, so we use a random int identifier (that
     * can assume values between 1 and 5) to build it.
     * @param id the identifier of the color.
     * @throws InvalidIdException when an invalid identifier is passed as a parameter.
     */
    Color(int id) {
        switch(id){
            case   1 :
                    this.colorCode= ANSI_RED;
                    this.colorString = RED_STRING;
                    break;
            case   2 :
                    this.colorCode= ANSI_BLUE;
                    this.colorString = BLUE_STRING;
                    break;
            case   3 :
                    this.colorCode= ANSI_YELLOW;
                    this.colorString = YELLOW_STRING;
                    break;
            case   4 :
                    this.colorCode= ANSI_GREEN;
                    this.colorString = GREEN_STRING;
                    break;
            case   5 :
                    this.colorCode= ANSI_PURPLE;
                    this.colorString = PURPLE_STRING;
                    break;
            default:
                    this.colorCode= ANSI_NOCONSTR;
                    this.colorString = NONE_STRING;
                    break;
        }
    }



    /**
     * this methods comes in handy whe we want the get a color using an int identifier
     * 0=NONE
     * 1=RED
     * 2=BLUE
     * 3=YELLOW
     * 4=GREEN
     * 5=PURPLE
     * @param id the id that identifies the color
     * @return the color identified by the id
     */

    public static Color getColorById(int id) {
        switch(id){
            case   0:
                return NONE;
            case   1:
                return RED;
            case   2:
                return BLUE;
            case   3 :
                return YELLOW;
            case   4 :
                return GREEN;
            case   5 :
                return PURPLE;
            default:
                throw new InvalidIdException();
        }
    }

    @Override
    public String toString(){
        return this.colorString;
    }

    public String toColoredString() {return this.colorCode;}

}
