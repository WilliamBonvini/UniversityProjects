package it.polimi.ingsw.model;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class DieTest {
    /**
     * hecks whether setValue() actually sets a value in a die, using the first constructor
     */
    @Test
    void dieSetValueTest1(){
        Die die = new Die(Color.BLUE,Number.NONE);
        for(int i=0;i<30;i++){
            die.setValue(Number.THREE);
            assertEquals(Number.THREE,die.getValue());
        }
    }

    @Test
    void dieSetValueTest2(){
        //checks whether setValue() does its job or not, using the second constructor
        Die die = new Die(Color.GREEN,Number.ONE);
        for(int i=0;i<30;i++){
            die.setValue(Number.SIX);
            assertNotEquals(Number.FIVE,die.getValue());
        }
    }

    @Test
    void dieGetValueTest1(){
        //checks whether getValue() does its job or not, using assertEqual
        Die die =   new Die(Color.PURPLE,Number.FIVE);
        for(int i=0;i<30;i++){
            assertEquals(Number.FIVE,die.getValue());
        }
    }

    @Test
    void dieGetValueTest2(){
        //checks whether getBalue() does its job or not, using assertNotEquals
        Die die =   new Die(Color.PURPLE,Number.SIX);
        for(int i=0;i<30;i++){
            assertNotEquals(Number.FOUR,die.getValue());
        }
    }

    @Test
    void dieGetColorTest1(){
        Die die =new Die(Color.BLUE,Number.SIX);
        for(int i=0;i<30;i++) {
            assertEquals(Color.BLUE, die.getColor());
        }
    }

    @Test
    void dieGetColorTest2(){
        Die die =new Die(Color.RED,Number.SIX);
        for(int i=0;i<30;i++) {
            assertNotEquals(Color.BLUE, die.getColor());
        }
    }

    @Test
    void dieRollTest1(){
        Die die =new Die(Color.GREEN,Number.THREE);
        for(int i=0;i<30;i++) {
            die.roll();
            assertEquals(Color.GREEN, die.getColor());
        }
    }

    @Test
    void dieRollTest2(){
        Die die =new Die(Color.GREEN,Number.THREE);
        for(int i=0;i<30;i++) {
            die.roll();
            assertNotEquals(Number.NONE, die.getValue());
        }
    }

    @Test
    void dieRollTest3(){
        //verifies whether the value of the die changes at least once in 50 iterations.
        int flag=0;
        Die die =new Die(Color.GREEN,Number.THREE);
        for(int i=0;i<50 && flag==0;i++) {
            die.roll();
            if (die.getValue() != Number.THREE) {
                flag = 1;
            }
        }
        assertEquals(1,flag);
    }

    /**
     * tests that equals return true when two equals die are compared
     */
    @Test
    void dieEqualsTest1(){
        Die die1    =   new Die(Color.YELLOW,Number.ONE);
        Die die2    =   new Die(Color.YELLOW,Number.ONE);
        assertEquals(true,die1.equals(die2));
    }


    /**
     * tests that the equal function return false for two different dice
     */
    @Test
    void dieEqualsTest2(){
        Die die1    =   new Die(Color.YELLOW,Number.ONE);
        Die die2    =   new Die(Color.GREEN,Number.ONE);
        assertNotEquals(true,die1.equals(die2));
    }
}

