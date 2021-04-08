package it.polimi.ingsw.connection.client;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import it.polimi.ingsw.globals.ConnectionGlobals;

import it.polimi.ingsw.connection.messages.client.AbstractClientMessage;
import it.polimi.ingsw.connection.messages.client.ClientSocketMessageDispatcher;

import it.polimi.ingsw.exceptions.connection.UnavailableConnectionException;
import it.polimi.ingsw.utils.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.rmi.RemoteException;
import java.util.NoSuchElementException;
import java.util.Scanner;

/**
 * Socket Version of Server Handler
 */
public class SocketServerHandler extends AbstractServerHandler {

    private Socket socket;
    private PrintWriter socketOut;
    private Scanner socketIn;
    private ClientSocketMessageDispatcher messageDispatcher;
    private Thread serviceThread;

    /**
     * Create the socket handler. An attempt to connect will be made
     * @throws UnavailableConnectionException if the connection fails for some reason
     */
    public SocketServerHandler(String ip) throws UnavailableConnectionException, RemoteException {

        //setup the message dispatcher
        messageDispatcher = new ClientSocketMessageDispatcher(this);


        //start socket and streams. If not available, throw exception
        try {
            socket = new Socket(ip, ConnectionGlobals.getSocketPort());
            socketIn = new Scanner(socket.getInputStream());
            socketOut = new PrintWriter(socket.getOutputStream());

            //start the service thread
            serviceThread = new Thread(() -> {
                String message;
                boolean connected = true;

                try {
                    //stay on listening
                    while(connected) {
                        //read the next line
                        message = socketIn.nextLine();
                        //pass it to the dispatcher, which will operate
                        messageDispatcher.parseAndOperate(message);
                    }

                } catch (NoSuchElementException nsee) {
                    Logger.std().info("SocketService closed");
                } finally { //if the thread stops close everything and communicate that the thread is not more alive to the SocketServerHandler


                    socketIn.close();
                    socketOut.close();
                    try {
                        if(!socket.isClosed())
                            socket.close();
                    } catch (IOException e) {
                        Logger.std().warning("Error while closing socket, already closed.");
                    }

                    serverClosed();
                    disconnect();
                }
            });

            serviceThread.start();

        } catch (IOException e) {
            throw new UnavailableConnectionException();
        }
    }

    @Override
    public void sendMessage(AbstractClientMessage message) {
        Gson gson = new GsonBuilder().create();
        socketOut.println(gson.toJson(message));
        socketOut.flush();
    }


    @Override
    public void disconnect() {
        try {
            if(isConnected())
                setDisconnected();

            if(!socket.isClosed())
                socket.close();
        } catch (IOException e) {
            Logger.std().warning("error while closing socket");
        }
    }
}
