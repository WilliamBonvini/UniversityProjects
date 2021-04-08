package it.polimi.ingsw.connection.messages.server;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.connection.client.AbstractServerHandler;
import it.polimi.ingsw.utils.Couple;

import java.util.Arrays;
import java.util.List;

/**
 * Message which notify a client that the game ended, either for forfeit or normally
 */
public class GameEndedMessage extends AbstractServerMessage {
    private static final String MESSAGE_TYPE = "game_ended";
    private Couple<String, Integer>[] playersAndScores;
    private boolean forfeitWin;


    /**
     * Create a standard GameEndedMessage, with players and associated scores.
     * @param forfeitWin true if is a victory caused by other players' forfeit
     * @param playersAndScores the list of player-score couples
     */
    public GameEndedMessage(List<Couple<String, Integer>> playersAndScores, boolean forfeitWin) {
        super(MESSAGE_TYPE);
        this.playersAndScores = new Couple[playersAndScores.size()];
        for (int i = 0; i < playersAndScores.size(); i++) {
            this.playersAndScores[i] = playersAndScores.get(i);
        }
        this.forfeitWin = forfeitWin;
    }

    /**
     * Create an empty GameEndedMessage.
     * Use this constructor only to notify a generic closure of the game, without point assignments
     */
    public GameEndedMessage() {
        super(MESSAGE_TYPE);
        forfeitWin = true;
    }

    @Override
    public void doOperation(AbstractServerHandler ash) {
        UIManager.instance().getUIGame().notifyEndGame(Arrays.asList(playersAndScores), forfeitWin);
    }
}
