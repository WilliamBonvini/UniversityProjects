package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.InvalidIdException;

public enum Number {
    NONE(0),
    ONE(1),
    TWO(2),
    THREE(3),
    FOUR(4),
    FIVE(5),
    SIX(6);


    public static final String NONE_STRING ="";
    public static final String ONE_STRING = "one";
    public static final String TWO_STRING = "two";
    public static final String THREE_STRING = "three";
    public static final String FOUR_STRING = "four";
    public static final String FIVE_STRING = "five";
    public static final String SIX_STRING = "six";

    private int value;
    private String numCode;
    private String numString;

    Number(int value){
        this.value =value;
        switch(value){
            case   0 :
                this.numCode="\u2610"; // empty square
                this.numString = NONE_STRING;
                break;
            case   1 :
                this.numCode="\u2680";
                this.numString = ONE_STRING;
                break;

            case   2 :
                this.numCode="\u2681";
                this.numString = TWO_STRING;
                break;

            case   3 :
                this.numCode="\u2682";
                this.numString = THREE_STRING;
                break;

            case   4 :
                this.numCode="\u2683";
                this.numString = FOUR_STRING;
                break;

            case   5 :
                this.numCode="\u2684";
                this.numString = FIVE_STRING;
                break;

            case   6 :
                this.numCode="\u2685";
                this.numString = SIX_STRING;
                break;
            default:
                break;
        }
    }

    /**
     * @return the Unicode that represents the face of the die. if the value of the value is NONE then the unicode returned is an empty square.
     */
    @Override
    public String toString(){
        return this.numString;
    }

    public String toColoredString () { return this.numCode;}

    public int toNumber() {
        return value;
    }


    /**
     * This method comes in handy when we want to get a value using an int identifier
     * 0=NONE
     * 1=ONE
     * 2=TWO
     * 3=THREE
     * 4=FOUR
     * 5=FIVE
     * 6=SIX
     * @param id the integer that identifies the Number enum
     * @return the enum correspondent to the integer passed as a parameter
     * @throws InvalidIdException when the identifier passed as a parameter is less than 0 or more than 6
     */
    public static Number getNumberById(int id) {
        switch(id){
            case    0:
                return NONE;
            case    1:
                return ONE;

            case    2:
                return TWO;

            case    3:
                return THREE;

            case    4:
                return FOUR;

            case    5:
                return FIVE;

            case    6:
                return SIX;

            default:
                throw new InvalidIdException();
        }

    }
}


