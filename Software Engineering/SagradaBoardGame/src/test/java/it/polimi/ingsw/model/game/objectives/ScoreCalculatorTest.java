package it.polimi.ingsw.model.game.objectives;

import it.polimi.ingsw.model.Board;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.factories.BoardFactory;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ScoreCalculatorTest {

    private Board board;

    @BeforeEach
    void setUp () {
        board = BoardFactory.getBoardByID(1);
        board.setDie(1, new Die(Color.YELLOW, Number.ONE));
        board.setDie(2, new Die(Color.RED, Number.TWO));
        board.setDie(3, new Die(Color.BLUE, Number.THREE));
        board.setDie(4, new Die(Color.PURPLE, Number.SIX));
        board.setDie(5, new Die(Color.GREEN, Number.FIVE));

        board.setDie(6, new Die(Color.RED, Number.ONE));
        board.setDie(7, new Die(Color.YELLOW, Number.THREE));
        board.setDie(8, new Die(Color.YELLOW, Number.ONE));
        //board.setDie(9, new Die(Color.YELLOW, Number.ONE));
        board.setDie(10, new Die(Color.YELLOW, Number.ONE));

        board.setDie(11, new Die(Color.GREEN, Number.ONE));
        board.setDie(12, new Die(Color.BLUE, Number.ONE));
        board.setDie(13, new Die(Color.YELLOW, Number.ONE));
        board.setDie(14, new Die(Color.YELLOW, Number.ONE));
        board.setDie(15, new Die(Color.YELLOW, Number.TWO));

        board.setDie(16, new Die(Color.PURPLE, Number.ONE));
        board.setDie(17, new Die(Color.GREEN, Number.SIX));
        board.setDie(18, new Die(Color.YELLOW, Number.ONE));
        board.setDie(19, new Die(Color.YELLOW, Number.FOUR));
        board.setDie(20, new Die(Color.YELLOW, Number.FIVE));
    }

    @Test
    void calculateScore() {
        assertEquals(6, ScoreCalculator.calculateScore(1, board));
        assertEquals(5 * 2, ScoreCalculator.calculateScore(2, board));
        assertEquals(5, ScoreCalculator.calculateScore(3, board));
        assertEquals(4, ScoreCalculator.calculateScore(4, board));
        assertEquals(2 * 2, ScoreCalculator.calculateScore(5, board));
        assertEquals(2, ScoreCalculator.calculateScore(6, board));
        assertEquals(2 * 2, ScoreCalculator.calculateScore(7, board));
        assertEquals(5, ScoreCalculator.calculateScore(8, board));
        assertEquals(14, ScoreCalculator.calculateScore(9, board));
        assertEquals(4 * 2, ScoreCalculator.calculateScore(10, board));
        assertEquals(3, ScoreCalculator.calculateScore(11, board));
        assertEquals(20, ScoreCalculator.calculateScore(12, board));
        assertEquals(12, ScoreCalculator.calculateScore(13, board));
        assertEquals(4, ScoreCalculator.calculateScore(14, board));
        assertEquals(7, ScoreCalculator.calculateScore(15, board));
    }
}