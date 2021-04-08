package it.polimi.ingsw.client.view.ui.uigame;

import it.polimi.ingsw.client.view.ui.uigame.uiutils.UICommandParser;
import it.polimi.ingsw.client.view.ui.uigame.uiutils.CLIGamePrinter;
import it.polimi.ingsw.connection.client.ConnectionManager;
import it.polimi.ingsw.connection.messages.client.ChooseBoardReplyMessage;
import it.polimi.ingsw.connection.messages.client.QuitMessage;
import it.polimi.ingsw.utils.Console;
import it.polimi.ingsw.utils.Couple;

import java.util.ArrayList;
import java.util.List;

import static org.fusesource.jansi.Ansi.ansi;

public class CLIGame extends AbstractUIGame {

    private CLIGamePrinter gamePrinter;
    private UICommandParser commandParser;

    public CLIGame() {
        gamePrinter = new CLIGamePrinter(this);
        commandParser = new UICommandParser(this);
    }



    public void start(){

        handleGame();

        //if game is not terminated unexpectedly before, show scores
        if(!isGameTerminated())
            handleEndGame();
    }


    public void handleGame() {
        String input;

        while (!isEndgame()) {

            //read the input, whatever it is
            input = Console.nextLine();

            if(isEndgame()) {
                continue;
            }
            //if we are in lobby phase, only quit is an accepted command
            else if(!isChooseBoardReady()) {

                handleInputForLobby(input);

            } else //else if setup has not yet arrived we are in choose-board phase
                if(!isSetupReady()) {
                    handleInputForChooseBoard(input);
            } //else we are in game phase, parse the main input
            else //now decide based on input
                commandParser.parseAndOperate(input);
        }
    }

    /**
     * manage the input from user if he's in lobby
     * @param input
     */
    private void handleInputForLobby(String input) {
        if(commandParser.getCommandList().isQuitCommand(input)) {
            setStillInGame(false);
            ConnectionManager.instance().sendMessage(new QuitMessage());
            setEndGame(true);
            Console.println("Sei uscito dalla lobby!");
        }
    }

    /**
     * manage input for choose board phase
     * @param input
     */
    private void handleInputForChooseBoard(String input) {
        try {
            //if chose to quit
            if(commandParser.getCommandList().isQuitCommand(input)) {
                setStillInGame(false);
                ConnectionManager.instance().sendMessage(new QuitMessage());
                ConnectionManager.instance().disconnect();
                setEndGame(true);
                //if has chosen a valid board
            } else if ((Integer.parseInt(input) >= 1 && Integer.parseInt(input) <= 4)) {
                ConnectionManager.instance().sendMessage(new ChooseBoardReplyMessage(Integer.parseInt(input)));
                //if the input is not valid
            } else {
                Console.println("Inserisci un valore valido: <1><2><3><4>");
            }

            //if the input is not a number and not a quit string, prompt error
        } catch (NumberFormatException nfe) {
            Console.println("Inserisci un valore valido: <1><2><3><4>");
        }
    }


    /**
     * handle the last part of the game, when the match is closed, eventually printing scores, if not a
     * forfeit win
     */
    public void handleEndGame() {
        //check if is a forfeit win or not
        if(isForfeitWin() || getPlayersAndScores() == null || getPlayersAndScores().isEmpty()) {
            if(isStillInGame()) {
                Console.println("Tutti gli altri giocatori si sono disconnessi, hai vinto a tavolino!");
            } else {
                if(isChooseBoardReady()) //only if has at least received the boards is considered out of match
                    Console.println("Hai abbandonato la partita.");
            }

        } else {
            //if is not, show scores
            List<Couple<String, Integer>> playersAndScores = getPlayersAndScores();
            Console.println("RISULTATI PARTITA:");
            for (int i = 0; i < playersAndScores.size(); i++) {
                Console.println(playersAndScores.get(i).getFirst()+" ha totalizzato " +
                        playersAndScores.get(i).getSecond() + " punti!");
            }
            //calculate the top player(s) and show the winner
            Console.println(buildWinnerString(getPlayersAndScores()));
        }
    }


    /**
     * build the winner string based on a list of players and scores
     * @param playersAndScores the list of players-scores
     */
    private String buildWinnerString(List<Couple<String, Integer>> playersAndScores) {

        if(playersAndScores == null || playersAndScores.isEmpty())
            return "Nessuno ha vinto!";
        else {

            int maxScore = -100;
            for (Couple<String, Integer> c : playersAndScores) {
                if(c.getSecond() > maxScore)
                    maxScore = c.getSecond();
            }
            //in case more than one player has scored the max, behave differently
            List<String> winners = new ArrayList<>(getNumOfPlayers());
            for (Couple<String, Integer> c : playersAndScores) {
                if(c.getSecond() == maxScore)
                    winners.add(c.getFirst());
            }

            return buildWinMessage(winners);

        }
    }

    /**
     * build the win message based on number of winning players
     * @param winners list of winners. Must be at least 1
     * @return the string to print with the winners
     */
    private String buildWinMessage(List<String> winners) {
        //if there's only one winner
        if(winners.size() == 1) {
            if(winners.get(0).equals(getUsername())) {
                return winners.get(0) + ", hai vinto!";
            } else {
                return winners.get(0) + " ha vinto la partita!";
            }
        } else { // if there are multiple winners
            StringBuilder result = new StringBuilder();
            //append every winner followed by a ',' except the last
            for (int i = 0; i < winners.size(); i++) {

                result.append(winners.get(i));

                if(i != winners.size()-1) {//if is not the last

                    if(i == winners.size()-2) {//if is second last
                        result.append(" e ");
                    } else {
                        result.append(", ");
                    }
                }
            }

            result.append(" hanno vinto la partita!");
            return result.toString();
        }
    }


    /**
     * Notify this CLIGame that the game is terminated unexpectedly (e.g. server closed)
     */
    @Override
    public void notifyGameTerminated() {
        super.notifyGameTerminated();
        if(!isEndgame())
            Console.print("Il gioco e' terminato in modo inaspettato! Premi invio per proseguire...");
    }


    /**
     * notify this CLIGame that the model logically changed
     */
    @Override
    public void notifyChanged() {
        super.notifyChanged();
        gamePrinter.printCLIGame();
    }

    /**
     * notify this CLIGame that the game has ended
     * @param playersAndScores the results for the game's end
     * @param isForfeitWin true if is a forfeit win
     */
    @Override
    public void notifyEndGame(List<Couple<String, Integer>> playersAndScores, boolean isForfeitWin){
        super.notifyEndGame(playersAndScores, isForfeitWin);
        Console.println("Gioco terminato! premi invio per proseguire...");
    }


    /**
     * notify this CLIGame that has started the phase of board choice
     */
    @Override
    public void notifyChooseBoard() {
        super.notifyChooseBoard();
        gamePrinter.printChooseBoards();
        Console.println("Scegli una tra le board soprastanti: <1><2><3><4>");
    }


    /**
     * Make this CLIGame print a message
     * @param message
     */
    @Override
    public void printMessage(String message) {
        Console.println('\n'+message);
    }


    /**
     * notify this CLIGame that the model logically changed
     */
    @Override
    public void gameClosed() {
        notifyGameTerminated();
    }


}