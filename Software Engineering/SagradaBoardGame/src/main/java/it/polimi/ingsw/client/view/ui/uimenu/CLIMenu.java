package it.polimi.ingsw.client.view.ui.uimenu;

import it.polimi.ingsw.client.view.ui.UIManager;
import it.polimi.ingsw.client.view.ui.uigame.CLIGame;
import it.polimi.ingsw.connection.client.ConnectionManager;
import it.polimi.ingsw.connection.messages.client.LoginMessage;
import it.polimi.ingsw.exceptions.connection.UnavailableConnectionException;
import it.polimi.ingsw.globals.ViewGlobals;
import it.polimi.ingsw.utils.Console;
import org.fusesource.jansi.AnsiConsole;

/**
 * CLI version of the menu
 */
public class CLIMenu extends AbstractUIMenu {

    private boolean quitGame;


    public CLIMenu(){
        quitGame = false;
    }


    /**
     * Start the menu
     */
    @Override
    public void start() {
        if (ViewGlobals.passThroughProperty())
            System.setProperty("jansi.passthrough", "true");
        AnsiConsole.systemInstall();
        while(!quitGame && !isGameClosed()) {

            UIManager.instance().setUIGame(new CLIGame());
            manageConnection();
            manageLogin();

            //here game is ready to start. Set the focus UI to the UIManager, then start the game
            UIManager.instance().setFocusUI(UIManager.instance().getUIGame());
            if(!isGameClosed()) {
                UIManager.instance().getUIGame().setUsername(getUsername());
                UIManager.instance().getUIGame().start();

                if(ConnectionManager.instance().isConnected()) {
                    //when game ends in any way, disconnect
                    ConnectionManager.instance().disconnect();
                }


                //handle the menu, once the user returned from a match, either for disconnection or match finished
                handleExit();
            }

        }
        Console.println("Alla prossima partita!");
        AnsiConsole.systemUninstall();

    }


    /**
     * Handle the choice of close game or reconnect.
     */
    private void handleExit() {
        boolean exit = false;
        String input = Console.askInput("Sei tornato al menu! Vuoi riconnetterti ad un gioco <1> o uscire dal gioco? <2>");
        while (!exit) {
            if(input.equals("1")) { //with 1 exit from this loop
                exit = true;
            } else if(input.equals("2")) { //with 2 also set quitGame true
                exit = true;
                quitGame = true;
            } else { //else re-ask input
                input = Console.askInput("Input non valido: <1> per riconnettersi, <2> per uscire dal gioco");
            }
        }

    }


    /**
     * Manage the login phase
     */
    private void manageLogin() {
        boolean logged = false;
        //as long as is not logged
        while (!logged && !isGameClosed()) {
            //ask for username and send a login message, only if not already chose by command line arg
            if(getNickname().isPresent())
                username = getNickname().orElse("User1");
            else
                username = Console.askInput("Inserisci il tuo username:");

            //then wait for reply
            ConnectionManager.instance().setWaitForAnswer(true);
            ConnectionManager.instance().sendMessage(new LoginMessage(username));
            //wait until the reply login message unlocks the ConnectionManager
            if(!isGameClosed()) {
                Console.print("Login in corso");
                Console.waitAndPrintUntil(".", 1000, 10, ConnectionManager.instance()::isNotWaitingForAnswer);
            }

            //the reply is arrived
            if(ConnectionManager.instance().isLogged()) {
                ConnectionManager.instance().setLoggedUsername(username);
                logged = true;
                Console.println("Ti sei loggato correttamente, "+username+"!");
            } else {
                if(!isGameClosed())
                    Console.println("Login fallito!");
            }

            //print the messages stored in the meanwhile by the server
            Console.printlnMulti(ConnectionManager.instance().retrieveMessages());
        }
    }


    /**
     * Manage the connection phase
     */
    private void manageConnection() {
        boolean connected = false;
        String connectionString;
        String ip;
        //while the user is not effectively connected...
        while (!connected) {
            //ask for type of connection if not already set with args
            if(!getConnectionType().isPresent())
                connectionString = askConnectionType();
            else
                connectionString = getConnectionType().orElse(RMI);
            //same with ip
            if(!getIpAddress().isPresent()) {
                ip = askIP();
            } else {
                ip = getIpAddress().orElse("localhost");
            }


            connected = tryToConnectWith(connectionString, ip);

            if(!connected && getConnectionType().isPresent() && getIpAddress().isPresent()) {
                Console.print("Nuovo tentativo...\n");
                Console.waitAndPrintUntil("", 1000, 5, () -> false);
            }
        }
    }

    /**
     * ask from input the connection type
     * @return the connection type
     */
    private String askConnectionType() {
        String connectionString;
        Console.println("Vuoi connetterti con socket o rmi? <"+SOCKET+"><"+RMI+">");
        connectionString = Console.nextLine();
        //choose a valid type of connection
        while (!connectionString.equalsIgnoreCase(SOCKET) && !connectionString.equals(RMI)) {
            connectionString = Console.askInput("Tipo non valido. Inserisci un tipo valido ('"+SOCKET+"' o '"+RMI+"')");
        }
        return connectionString;
    }


    /**
     * ask the ip from input
     * @return the ip
     */
    private String askIP() {
        //ask the ip ("l" is accepted for localhost)
        String ip = Console.askInput("Inserisci l'indirizzo ip del server ('l' per localhost):");
        if(ip.equals("l"))
            ip = "localhost";
        return ip;
    }


    /**
     * try to connect with the specified connection
     * @param connectionString the specified connection
     * @param ip the ip to connect with
     * @return true if connected successfully
     */
    private boolean tryToConnectWith(String connectionString, String ip) {
        //if socket, choose an IP and check if valid
        if(connectionString.equalsIgnoreCase(SOCKET)) {

            //try to connect with the ip passed
            try {
                ConnectionManager.instance().connectWithSocket(ip);
                //here connection was correctly established
                Console.println("Connessione stabilita!");
                return true;
            } catch (UnavailableConnectionException e) {
                Console.println("Connessione con il server fallita");
            }

        } else if(connectionString.equalsIgnoreCase(RMI)) {
            try {
                ConnectionManager.instance().connectWithRMI(ip);
                Console.println("Connessione stabilita!");
                return true;

            } catch (UnavailableConnectionException e) {
                Console.println("Connessione con il server fallita");
            }
        } else
            Console.println("Connessione di tipo non valido!");

        return false;
    }


    /**
     * make this CLIMenu print a message
     * @param message
     */
    @Override
    public void printMessage(String message) {
        Console.println(message);
    }


    /**
     * notify this CLIMenu that the game closed, before its start
     */
    @Override
    public void gameClosed() {
        if(!isGameClosed()) {
            super.gameClosed();
            Console.println("Connessione con il server terminata. Premi invio per continuare...");
        }

    }

}