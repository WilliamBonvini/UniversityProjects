package it.polimi.ingsw.model;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class DiceBagTest {

    /**
     * checks whether the dicebag size decreases by one when a die is drawn from it and
     * tests whether the drawDie function actually draws a die from the the dicebag.
     * For simplicity I'll construct a dicebag with 90 dice in it, and draw it from it.
     */
    @Test
    void drawDieTest1(){
        DiceBag dicebag     =   new DiceBag();
        dicebag.getDie(1);
        assertEquals(89, dicebag.size());
    }


    /**
     * checks whether the dicebag size increases by one when a die is added in it and
     * tests whether the addDie function actually adds a die in the the dicebag.
     * after the adding it checks if the dicebag contains the added die.
     * For simplicity I'll construct a dicebag with 90 dice in it, draw one and add it back in the dicebag.
     */
    @Test
    void addDieTest1(){
        DiceBag dicebag     =   new DiceBag();
        Die die             ;

        //I draw a die from the dicebag and I save it in the variable die
        die= dicebag.getDie(1);

        // I add the same die to the dicebag and I check that the dicebag contains it

        dicebag.addDie(die);
        assertTrue(dicebag.size()==90 && dicebag.contains(die));
    }


    /**
     * Tests whether the initial size of a dicebag is 90 or not
     */
    @Test
    void sizeTest1(){
        DiceBag dicebag     =   new DiceBag();
        assertEquals(90,dicebag.size());
    }




}