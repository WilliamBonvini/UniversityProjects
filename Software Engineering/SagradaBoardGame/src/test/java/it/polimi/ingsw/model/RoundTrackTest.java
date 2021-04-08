package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.NoSuchElementException;
import it.polimi.ingsw.exceptions.RoundIndexOutOfBoundException;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class RoundTrackTest {

    @Test
    void addDie() {
        RoundTrack track = new RoundTrack();

        assertEquals(0, track.getAll().size());

        try {
            track.addDie(new Die(Color.BLUE, Number.FIVE), 3);
        } catch (RoundIndexOutOfBoundException e) {
            e.printStackTrace();
        }

        assertEquals(new Die(Color.BLUE, Number.FIVE), track.getAll().get(0));

        assertThrows(RoundIndexOutOfBoundException.class, () -> track.addDie(new Die(Color.GREEN, Number.FOUR), 10));
    }

    @Test
    void getDice() {
        RoundTrack track = new RoundTrack();

        try {
            track.addDie(new Die(Color.BLUE, Number.FIVE), 3);
        } catch (RoundIndexOutOfBoundException e) {
            e.printStackTrace();
        }

        assertEquals(1, track.getAll().size());
        assertEquals(new Die(Color.BLUE, Number.FIVE), track.getAll().get(0));
        assertEquals(new Die(Color.BLUE, Number.FIVE), track.getAll().get(0));
    }

    @Test
    void getDice1() {
        RoundTrack track = new RoundTrack();

        try {
            track.addDie(new Die(Color.BLUE, Number.FIVE), 3);
        } catch (RoundIndexOutOfBoundException e) {
            e.printStackTrace();
        }

        try {
            assertEquals(1, track.getDice(3).size());
        } catch (RoundIndexOutOfBoundException e) {
            e.printStackTrace();
        }
        assertEquals(new Die(Color.BLUE, Number.FIVE), track.getAll().get(0));
        assertEquals(new Die(Color.BLUE, Number.FIVE), track.getAll().get(0));

        assertThrows(RoundIndexOutOfBoundException.class, () -> track.getDice(10).size());
    }

    @Test
    void Test2() {
        RoundTrack rt1 = new RoundTrack();

        assertEquals(90, rt1.size());
        assertEquals(0, rt1.getAll().size());
        assertTrue(rt1.isEmpty(1));

        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 9; j++) {
                rt1.addDie(new Die(Color.BLUE, Number.TWO), i);
            }
        }

        assertEquals(90, rt1.getAll().size());
        assertTrue(!rt1.isEmpty(8));

        RoundTrack rt2 = new RoundTrack(rt1);

        rt2.setDie(13, new Die(Color.RED, Number.THREE));

        assertNotEquals(rt2, rt1);

        RoundTrack rt3 = new RoundTrack(rt1);
        rt3.removeDie(23);

        assertNotEquals(rt3, rt1);

        assertEquals(new Die(Color.BLUE, Number.TWO),rt3.getDie(1));

    }

}