package it.polimi.ingsw.client.view.ui.uigame.uiutils;

import it.polimi.ingsw.client.view.ui.uigame.AbstractUIGame;
import it.polimi.ingsw.connection.client.ConnectionManager;
import it.polimi.ingsw.connection.messages.client.QuitMessage;
import it.polimi.ingsw.connection.messages.client.SelectedMessage;
import it.polimi.ingsw.globals.FilepathGlobals;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.utils.Console;

import java.util.StringTokenizer;

/**
 * Command parser used in-game by CLIGame. Parse and decides what to do with the input
 * Supports only the game-specific commands, namely the use of a game's component
 * (not info/special messages or quit management)
 */
public class UICommandParser {

    private UICommandList commandList;
    private AbstractUIGame uiGame;

    private static final String EGG = "egg";

    public UICommandParser(AbstractUIGame uiGame) {
        commandList = new UICommandList(FilepathGlobals.CLI_COMMAND_LIST_PATH);
        this.uiGame = uiGame;
    }

    /**
     * parse an input, or multiple, and decides what to do, based on the input and the game state.
     * An input is divided from another logically by a ',' or a space, and will be treated independently.
     * @param input the string passed.
     */
    public void parseAndOperate(String input) {
        //first cut the input in more strings if any. Divide by ',' and spaces
        StringTokenizer st = new StringTokenizer(input, " ,");
        //now for any distinct input, operate
        while(st.hasMoreTokens()) {
            //divide by '.'
            StringTokenizer inputDivider = new StringTokenizer(st.nextToken(), ".");
            String type;
            String parameter;


            //if has only one parameter, is a special input or a possible choice input
            if(inputDivider.countTokens() == 1) {
                //manage the single String input, if is not a correct command print an error
                if(!manageSingleStringInput(inputDivider.nextToken()))
                    printInvalidInput();

                //standard format for a game command: first part is the component, then the number for idView
            } else if(inputDivider.countTokens() == 2) {
                type = inputDivider.nextToken();
                parameter = inputDivider.nextToken();
                //manage command, if false the command was not correct
                if(!manageGameCommand(type, parameter)) {
                    printInvalidInput();
                }
            } else {//if more or less than 2 parameters, is not valid, communicate failure and the info command
                printInvalidInput();
            }
        }


    }

    /**
     * manage input in case of a string without arguments
     * @param input the input given
     * @return false if is not a valid input, true otherwise
     */
    private boolean manageSingleStringInput(String input) {
        if (EGG.equals(input)) {
            egg();
        } else if (commandList.isHelpCommand(input)) { //info, print the info
            printInfo();
        } else if (commandList.isQuitCommand(input)) { //quit, make the game quit and the user no more in game
            ConnectionManager.instance().sendMessage(new QuitMessage());
            uiGame.setStillInGame(false);
            uiGame.setEndGame(true);
        } else if (commandList.isSwitchConnectionCommand(input)) {
            if(uiGame.getNumOfPlayers() > 2)
                ConnectionManager.instance().switchConnection();
            else {
                ConnectionManager.instance().sendMessage(new QuitMessage());
            }
        } else if(!uiGame.isMyTurn()) { //if is not its turn, and is not a "personal" command as info or quit, return false
            Console.println("Non e' il tuo turno!");
            return false;
        } else if(commandList.isPassCommand(input)) {
            managePass();
        } else if(uiGame.isActiveChoose()) { //if the choice is active, parse the single input as a choice
            // id. if it fails, print that is an invalid input
            if(!manageChooseCommand(input))
                return false;
        } else {//not a valid command, return false
            return false;
        }
        return true;

    }


    /**
     * manage the pass of a turn
     */
    private void managePass() {

        ConnectionManager.instance().sendMessage(new SelectedMessage(ModelGlobals.componentPass(), 0));
    }


    /**
     * Manage a command made in game phase
     * @param component the component selected
     * @param parameter the parameter associated to the component
     * @return
     */
    private boolean manageGameCommand(String component, String parameter) {
        //get the id, if invalid return false
        int id;
        try {
            id = Integer.parseInt(parameter);
        } catch (NumberFormatException nfe) {
            return false;
        }

        if(id <= 0 && !commandList.isToolCommand(component))
            return false;

        //switch and find the right component, and pass a message with that id and component selected
        //for a pool command, send before always t.0
        if(commandList.isPoolCommand(component)) {
            ConnectionManager.instance()
                    .sendMessage(new SelectedMessage(ModelGlobals.componentTool(), 0));
            ConnectionManager.instance()
                    .sendMessage(new SelectedMessage(ModelGlobals.componentTool(), 0));
            ConnectionManager.instance()
                    .sendMessage(new SelectedMessage(ModelGlobals.componentPool(), id));
            return true;

        } else if(commandList.isBoardCommand(component)) {
            ConnectionManager.instance()
                    .sendMessage(new SelectedMessage(ModelGlobals.componentBoard(), id));
            return true;

        } else if(commandList.isRoundTrackCommand(component)) {
            ConnectionManager.instance()
                    .sendMessage(new SelectedMessage(ModelGlobals.componentRoundTrack(), id));
            return true;

        } else if(commandList.isToolCommand(component)) {
            ConnectionManager.instance()
                    .sendMessage(new SelectedMessage(ModelGlobals.componentTool(), id));
            return true;
        }

        return false;
    }

    private void printInvalidInput() {
        uiGame.printMessage("Comando non valido (digita '" + commandList.getHelpCommands().get(0) + "'  per " +
                "avere info)");
    }

    /**
     * print info on game and commands
     */
    public void printInfo() {
        StringBuilder infoString = new StringBuilder();

        infoString.append("INFO DI GIOCO:\n\n" +
                "(Nota): Per usare i tool che richiedono il pescaggio di un dado dalla riserva, utilizzare prima " +
                "il tool e poi scegliere il dado dalla riserva\n");
        //tools info
        for (int i = 1; i <= uiGame.numOfToolCards(); i++) {
            infoString.append("Tool "+i+": [" + uiGame.getToolCard(i).getName()+"] "+ uiGame.getToolCard(i).getDescription() + "\n");
        }
        infoString.append("\n");
        //objectives info
        for (int i = 1; i <= uiGame.numOfPublicObjectives(); i++) {
            infoString.append("Obiettivo Pubblico "+i+": [" + uiGame.getPublicObjective(i).getName()+ "] "+ uiGame.getPublicObjective(i)
                    .getDescription() + "\n");
        }
        infoString.append("Obiettivo Privato: [" + uiGame.getPrivateObjective().getName()+"] "+ uiGame.getPrivateObjective().getDescription()+ "\n");

        infoString.append("\n");
        //info on commands
        infoString.append("COMANDI DI GIOCO: \n");
        infoString.append("Formato: <componente><.><id>. id va da 1 al numero di celle che il componente contiene. Se si inserisce 0 " +
                "come id è considerato uno skip della mossa. Sono ammesse parole speciali da usare senza id.\n" +
                "(Nota: i caratteri '<' e '>' non devono essere inseriti nell'input)\n" +
                "Parole chiave per  i componenti:\n");
        infoString.append("Info: <"+commandList.getHelpCommands().toString()+ ">\n" +
                "Esci dal gioco: <"+commandList.getQuitCommands().toString()+ ">\n" +
                "Passa il turno: <"+commandList.getPassCommands().toString()+ ">\n" +
                "Selezione da Riserva: <"+commandList.getPoolCommands().toString() + "><.><[1,"+ uiGame.poolSize()+"]>\n" +
                "Selezione da Vetrata: <"+commandList.getBoardCommands().toString()+ "><.><[1,"+ uiGame.boardSize()+"]>\n" +
                "Selezione da Tracciato dei Round: <"+commandList.getRoundTrackCommands()+"><.><[1,"+ uiGame.getRoundtrack().getMaxId()+"]>\n" +
                "Selezione di un Attrezzo: <"+commandList.getToolCommands()+"><.><[1,"+ uiGame.numOfToolCards()+"]>\n" +
                "Cambio di connessione: <"+commandList.getSwitchConnectionCommands().toString()+">\n" +
                "<egg> ?");

        uiGame.printMessage(infoString.toString());
    }

    /**
     * try to send the input as a choice. If fails because is not a valid choice, return false, otherwise true
     * @param choice
     * @return
     */
    private boolean manageChooseCommand(String choice) {
        try {
            int intChoice = Integer.parseInt(choice);
            ConnectionManager.instance()
                    .sendMessage(new SelectedMessage(ModelGlobals.componentChoose(), intChoice));
            uiGame.printMessage("Hai scelto l'opzione " + intChoice);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }

    /**
     *
     * @return the command list of this UICommandParser
     */
    public UICommandList getCommandList() {
        return commandList;
    }

    private void egg() {
        uiGame.printMessage("        ####\n      ##    ##\n     #        #\n    #/\\/\\/\\/\\/\\#\n    #          #\n    #/\\/\\/\\/\\/\\#\n    #          #\n     ##      ##\n.\\\\./..######.../../.");
    }
}
