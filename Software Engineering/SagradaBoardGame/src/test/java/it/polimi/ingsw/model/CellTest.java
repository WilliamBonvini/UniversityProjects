package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.AlreadyEmptyException;
import it.polimi.ingsw.exceptions.AlreadyFullException;
import it.polimi.ingsw.exceptions.NoSuchElementException;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * This tests do not test the logic of the game, since it's a job of another class
 */

class CellTest {

    /**
     * tests that placeDie actually places the Die inside the Cell, in case the cell is full it returns an exception.
     */
    @Test
    void placeDieTest1() {
        Die die = new Die(Color.BLUE, Number.ONE);
        Cell cell = new Cell(Number.NONE, Color.BLUE);
        try {
            cell.placeDie(die);
            assertEquals(die, cell.getDie().get());

            assertEquals(die, cell.getDie().get());
        } catch (AlreadyFullException e) {
            e.printStackTrace();
            assertTrue(cell.getDie().isPresent());
        }

    }

    /**
     * tests that getDie actually gets the Die inside the Cell,
     * in case the cell is empty it returns null.
     */
    @Test
    void getDieTest2() {
        Die die = new Die(Color.BLUE, Number.ONE);
        Cell cell = new Cell(Number.NONE, Color.BLUE);
        try {
            cell.placeDie(die);
            assertEquals(die, cell.getDie().get());
        } catch (AlreadyFullException e) {
            e.printStackTrace();
            assertTrue(cell.getDie().isPresent());
        }
    }


    /**
     *  this test consists in showing that the die taken is equal to the one that
     *  places in it
     */
    @Test
    void takeDieTest1(){


        Die die     =   new Die(Color.YELLOW,Number.THREE);
        Cell cell   =   new Cell(Number.NONE,Color.YELLOW);

        for(int i=0;i<50;i++){
            try {
                cell.placeDie(die);
            } catch (AlreadyFullException e) {
                e.printStackTrace();
            }
            try{
                assertEquals(cell.takeDie(),die);
            }catch (AlreadyEmptyException e){
                e.printStackTrace();
                assertTrue(cell.getDie()==null);
            }
        }
    }

    /**
     * this test consists in showing that the die taken is not equal to
     * any die other than the one that was placed in it.
     */
    @Test
    void takeDieTest2(){
        Die die     =   new Die(Color.YELLOW,Number.THREE);
        Cell cell   =   new Cell(Number.NONE,Color.YELLOW);
        try {
            cell.placeDie(die);
        } catch (AlreadyFullException e) {
            e.printStackTrace();
        }
        try{
            die.setValue(Number.ONE);
            assertEquals(cell.takeDie(),die);
        }catch (AlreadyEmptyException e){
            e.printStackTrace();
            assertTrue(cell.getDie()==null);
        }
    }
}

