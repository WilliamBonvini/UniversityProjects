package it.polimi.ingsw.model.factories;

import it.polimi.ingsw.model.Board;
import it.polimi.ingsw.model.Player;
import it.polimi.ingsw.model.Table;
import it.polimi.ingsw.utils.Couple;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Factory-class used to create a Table ready for a Game
 */
public class TableFactory {

    private TableFactory() {}

    /**
     * Generate a table, with everything
     * @param usersAndBoardIDsCouples the list of couple User-BoardID used to build up the table. (note: will be shuffled)
     * @return a new Table without boards assigned, but with the standard setup for a match
     */
    public static Table createTable(List<Couple<String, Integer>> usersAndBoardIDsCouples) {

        //the constructor set up by default the standard things of a match
        Table table = new Table();

        ObjectiveFactory objectiveFactory = new ObjectiveFactory();

        //set tools
        ArrayList<Integer> randTools = new ArrayList<>(12);
        for (int i = 1; i <= 12; i++) {
            randTools.add(i);
        }
        Collections.shuffle(randTools);
        for (int i = 0; i < table.getToolCards().size(); i++) {
            table.setToolCard(i + 1, randTools.get(i));
        }

        //set public objectives
        List<Integer> publicObjectives = new ArrayList<>(table.getPublicObjectives().size());
        for (int i = 0; i < table.getPublicObjectives().size(); i++) {
            publicObjectives.add(objectiveFactory.getRandomPublicObjectiveID());
        }
        table.setPublicObjectives(publicObjectives);



        int id = 0;

        //for each couple, which represent a player and its board, set up the corresponding player
        for (Couple<String, Integer> couple: usersAndBoardIDsCouples) {
            //set up a player
            Player player = new Player(id, couple.getFirst());
            id++;
            //assign the board identified by that ID
            Board b = BoardFactory.getBoardByID(couple.getSecond());
            player.assignBoard(b);
            //assign the points
            player.setFavourPoints(b.getFavourDifficulty());


            //set private objective
            player.setPrivateObjective(objectiveFactory.getRandomPrivateObjectiveID());


            //add him to the table
            table.addPlayer(player);
        }


        //set up the first player. It's shuffled so the first element is random
        table.setFirstPlayer(usersAndBoardIDsCouples.get(0).getFirst());

        //now the table is complete, return it
        return table;
    }

}
