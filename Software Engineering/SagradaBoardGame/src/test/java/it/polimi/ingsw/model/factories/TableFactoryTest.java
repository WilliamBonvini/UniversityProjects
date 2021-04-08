package it.polimi.ingsw.model.factories;

import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.model.Player;
import it.polimi.ingsw.model.Table;
import it.polimi.ingsw.utils.Couple;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class TableFactoryTest {

    @Test
    void createTable() {
        List<Couple<String, Integer>> usersAndBoardIds = new ArrayList<>(2);
        usersAndBoardIds.add(new Couple<>("a", 1)); //kaleidoscopic dream
        usersAndBoardIds.add(new Couple<>("b", 2)); //firmitas
        Table t  = TableFactory.createTable(usersAndBoardIds);

        assertEquals(t.getPlayer("a").getBoard().getCellById(1).getColorConstraint(), Color.YELLOW);
        assertEquals(t.getPlayer("a").getBoard().getCellById(1).getValueConstraint(), Number.NONE);

        boolean existsA = false;
        List<Player> players = t.getPlayers();
        assertEquals(2, players.size());
        for (Player p : players) {
            if (p.getName().equals("a"))
                existsA = true;
        }
        assertTrue(existsA);
    }
}