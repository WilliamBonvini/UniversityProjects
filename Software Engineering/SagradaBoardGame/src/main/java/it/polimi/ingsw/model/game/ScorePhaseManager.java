package it.polimi.ingsw.model.game;

import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Player;
import it.polimi.ingsw.model.Table;
import it.polimi.ingsw.model.game.objectives.ScoreCalculator;
import it.polimi.ingsw.utils.Couple;

import java.util.ArrayList;
import java.util.List;

/**
 * Handle the phase of score calculation
 */
public class ScorePhaseManager {




    /**
     * Start the Score Phase and calculate the scores, based on a Table
     */
    public List<Couple<String, Integer>> calculateScores(Table table) {
        List<Player> players = table.getPlayers();
        List<Couple<String, Integer>> playersAndScores = new ArrayList<>(players.size());
        Player player;
        int score;

        //for each player, calculate the score
        for (int i = 0; i < players.size(); i++) {
            score = 0;
            //take his board
            player = players.get(i);

            //calculate points for each public objective
            for (int j = 1; j <= table.getPublicObjectives().size(); j++) {
                score += ScoreCalculator.calculateScore(table.getPublicObjective(j), player.getBoard());
            }
            //now points for private objective
            score += ScoreCalculator.calculateScore(players.get(i).getPrivateObjective(), player.getBoard());

            //add 1 for each favour
            score += player.getFavourPoints();

            //subtract 1 for each empty cell
            score -= (ModelGlobals.boardSizeX()*ModelGlobals.boardSizeY() - player.getBoard().getAll().size());

            playersAndScores.add(new Couple(player.getName(), score));
        }

        return playersAndScores;
    }
}
