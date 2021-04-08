package it.polimi.ingsw.client.view.ui.uigame.uiutils;

import it.polimi.ingsw.client.view.ui.uigame.GUIGame;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

public class GUIGameDrawer {

    private static final int MAXNUMFAVOURS = 6;

    private GUIGame guiGame;

    private ModelToPngParser pngParser;
    private VBox boardBox;
    private HBox boardBoxHeader;
    private HBox toolCardsBox;
    private HBox headerBox;
    private HBox higherFooterBox;
    private HBox poolAndRoundtrackBox;
    private Label boardBoxLabel;

    /**
     * Sets the visibility and shows the images that corresponds to the subjects of the game
     * @param guigame the reference to the controller of the main scene
     * @param boardsBox the reference to the node that contains the boards
     * @param root the referenc to the root node of the game scene
     */
    public GUIGameDrawer(GUIGame guigame, HBox boardsBox, BorderPane root){

        pngParser = new ModelToPngParser();

        this.guiGame = guigame;

        headerBox = (HBox) root.getChildren().get(0);

        toolCardsBox = (HBox) ((VBox) headerBox.getChildren().get(2)).getChildren().get(1);

        VBox footerBox = (VBox) root.getChildren().get(2);

        higherFooterBox = (HBox) footerBox.getChildren().get(0);
        poolAndRoundtrackBox = (HBox) footerBox.getChildren().get(1);

        for (int i = 0; i < 4; i++) {
            boardBox = (VBox) boardsBox.getChildren().get(i);
            boardBoxHeader = (HBox) boardBox.getChildren().get(0);
            boardBoxLabel = (Label) boardBoxHeader.getChildren().get(0);

            boardBoxLabel.getStylesheets().add(getClass().getResource("/stylesCSS/boardStyle.css").toExternalForm());
            boardBoxLabel.getStyleClass().add("notCurrentBoard");
        }
    }

    /**
     * Shows the pictures in the boards in the GUI
     * @param boardsBox the reference to the VBox that contains the boards in the game scene
     */
    public void printBoards(HBox boardsBox){
        for (int i = 0; i <boardsBox.getChildren().size()-1; i++) {

            boardBox = (VBox) boardsBox.getChildren().get(i);
            boardBoxHeader = (HBox) boardBox.getChildren().get(0);

            //Prints the names of the boards or of the player
            boardBoxLabel = (Label) boardBoxHeader.getChildren().get(0);
            boardBoxLabel.setText(guiGame.getBoard(i + 1).getName());

            //Prints the favour points of the board or of the player
            HBox boardFavourPointsBox = (HBox) boardBoxHeader.getChildren().get(1);
            int numFavours = guiGame.getBoard(i+1).getFavours();
            for (int j = 0; j < MAXNUMFAVOURS; j++) {
                ImageView boardFavourPointImg = (ImageView) boardFavourPointsBox.getChildren().get(j);
                if (j < numFavours) {
                    boardFavourPointImg.setImage(new Image(pngParser.parseToPng(ModelToPngParser.FAVOUR)));
                } else {
                    boardFavourPointImg.setImage(new Image(pngParser.parseToPng(ModelToPngParser.NOFAVOUR)));
                }
            }

            //Prints the dice or the constraints contained in the boards
            GridPane board = (GridPane) boardBox.getChildren().get(1);
            for (int j = 0; j < 20; j++){
                ImageView boardCell = (ImageView) board.getChildren().get(j);
                boardCell.setImage(new Image(pngParser.parseToPng(guiGame.getBoard(i+1).getCell(j + 1))));
            }
        }
    }


    /**
     * changes the background color and the radius of the box that contains the name of the current player
     * @param boardsBox the HBOx that contains the boards in the game scene
     */
    public void printCurrentPlayer(HBox boardsBox){

        for (int i = 0; i <guiGame.getNumOfPlayers()/*boardsBox.getChildren().size()-1*/; i++) {
            boardBox = (VBox) boardsBox.getChildren().get(i);
            boardBoxHeader = (HBox) boardBox.getChildren().get(0);
            boardBoxLabel = (Label) boardBoxHeader.getChildren().get(0);

            if(guiGame.getBoard(i+1).getName().equals(guiGame.getCurrentPlayer())){
                boardBoxLabel.getStyleClass().remove(0,boardBoxLabel.getStyleClass().size()-1);
                boardBoxLabel.getStyleClass().add("currentBoard");

            }else{
                boardBoxLabel.getStyleClass().remove(0,boardBoxLabel.getStyleClass().size()-1);
                boardBoxLabel.getStyleClass().add("notCurrentBoard");
            }
        }
    }

    /**
     * Updates and shows all the dice contained in the pool of the game
     * @param poolDiceBox the HBox that contains all the ImageView that represents the dice in the pool
     */
    public void printPool(HBox poolDiceBox){
        ImageView poolDie;
        for (int i = 0; i < 9; i++) {
            poolDie = (ImageView) poolDiceBox.getChildren().get(i);
            poolDie.setImage(new Image(pngParser.parseToPng(guiGame.getPool()[i])));
        }
    }

    /**
     * Updates and shows the favour points used with the relative tool card
     */
    public void printToolFavourPoints(){
        for (int i = 0; i < 3 ; i++) {
            VBox toolCard = (VBox) toolCardsBox.getChildren().get(i);
            HBox toolCardFavourPoints = (HBox) toolCard.getChildren().get(1);
            Text numToolCardFavourPoints = (Text) toolCardFavourPoints.getChildren().get(1);
            numToolCardFavourPoints.setText(Integer.toString(guiGame.getToolCard(i+1).getNumFavourPoints()));
        }
    }


    /**
     * Sets visible only the needed boards to play the game
     * @param numPlayers the number of players in the game
     * @param boardsBox the HBox that contains all the boards of the game scene
     */
    public void setBoardsVisibility(int numPlayers, HBox boardsBox){
        for (int i = 0; i < 4; i++) {
            boardBox = (VBox) boardsBox.getChildren().get(i);
            if(i<numPlayers)
                boardBox.setVisible(true);
            else
                boardBox.setVisible(false);
        }
    }

    /**
     * Sets visible the buttons with whom the player can choose an option. Options are given only by certain tool cards
     * and they consist in choices.
     */
    public void setChooseButtonsVisible() {
        BorderPane communicationPane = (BorderPane) headerBox.getChildren().get(3);
        HBox chooseButtons = (HBox) communicationPane.getChildren().get(2);
        for (int i = 0; i < chooseButtons.getChildren().size()-1; i++) {
            Button chooseButton = (Button) chooseButtons.getChildren().get(i);
            chooseButton.setVisible(true);
        }
    }

    /**
     * Sets invisible the buttons with whom the player can choose an option. Options are given only by certain tool cards
     * and they consist in choices.
     */
    public void setChooseButtonsInvisible() {
        BorderPane communicationPane = (BorderPane) headerBox.getChildren().get(3);
        HBox chooseButtons = new HBox();
        for (int i = 0; i < communicationPane.getChildren().size(); i++) {
            if(communicationPane.getChildren().get(i).getClass().equals(HBox.class))
                chooseButtons = (HBox) communicationPane.getChildren().get(i);
        }

        for (int i = 0; i < chooseButtons.getChildren().size()-1; i++) {
            Button chooseButton = (Button) chooseButtons.getChildren().get(i);
            if(chooseButton.isVisible()) {
                chooseButton.setVisible(false);
            }
        }
    }

    /**
     * Prints the dice presents in the current box, which consists in the hand of the current player.
     */
    public void printCurrent(){
        ImageView imageView;
        VBox currentBox = (VBox) higherFooterBox.getChildren().get(0);
        HBox currentDiceBox = (HBox) currentBox.getChildren().get(1);

        for (int i = 0; i < 9; i++) {
            imageView = (ImageView) currentDiceBox.getChildren().get(i);
            imageView.setImage(new Image(pngParser.parseToPng(ModelToPngParser.NOFAVOUR)));
        }
        for (int i = 0; i < guiGame.getCurrentPlayerHand().size(); i++) {
            imageView = (ImageView) currentDiceBox.getChildren().get(i);
            imageView.setImage(new Image(pngParser.parseToPng(guiGame.getCurrentPlayerHand().get(i)/*,"pool_current"*/)));
        }
    }

    /**
     * Updates the name of the dice bag owner
     */
    public void printDiceBagOwner(){
        VBox dicebagOwnerBox = (VBox) poolAndRoundtrackBox.getChildren().get(3);
        Text dicebagOwnerText = (Text) dicebagOwnerBox.getChildren().get(0);
        ImageView dicebagImgView = (ImageView) dicebagOwnerBox.getChildren().get(1);
        dicebagOwnerText.setText(guiGame.getDiceBagOwner());
        dicebagImgView.setImage(new Image(pngParser.PATH_DICEBAGIMG));
    }

    /**
     * Shows the tool cards and the objective cards for the actual game.
     */
    public void printSetupCards(){
        for(int i=0; i<toolCardsBox.getChildren().size();i++){
            VBox toolCardBox = (VBox) toolCardsBox.getChildren().get(i);
            ImageView toolCardImgView = (ImageView) toolCardBox.getChildren().get(0);
            HBox toolCardFooter = (HBox) toolCardBox.getChildren().get(1);
            ImageView toolCardFavourPointsImgView = (ImageView) toolCardFooter.getChildren().get(0);
            Text toolCardFavourPointsText = (Text) toolCardFooter.getChildren().get(1);

            toolCardImgView.setImage(new Image(pngParser.parseToPng(guiGame.getToolCard(i+1))));
            toolCardFavourPointsText.setText("0");
            toolCardFavourPointsImgView.setImage(new Image(pngParser.PATH_TOOLCARDFAVOURIMG));

            HBox publicObjectivesBox = (HBox)((VBox) headerBox.getChildren().get(1)).getChildren().get(1);
            ImageView pubObjImgView = (ImageView) publicObjectivesBox.getChildren().get(i);

            //Setting the public objective cards
            pubObjImgView.setImage(new Image(pngParser.parseToPng(guiGame.getPublicObjective(i+1))));


            VBox privateObjectiveBox = (VBox) headerBox.getChildren().get(0);
            ImageView privateObjImgView = (ImageView) privateObjectiveBox.getChildren().get(1);

            //Setting the private objective cards:
            privateObjImgView.setImage(new Image(pngParser.parseToPng(guiGame.getPrivateObjective())));
        }
    }

    /**
     * Updates and shows the roundtrack of the game scene
     * @param level of the roundtrack that the player wants to see.
     *              it goes from 0 to 8.
     */
    public void printRoundtrack(int level){

        VBox roundtrackBox = (VBox) poolAndRoundtrackBox.getChildren().get(1);
        HBox roundtrackBoxHeader = (HBox) roundtrackBox.getChildren().get(0);
        HBox roundtrackDiceBox = (HBox) roundtrackBox.getChildren().get(1);
        ImageView roundtrackDiceImgView;
        for (int i = 0; i < roundtrackDiceBox.getChildren().size(); i++) {
            roundtrackDiceImgView = (ImageView) roundtrackDiceBox.getChildren().get(i);
            roundtrackDiceImgView.setImage(new Image(pngParser.parseToPng(guiGame.getRoundtrack().getComponent(level,i))));
        }
        if(level==0){
            Button roundtrackButton = (Button) roundtrackBoxHeader.getChildren().get(1);
            roundtrackButton.setText("1");
        }
    }
}


