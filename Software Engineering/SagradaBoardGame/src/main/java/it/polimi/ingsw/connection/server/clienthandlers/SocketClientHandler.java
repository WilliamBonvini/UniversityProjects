package it.polimi.ingsw.connection.server.clienthandlers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import it.polimi.ingsw.connection.messages.server.AbstractServerMessage;
import it.polimi.ingsw.connection.messages.server.ServerSocketMessageDispatcher;
import it.polimi.ingsw.utils.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.rmi.RemoteException;
import java.util.NoSuchElementException;
import java.util.Scanner;

/**
 * The concrete client handler which handles a single user connected with Socket
 */
public class SocketClientHandler extends AbstractClientHandler implements Runnable {

    private Socket socket;
    Scanner socketIn;
    PrintWriter socketOut;


    private ServerSocketMessageDispatcher messageDispatcher;


    public SocketClientHandler(Socket socket) throws RemoteException {
        super();
        this.socket = socket;
        messageDispatcher = new ServerSocketMessageDispatcher(this);
        Logger.std().info("User connected with Socket ("+socket.getInetAddress().toString()+")");
    }

    @Override
    public void run() {

        try {
            //set the scanner and printer for message exchange
            socketIn = new Scanner(socket.getInputStream());
            socketOut = new PrintWriter(socket.getOutputStream());
            String inMessage;

            //while is connected, read the incoming string and decide what to do with that
            while (isOnline) {
                //read the input from socket
                inMessage = socketIn.nextLine();
                //then act based on what has been passed
                messageDispatcher.parseAndOperate(inMessage);
            }

        } catch (IOException | NoSuchElementException e) {
            //log in the finally
        } finally {
            Logger.std().info("Client Socket of user '"+getUsername()+"' disconnected");
            socketIn.close();
            socketOut.close();
            try {
                socket.close();
            } catch (IOException e) {
                Logger.std().warning("Socket already closed");
            }
            if(isOnline) {
                goOffline();
            }
        }

        //if out of while loop the player is disconnected, either by his choice or a socket exception.
        //now the SocketClientHandler will respond passively as if the player respond to input by passing his turn
    }

    @Override
    public void goOffline() {
        super.goOffline();
        try {
            if(socket.isClosed())
                socket.close();
        } catch (IOException e) {
            Logger.std().warning("error while closing socket, already closed");
        }
    }




    /**
     * Send a message. For SocketClientHandler will be already parsed inside a GeneralMessage
     * @param message
     */
    @Override
    public void sendMessage(AbstractServerMessage message) {
        if(!isOnline)
            return;
        Gson gson = new GsonBuilder().create();
        socketOut.println(gson.toJson(message));
        socketOut.flush();
    }


}
