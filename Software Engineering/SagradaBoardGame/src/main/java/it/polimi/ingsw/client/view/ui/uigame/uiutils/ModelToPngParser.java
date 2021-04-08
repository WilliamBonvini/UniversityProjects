package it.polimi.ingsw.client.view.ui.uigame.uiutils;

import it.polimi.ingsw.client.view.viewelements.ViewBoardCell;
import it.polimi.ingsw.client.view.viewelements.ViewComponent;
import it.polimi.ingsw.client.view.viewelements.ViewObjective;
import it.polimi.ingsw.client.view.viewelements.ViewToolCard;
import it.polimi.ingsw.globals.FilepathGlobals;

public final class ModelToPngParser {
    private static final String FILE = "file:";
    private static final String PATH_IMG = FILE + FilepathGlobals.RESOURCES_FOLDER_PATH + "img/";
    private static final String PATH_DICE = PATH_IMG + "dice/";
    private static final String PATH_OBJ = PATH_IMG + "objective_cards/obj";
    private static final String PATH_TOOL = PATH_IMG + "tool_cards/toolcard";
    public static final String BLUE = "blue";
    public static final String YELLOW = "yellow";
    public static final String PURPLE = "purple";
    public static final String GREEN = "green";
    public static final String RED = "red";
    public static final String ONE = "one";
    public static final String TWO = "two";
    public static final String THREE = "three";
    public static final String FOUR = "four";
    public static final String FIVE = "five";
    public static final String SIX = "six";
    private static final String PATH_CONSTR = PATH_DICE + "constraint_";
    private static final String PNG = ".png";
    static final String FAVOUR = "boardfavourpoints";
    static final String NOFAVOUR = "boardfavourpoints_white";
    static final String PATH_TOOLCARDFAVOURIMG =PATH_IMG+"favourpoints"+PNG;
    static final String PATH_DICEBAGIMG = PATH_IMG + "dicebag" + PNG;

    ModelToPngParser(){

    }

    /**
     * It always prints a die or an empty space.
     * if the viewcomponent is set to None it prints a grey square, otherwise it prints the actual die
     * @param viewComponent a view component which can be bot an empty cell or a die.
     * @return the path of such component
     */
    String parseToPng(ViewComponent viewComponent) {
        String path;
        String value;
        value = viewComponent.toString();
         if (viewComponent.isNone()) {
            path = PATH_CONSTR;
         } else {
             path = PATH_DICE + value + PNG;
         }
        return path;
    }

    /**
     * parses a Board cell into a path
     * @param viewBoardCell the cell of a board that needs to be parsed into a png
     * @return  the path of his constraint if there is no die placed on it, or in the die in it there is one
     */
    String parseToPng(ViewBoardCell viewBoardCell){
        String path;
        if(viewBoardCell.getDie().isNone())
            path = PATH_CONSTR + viewBoardCell.getConstraint().toString() + PNG;
        else {
            path = PATH_DICE + viewBoardCell.getDie().toString() + PNG;
        }
        return path;
    }

    /**
     * Parses a favoir point into his relative png path.
     * @param favour the favour cell that needs to be parsed into an image. a cell can be empty or not
     * @return the path of the png of such favour
     */
    String parseToPng(String favour){
        if(favour.equals(FAVOUR))
            return PATH_IMG + FAVOUR + PNG;
        else if(favour.equals(NOFAVOUR))
            return  PATH_IMG + NOFAVOUR + PNG;
        else
            throw new IllegalArgumentException();
    }


    /**
     * Parses a tool card into its relative png path.
     * @param viewToolCard an object that contains information about a specific tool card
     * @return the path of the png of such tool card
     */
    String parseToPng(ViewToolCard viewToolCard){
        return PATH_TOOL+viewToolCard.getNumToolCard()+PNG;
    }

    /**
     * Parses a public objective card into ints relative png path
     * @param viewPublicObjective an object that contains information about a specific public objective card
     * @return the path of the png of such public objective card
     */
    String parseToPng(ViewObjective viewPublicObjective){

        return PATH_OBJ + viewPublicObjective.getID()+PNG;

    }


}
