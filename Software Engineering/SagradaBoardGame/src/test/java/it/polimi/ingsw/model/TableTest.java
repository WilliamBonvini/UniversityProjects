package it.polimi.ingsw.model;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class TableTest {

    @Test
    void getPlayers() {
        Table t = new Table();
        t.addPlayer("testname0");
        t.addPlayer("testname1");
        assertEquals(2, t.getPlayers().size());

        t = new Table();
        t.addPlayer("testname0");
        t.addPlayer("testname1");
        t.addPlayer("testname2");
        assertEquals(3, t.getPlayers().size());

        t = new Table();
        t.addPlayer("testname0");
        t.addPlayer("testname1");
        t.addPlayer("testname2");
        t.addPlayer("testname3");
        assertEquals(4, t.getPlayers().size());
    }

    @Test
    void getPool() {
        Table t = new Table();

        assertNotEquals(null, t.getPool());
    }

    @Test
    void getDiceBag() {
        Table t = new Table();

        assertNotEquals(null, t.getDiceBag());
    }

    @Test
    void getToolCard() {
        Table t = new Table();

        assertThrows(ArrayIndexOutOfBoundsException.class, () -> t.getToolCard(0));
    }

    @Test
    void getPublicObjective() {
        Table t = new Table();

        assertNotEquals(null, t.getPublicObjective(1));
    }

    @Test
    void getRoundTrack() {
        Table t = new Table();

        assertNotEquals(null, t.getRoundTrack());
    }
}