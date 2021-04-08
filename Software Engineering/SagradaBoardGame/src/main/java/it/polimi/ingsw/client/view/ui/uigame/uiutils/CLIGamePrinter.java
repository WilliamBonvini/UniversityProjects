package it.polimi.ingsw.client.view.ui.uigame.uiutils;

import it.polimi.ingsw.client.view.factories.ViewChoiceFactory;
import it.polimi.ingsw.client.view.ui.uigame.CLIGame;
import it.polimi.ingsw.client.view.viewelements.*;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.utils.Console;
import org.fusesource.jansi.Ansi;

import java.util.List;

import static org.fusesource.jansi.Ansi.ansi;

public class CLIGamePrinter {

    private static final int BOARD_OFFSET = 4; //the char distance from the start of a board to the start of the next one
    private static final int BOARD_NAME_LENGTH = 15;

    private int offset = 2;

    CLIGame cliGame;

    public CLIGamePrinter(CLIGame cliGame) {
        this.cliGame = cliGame;
    }

    /**
     * Print boards in choosePhase. Differs from a normal print because of name not cut to BOARD_NAME_LENGTH chars
     */
    public void printChooseBoards() {

        StringBuilder result = new StringBuilder();
        String offsetString = buildLineOf(' ', offset);

        result.append(buildLineOf(' ', offset));
        //find the longest name, save as max name length
        int maxNameLength = BOARD_NAME_LENGTH;
        for (int i = 1; i <= cliGame.numOfBoards(); i++) {
            if(maxNameLength < cliGame.getBoard(i).getName().length())
                maxNameLength = cliGame.getBoard(i).getName().length();
        }
        buildPlayerLine(result, maxNameLength, BOARD_OFFSET);
        //calculate the new offset between boards, given that maxNameLength is at minimum BOARD_NAME_LENGTH
        int newOffset = maxNameLength - BOARD_NAME_LENGTH + BOARD_OFFSET;

        result.append('\n'+offsetString);

        buildFavoursLine(result, newOffset);

        result.append('\n'+offsetString);

        buildGrids(result, offsetString, newOffset);

        Console.println(result.toString());
    }


    /**
     * Print the whole Game in Console
     */
    public void printCLIGame() {

        StringBuilder screen = new StringBuilder();

        screen.append(buildLineOf('-', (BOARD_NAME_LENGTH+offset)*cliGame.getNumOfPlayers()));
        screen.append('\n'+objectivesString()+'\n');
        screen.append(toolString() + '\n');
        screen.append(roundTrackString() + '\n');
        screen.append(bagOwnerString() + "\n\n");
        screen.append(boardsString(offset) + '\n');
        screen.append(poolString() + "\n\n");
        screen.append(handString() + "\n");
        screen.append(choiceString());
        screen.append(buildLineOf('-', (BOARD_NAME_LENGTH+offset)*cliGame.getNumOfPlayers()));
        screen.append('\n');

        Console.print(screen.toString());
    }


    private String handString() {
        StringBuilder result = new StringBuilder();
        List<ViewComponent> diceInHand = cliGame.getCurrentPlayerHand();

        result.append("Mano del giocatore corrente: ");
        for (int i = 0; i < diceInHand.size(); i++) {
            result.append(dieStringFromViewComponent(diceInHand.get(i)) + " ");
        }
        return result.toString();
    }

    private String choiceString() {
        if(cliGame.isActiveChoose()) {

            StringBuilder result = new StringBuilder();
            ViewChoice choice = ViewChoiceFactory.getViewChoiceById(cliGame.getChooseId());
            result.append(choice.getQuestion()+'\n');

            if (choice.getOptions() == null)
                return result.toString();

            for (int i = 0; i < choice.getOptions().length; i++) {
                result.append("<"+choice.getOptions()[i].getFirst()+">:"+choice.getOptions()[i].getSecond()+'\n');
            }
            return result.toString();
        } else
            return "";
    }


    private String roundTrackString() {
        StringBuilder result = new StringBuilder();
        int height = cliGame.getRoundtrack().getHeight();
        ViewRoundTrack roundTrack = cliGame.getRoundtrack();
        //build the string
        for (int i = height-1; i >= 0; i--) {//on a new line, print the number of line x10
            if(i > 0)
                result.append((i*10)+"- ");
            else
                result.append("00- ");

            //append the dice on that height, of each round, plus the space after each
            for (int round = 0; round < roundTrack.getRounds(); round++) {
                result.append(dieStringFromViewComponent(roundTrack.getComponent(i, round)) + ' ');
            }
            //re-append the number at the end, plus new line
            result.append("-" + (i==0 ? "00" :(i*10)) + '\n');
        }
        //last part, the numbers under dice
        result.append("    "); //4 spaces, aligned with precedent format

        for (int i = 1; i <= roundTrack.getRounds(); i++) {
            result.append("[" + i + "] ");
        }
        result.append('\n');

        return result.toString();
    }



    private String objectivesString() {
        StringBuilder result = new StringBuilder();
        String publicObjectives = "Obiettivi pubblici: ";
        result.append(ansi().bold().a(publicObjectives).reset().toString());

        for (int i = 0; i < cliGame.getPublicObjectives().length; i++) {
            ViewObjective objective = cliGame.getPublicObjectives()[i];
            result.append("{"+objective.getValue()+"} "+objective.getName()+"\n" + buildLineOf(' ', publicObjectives.length()));
        }
        result.append('\n');
        //now the private Objective
        result.append(ansi().bold().a("Obiettivo privato: ").reset().a(cliGame.getPrivateObjective().getName()).toString());

        result.append('\n');

        return result.toString();
    }



    private String toolString() {
        String tools = "Attrezzi: ";
        StringBuilder result = new StringBuilder();
        result.append(ansi().bold().a(tools).reset().toString());
        for (int i = 0; i < cliGame.getToolcards().length; i++) {
            result.append((i+1) + ": "+ cliGame.getToolcards()[i].getName() + " (" + cliGame.getToolcards()[i]
                    .getNumToolCard()+ ") " + buildLineOf('*', cliGame.getToolcards()[i].getNumFavourPoints())
                    + '\n' + buildLineOf(' ',tools.length()));
        }
        result.append('\n');

        return result.toString();

    }

    private String bagOwnerString() {
        return "(S): " + cliGame.getDiceBagOwner();
    }




    /**
     * Occupy 6 lines and 60 rows.
     * The format is: 12 chars occupied by name and board, then 4 of space between each board.
     *  @param offset how much spaces to leave blank from left border
     * @return the string which contains in order, all four boards, with names and favour points above.
     * Also highlights the current player
     *
     */
    private String boardsString(int offset) {
        StringBuilder result = new StringBuilder();
        String offsetString = buildLineOf(' ', offset);

        //first, the names plus the spaces
        result.append(offsetString);

        buildPlayerLine(result, BOARD_NAME_LENGTH, BOARD_OFFSET);

        result.append(" \n"+offsetString); //space and new line, plus offset

        //now the line for favours points
        buildFavoursLine(result, BOARD_OFFSET);

        result.append(" \n"+offsetString); //space and new line, plus offset for next line

        //now cell grid, line by line
        buildGrids(result, offsetString, BOARD_OFFSET);

        return result.toString();
    }


    private void buildGrids(StringBuilder result, String offsetString, int boardOffset) {
        for (int lineNum = 0; lineNum < ModelGlobals.boardSizeY(); lineNum++) { //FOR EACH MAJOR LINE (4)

            for (int boardNum = 1; boardNum <= cliGame.getNumOfPlayers(); boardNum++) { //FOR EACH BOARD (2-4)
                ViewBoard vb = cliGame.getBoard(boardNum);

                for (int cellNum = 0; cellNum < ModelGlobals.boardSizeX(); cellNum++) { //FOR EACH CELL IN A LINE (5)
                    ViewBoardCell cell = vb.getCell(lineNum, cellNum);
                    //if there's no die, append the constraint
                    if (cell.getDie().isNone())
                        result.append(cellStringFromViewComponent(cell.getConstraint()));
                    else //else append the die
                        result.append(dieStringFromViewComponent(cell.getDie()));

                }

                //end of a board's line. If not last, add an offset
                if(boardNum != cliGame.getNumOfPlayers())
                    result.append(buildLineOf(' ', boardOffset));
            }

            result.append(" \n" +offsetString);
        }
    }


    /**
     * print the player line. The distance between two names is maxNameLength - name.length + offset
     * @param result the stringbuilder where to append
     * @param maxNameLength the max name length for a name
     * @param offset is the offset between two names
     */
    private void buildPlayerLine(StringBuilder result, int maxNameLength, int offset) {
        //for each board, take the name
        for (int i = 1; i <= cliGame.getNumOfPlayers(); i++) {
            String name = cliGame.getBoard(i).getName();

            name = cliGame.getBoard(i).getName().substring(0, Math.min(name.length(), maxNameLength));

            //if is the current player, set a background to highlight him
            if(name.equals(cliGame.getCurrentPlayer())) {
                result.append(ansi().bg(Ansi.Color.CYAN).fg(Ansi.Color.BLACK).bold()
                        .a(name+buildLineOf(' ', BOARD_NAME_LENGTH - name.length())).reset().toString());

            } else { //else only name plus spaces up to maxNameLength chars
                result.append(name+buildLineOf(' ', maxNameLength - name.length()));
            }
            //append spaces remaining until next board, if is not the last board
            if(i != cliGame.getNumOfPlayers())
                result.append(buildLineOf(' ', offset));
        }
    }

    private void buildFavoursLine(StringBuilder result, int boardOffset) {
        for (int i = 1; i <= cliGame.getNumOfPlayers(); i++) {
            int favours = cliGame.getBoard(i).getFavours();
            //favour points plus remaining space
            result.append(buildLineOf('*', favours) + buildLineOf(' ', BOARD_NAME_LENGTH -favours));
            if(i!= cliGame.getNumOfPlayers())
                result.append(buildLineOf(' ', boardOffset));
        }
    }


    /**
     * build a string long numOfSpaces of char specified
     * @param c
     * @param numOfSpaces
     * @return
     */
    private String buildLineOf(Character c, int numOfSpaces) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numOfSpaces; i++) {
            sb.append(c);
        }
        return sb.toString();
    }




    private String poolString() {
        StringBuilder result = new StringBuilder();
        result.append(ansi().bold().a("Riserva: ").reset().toString());
        for (int i = 0; i < cliGame.getPool().length; i++) {
            if(!cliGame.getPool()[i].isNone()) {
                result.append((i+1) + ":" + dieStringFromViewComponent(cliGame.getPool()[i]) + " ");
            }
        }
        return result.toString();
    }









    /**
     * get a string representing a cell of a board, based on a view component
     * @param vc
     * @return the string. It's long 3 chars
     */
    private String cellStringFromViewComponent(ViewComponent vc) {
        //set the symbol in the cell: - if no constraint, O if color constraint, the vc's number if value constraint
        char valueConstraint;
        if(vc.getNumber() != Number.NONE)
            valueConstraint = String.valueOf(vc.getNumber().toNumber()).charAt(0);
        else if(vc.getColor() != Color.NONE)
            valueConstraint = '/';
        else
            valueConstraint = ' ';

        //now switch the vc's color and print the cell in format "[valueConstraint]" (long 3)
        switch (vc.getColor()) {
            case NONE:
                return "["+valueConstraint+"]";
            case GREEN:
                return ansi().fg(Ansi.Color.GREEN).a("["+valueConstraint+"]").fg(Ansi.Color.DEFAULT).toString();
            case BLUE:
                return ansi().fg(Ansi.Color.BLUE).a("["+valueConstraint+"]").fg(Ansi.Color.DEFAULT).toString();
            case PURPLE:
                return ansi().fg(Ansi.Color.MAGENTA).a("["+valueConstraint+"]").fg(Ansi.Color.DEFAULT).toString();
            case RED:
                return ansi().fg(Ansi.Color.RED).a("["+valueConstraint+"]").fg(Ansi.Color.DEFAULT).toString();
            case YELLOW:
                return ansi().fg(Ansi.Color.YELLOW).a("["+valueConstraint+"]").fg(Ansi.Color.DEFAULT).toString();
        }
        return "___"; //tmch, never happens
    }


    /**
     * convert a view component to a string suitable to represent a die
     * @param vc the view component which represent the die
     * @return the string representing the die (long 3 chars)
     */
    private String dieStringFromViewComponent(ViewComponent vc) {
        if (vc.isNone())
            return "   "; //3 spaces
        else {
            switch (vc.getColor()) {
                case YELLOW:
                    return ansi().bg(Ansi.Color.YELLOW).fg(Ansi.Color.BLACK).a(" "+vc.getNumber().toNumber()+" ")
                            .fg(Ansi.Color.DEFAULT).bg(Ansi.Color.DEFAULT).toString();
                case RED:
                    return ansi().bg(Ansi.Color.RED).fg(Ansi.Color.WHITE).a(" "+vc.getNumber().toNumber()+" ")
                            .fg(Ansi.Color.DEFAULT).bg(Ansi.Color.DEFAULT).toString();
                case PURPLE:
                    return ansi().bg(Ansi.Color.MAGENTA).fg(Ansi.Color.WHITE).a(" "+vc.getNumber().toNumber()+" ")
                            .fg(Ansi.Color.DEFAULT).bg(Ansi.Color.DEFAULT).toString();
                case BLUE:
                    return ansi().bg(Ansi.Color.BLUE).fg(Ansi.Color.WHITE).a(" "+vc.getNumber().toNumber()+" ")
                            .fg(Ansi.Color.DEFAULT).bg(Ansi.Color.DEFAULT).toString();
                case GREEN:
                    return ansi().bg(Ansi.Color.GREEN).fg(Ansi.Color.BLACK).a(" "+vc.getNumber().toNumber()+" ")
                            .fg(Ansi.Color.DEFAULT).bg(Ansi.Color.DEFAULT).toString();
                    default:
                        return "   ";///tmch
            }
        }
    }
}
