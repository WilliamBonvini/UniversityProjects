package it.polimi.ingsw.client.view.ui.uigame.uiutils;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.client.view.ui.uigame.GUIGame;
import it.polimi.ingsw.client.view.ui.uigame.RankingController;
import it.polimi.ingsw.client.view.ui.uimenu.GUIMenu;
import it.polimi.ingsw.client.view.ui.uimenu.GUIMenuController;
import it.polimi.ingsw.globals.FilepathGlobals;
import it.polimi.ingsw.utils.Console;
import it.polimi.ingsw.utils.Couple;
import it.polimi.ingsw.utils.Logger;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

import java.util.List;


/**
 * This is the class which launches all scenes from the Application
 * All scenes must be set from here because GUILauncher extends Application, which works on a separate thread
 */
public class GUILauncher extends Application {
    private GUIGame guiGame;
    private GUIMenuController guiMenuController;
    private Stage primaryStage;
    public GUILauncher(){
        guiGame = new GUIGame();
    }



    /**
     * Sets the first scene of the gui, which is the GUIMenu
     *
     * @param primaryStage the only stage of the application
     */
    @Override
    public void start(Stage primaryStage) {
        try {

            if(UIManager.instance().getUIGame()==null) {
                UIManager.instance().setUIGame(new GUIGame());
                GUIMenu guiMenu = new GUIMenu();
                UIManager.instance().setFocusUI(guiMenu);
            }

            //Sets the references to the stage and to the App GUILauncher
            this.primaryStage = primaryStage;

            //Load the menu
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/fxml/GUIMenu.fxml"));
            BorderPane root = loader.load();
            Scene menu = new Scene(root);
            if(loader.getController().getClass().equals(GUIMenuController.class)){
                guiMenuController = loader.getController();
            }
            guiMenuController.setGUILauncher(this);

            primaryStage.setTitle("GUIMenu");
            primaryStage.setScene(menu);
            primaryStage.show();
        } catch (Exception e) {
            e.printStackTrace();
            Logger.std().error("The menu has not started");
        }
    }


    /**
     * Starts the game scene by instantiating a GUIGame and calling its initialize method.
     * Moreover passes the references of the GUIMenuController and the GUILauncher to the controller (GUIGame) because
     * they are needed to handle certain events in the GUIGame that launch different scenes.
     */
    public void startGame() {
        try {
            FXMLLoader loader   = new FXMLLoader(getClass().getResource("/fxml/GUIGame.fxml"));
            BorderPane root     = loader.load();

            if(loader.getController().getClass().equals(GUIGame.class)){
                guiGame = loader.getController();
                guiGame.setGUIMenuController(guiMenuController);
                guiGame.setGUILauncher(this);
            }

            Scene guiGameScene  = new Scene(root);
            primaryStage.setTitle("GUIGame");
            primaryStage.setScene(guiGameScene);
            primaryStage.setMaximized(true);
            primaryStage.show();
        } catch (Exception e) {
            Logger.std().error("The game has not started");
        }
    }

    /**
     * It's called when the game terminates in an unexpected way or the player quits the game or wants to
     * start a new game.
     * it displays such message and gives the possibility to log back to the game or to start
     * a new one
     */
    public void startMenu(){
        start(primaryStage);
        //newGame=false;
    }

    /**
     * Starts the ranking scene which consists in showing the scores of each player in the end of the game
     * @param playersAndScores a list of couple that consists in the name and the relative score of each player
     * @param isForfeitWin a boolean that tells if everyone won the game or not. everyone wins the game in case of even score among the players.
     */
    public void startRanking(List<Couple<String, Integer>> playersAndScores, boolean isForfeitWin){
        try {
            FXMLLoader loader   = new FXMLLoader(getClass().getResource("/fxml/Ranking.fxml"));
            BorderPane root     = loader.load();

            Scene rankingScene  = new Scene(root);
            if(loader.getController().getClass().equals(RankingController.class)){
                ((RankingController)loader.getController()).setScores(playersAndScores,isForfeitWin);
                ((RankingController)loader.getController()).setGUILauncher(this);
            }
            primaryStage.setTitle("Ranking");
            primaryStage.setScene(rankingScene);
            primaryStage.show();
        } catch (Exception e) {
            e.printStackTrace();
            Logger.std().error("The Ranking scene has not started");
        }

    }
}
