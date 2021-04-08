package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.AlreadyFullException;
import it.polimi.ingsw.exceptions.InvalidIdException;
import it.polimi.ingsw.model.factories.BoardFactory;
import org.junit.jupiter.api.Test;

import java.util.Random;

import static org.junit.jupiter.api.Assertions.*;

class BoardTest {

    @Test
    void getCell() {
        //create a new random Board
        Cell[][] grid1 = new Cell[5][4];
        Random rnd = new Random();
        for (int j = 0; j < grid1[0].length; j++) {
            for (int i = 0; i < grid1.length; i++) {
                try {
                    grid1[i][j] = new Cell(Number.getNumberById(rnd.nextInt(7)), Color.getColorById(rnd.nextInt(7)));
                } catch (InvalidIdException iie) {
                    grid1[i][j] = new Cell(Number.NONE, Color.NONE);
                }
            }
        }
        //copy grid1 in grid2
        Cell[][] grid2 = new Cell[5][4];
        for (int j = 0; j < grid1[0].length; j++) {
            for (int i = 0; i < grid1.length; i++) {
                grid2[i][j] = new Cell(grid1[i][j]);
            }
        }

        String boardName = "nameTest";
        int favours = 3;


        /*
        try {
            //check if the two boards are the same
            Board b1 = new Board(boardName, favours, grid1);
            Board b2 = new Board(boardName, favours, grid2);
            assertEquals(b1, b2);
            //place a Die in board 2, then assert that are not anymore equals
            if(!b2.getCell(2, 2).getValueConstraint().equals(Number.TWO) ||
                    !b2.getCell(2, 2).getColorConstraint().equals(Color.GREEN))
                b2.placeDieInCell(new Die(Color.GREEN, Number.TWO), 2, 2);
            else
                b2.placeDieInCell(new Die(Color.RED, Number.TWO), 2, 2);

            assertNotEquals(b1, b2);
        } catch (BoardDimensionException | AlreadyFullException e) {
            assertTrue(false);
        }*/
    }
}