package it.polimi.ingsw.client;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.utils.Console;

import java.util.Optional;

/**
 * The Client's launcher. Also manages command line arguments
 */
public class ClientLauncher {
    private static final String PARAM_UI_SELECTOR = "-u";
    private static final String PARAM_UI_CLI = "cli";
    private static final String PARAM_UI_GUI = "gui";
    private static final String PARAM_INFO = "-i";
    private static final String PARAM_CONNECTION_SELECTOR = "-c";
    private static final String PARAM_CONNECTION_SOCKET = "socket";
    private static final String PARAM_CONNECTION_RMI = "rmi";
    private static final String PARAM_IP_SELECTOR = "-a";
    private static final String PARAM_NICKNAME_SELECTOR = "-n";

    private static Optional<String> uiType;
    private static Optional<String> connectionType;
    private static Optional<String> ip;
    private static Optional<String> nickname;


    public static void main(String[] args) {

        uiType = Optional.empty();
        connectionType = Optional.empty();
        ip = Optional.empty();
        nickname = Optional.empty();


        if(args.length == 0) {

            uiType = Optional.ofNullable(askTypeOfUI());

            UIManager.instance().launch(uiType.orElse(UIManager.UI_TYPE_CLI));

        } else {
            handleArgs(args);

        }

    }


    /**
     * ask the type of ui to the user
     * @return UI_TYPE_CLI or UI_TYPE_GUI based on what the user chose
     */
    private static String askTypeOfUI() {

        String uiMenuString;
        uiMenuString = Console.askInput("Vuoi usare CLI o GUI? <"+UIManager.UI_TYPE_CLI+"><"+UIManager.UI_TYPE_GUI+">");

        //choose a valid type
        while (!uiMenuString.equalsIgnoreCase(UIManager.UI_TYPE_CLI) &&
                !uiMenuString.equalsIgnoreCase(UIManager.UI_TYPE_GUI)) {
            uiMenuString = Console.askInput("Inserisci una stringa valida ("+UIManager.UI_TYPE_CLI+" o " +
                    UIManager.UI_TYPE_GUI+")");
        }
        uiMenuString = uiMenuString.equalsIgnoreCase(UIManager.UI_TYPE_CLI) ? UIManager.UI_TYPE_CLI : UIManager.UI_TYPE_GUI;

        return uiMenuString;
    }


    /**
     * Handle what to do in case of args. Requires args not null.
     * Structure of args is (info) alone for info, or (ui) or (ui + socket/rmi) or (ui + socket/rmi + ipAddress).
     * No other combinations allowed
     * @param args must be not null
     */
    private static void handleArgs(String[] args) {

        //if length is 1 can be param info only, if not is error
        if(args.length == 1) {
            if(args[0].equals(PARAM_INFO)) {
                printInfo();
                return;
            } else
                printParameterError();
            return;


            //accept only 2 or multiple of 2 args
        } else if(args.length >= 2 && args.length % 2 == 0) {

            for (int i = 0; i < args.length; i+=2) {
                if(!handleArgCouple(args[i], args[i+1])) {
                    printParameterError();
                    return;
                }
            }

            if(uiType.isPresent()) {
                UIManager.instance().launch(uiType.get(), connectionType, ip, nickname);
            } else {
                uiType = Optional.of(askTypeOfUI());

                UIManager.instance().launch(uiType.get(), connectionType, ip, nickname);
            }

            //else num of param is wrong, print error
        } else {
            printParameterError();
            return;
        }
    }


    /**
     * handle a couple of input, intended as (selector, argument), for instance (-u, cli)
     * @param selector -u, -a, -c
     * @param argument the argument based on the selector
     * @return
     */
    private static boolean handleArgCouple(String selector, String argument) {

        switch (selector) {
            case PARAM_UI_SELECTOR:
                if(argument.equals(PARAM_UI_CLI)) {
                    uiType = Optional.of(UIManager.UI_TYPE_CLI);
                    return true;
                } else if (argument.equals(PARAM_UI_GUI)) {
                    uiType = Optional.of(UIManager.UI_TYPE_GUI);
                    return true;
                } else {
                    return false;
                }

            case PARAM_CONNECTION_SELECTOR:
                if(argument.equals(PARAM_CONNECTION_SOCKET)) {
                    connectionType = Optional.of(UIManager.CONNECTION_TYPE_SOCKET);
                    return true;
                } else if(argument.equals(PARAM_CONNECTION_RMI)) {
                    connectionType = Optional.of(UIManager.CONNECTION_TYPE_RMI);
                    return true;
                } else
                    return false;

            case PARAM_IP_SELECTOR:
                ip = Optional.ofNullable(argument);
                return true;

            case PARAM_NICKNAME_SELECTOR:
                nickname = Optional.ofNullable(argument);
                return true;
                default:
                    return false;
        }
    }




    private static void printInfo() {
        Console.println(PARAM_INFO +" per avere info sui comandi.\n"+ PARAM_UI_SELECTOR + " <"+ PARAM_UI_CLI +"/"
                + PARAM_UI_GUI +"> per scegliere che tipo di UI utilizzare.\n" +
                PARAM_CONNECTION_SELECTOR + " <" + PARAM_CONNECTION_SOCKET+"/"+PARAM_CONNECTION_RMI+"> per scegliere" +
                " il tipo di connessione.\n" +
                PARAM_IP_SELECTOR + " <indirizzo ip> per scegliere l'indirizzo ip del server.\n" +
                PARAM_NICKNAME_SELECTOR+ " <nickname> per scegliere prima il nickname");
    }

    private static void printParameterError() {
        Console.println("Parametri non validi. usa '" + PARAM_INFO + "' per info sui parametri");
    }
}




