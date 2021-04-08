package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.BoardDimensionException;
import it.polimi.ingsw.exceptions.NegativeFavourPointsException;
import org.junit.jupiter.api.Test;

import java.util.Random;

import static org.junit.jupiter.api.Assertions.*;

class PlayerTest {

    @Test
    void getFavourPoints() {
        Player p = new Player(5, "testname");
        try {
            p.setFavourPoints(3);
            for (int i=0; i<20; i++) {
                assertEquals(3, p.getFavourPoints());
            }
        } catch (NegativeFavourPointsException nfpe) {
            nfpe.printStackTrace();
        }
    }

    @Test
    void setFavourPoints() {
        Random rnd = new Random(System.currentTimeMillis());
        Player p = new Player(3, "testname");
        int favours, oldFavourPoints;

        for(int i=0; i<50; i++) {
            // assign to favours an int in [-10, 10]
            favours = rnd.nextInt(21) - 10;
            //store the current value of favour points in player p
            oldFavourPoints = p.getFavourPoints();
            try {
                //use the setterMethod
                p.setFavourPoints(favours);
                //if the setter did not throw an exception, assert if player p has the correct amount of favour points
                assertEquals(favours, p.getFavourPoints());
            } catch (NegativeFavourPointsException nfpe) {
                //if the setter threw this exception, assert that:
                // 1)favours is negative
                assertEquals(true, favours < 0);
                //2) player has the same amount of favourPoints than before
                assertEquals(true, p.getFavourPoints() == oldFavourPoints);
                //3) that amount is not negative
                assertEquals(true, p.getFavourPoints() >= 0);
            }
        }
    }

    @Test
    void assignBoard() {
        Player p = new Player(3, "testname");
        Cell[][] grid = new Cell[5][4];
        Board board = null;
        try {
            board = new Board("test", 1, grid);
        } catch (BoardDimensionException e) { //if occurs an exception, the test is wrong
            assertEquals(true, false);
        }
        //assign the board to this player
        p.assignBoard(board);
        //check if is the same board
        assertEquals(board, p.getBoard());
    }
}