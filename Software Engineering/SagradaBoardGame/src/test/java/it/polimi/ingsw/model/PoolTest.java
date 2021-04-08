package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.InvalidIdException;
import it.polimi.ingsw.exceptions.NotInPoolException;
import org.junit.jupiter.api.Test;

import java.util.Random;

import static org.junit.jupiter.api.Assertions.*;

class PoolTest {

    /**
     * Tests that if is added a die to an empty pool, its size is one
     */
    @Test
    void insertDieTest1(){
        Pool pool   =   new Pool();
        Die die     =   new Die(Color.BLUE,Number.THREE);
        pool.addDie(die);
        assertEquals(1,pool.size());
    }

    /*
    /**
     * tests that, if a not valid die (for example, its value is NONE) is added to the dicebag,
     * dicebag throws an exception
     */
    /*
    @Test
    void insertDieTest2(){
        Pool pool   =   new Pool();
        Die die     =   new Die(Color.BLUE,Number.NONE);
        pool.insertDie(die);
        assertEquals(1,pool.size());

    }
    */

    /**
     * Tests that if a die is removed from the pool, its size decreases by one
     */
    @Test
    void removeDieTest1() throws InvalidIdException {
        Pool pool       =   new Pool();
        Die die         =   null;
        Random r        =   new Random();
        for(int i=0;i<7;i++){
            die     =   new Die(Color.getColorById(r.nextInt(5)+1),Number.getNumberById(r.nextInt(6)+1));
            pool.addDie(die);
        }

        pool.removeDie(die);

        assertEquals(6,pool.size());
    }


}