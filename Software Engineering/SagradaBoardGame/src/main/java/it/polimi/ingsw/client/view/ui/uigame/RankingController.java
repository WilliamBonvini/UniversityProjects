
package it.polimi.ingsw.client.view.ui.uigame;

import java.util.List;
import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.client.view.ui.uigame.uiutils.GUILauncher;
import it.polimi.ingsw.utils.Couple;
import javafx.fxml.FXML;
import javafx.scene.text.Text;

public class RankingController {

    @FXML
    private Text rankingText;
    private GUILauncher guiLauncher;



    /**
     * This method is called by the FXMLLoader when initialization is complete
     */
    @FXML
    void initialize() {
        assert rankingText != null : "fx:id=\"rankingText\" was not injected: check your FXML file 'Ranking.fxml'.";
    }


    /**
     * Starts a new game by instantiating a new GUIMenu and consequently a new Javafx Application
     */
    @FXML
    void startMenu() {
        guiLauncher.startMenu();
    }


    /**
     * sets the scores of the player at the end of the game
     * @param playersAndScores a list of couples made by the name of each player and their score
     * @param isForfeitWin a boolean that tells if all the players have won or not
     */
    public void setScores(List<Couple<String,Integer>> playersAndScores, boolean isForfeitWin){
        StringBuilder rankingBuilder = new StringBuilder();

        if(isForfeitWin){
            rankingText.setText("Hai vinto a tavolino!");
        }else{
            for (int i = 0; i < UIManager.instance().getUIGame().getNumOfPlayers(); i++) {
                rankingBuilder.append("il giocatore ").append(playersAndScores.get(i).getFirst()).append(" ha totalizzato ").append(playersAndScores.get(i).getSecond()).append(" punti\n");
            }
            rankingText.setText(rankingBuilder.toString());
        }
    }

    /**
     * Reference to the Javafx application that launches the ranking.fxml file
     * @param guiLauncher the javafx application that launches the ranking scene
     */
    public void setGUILauncher(GUILauncher guiLauncher){
        this.guiLauncher = guiLauncher;
    }
}
