package it.polimi.ingsw.connection.server;

import it.polimi.ingsw.connection.server.clienthandlers.SocketClientHandler;
import it.polimi.ingsw.utils.Logger;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * The thread which will listen for socket connections, and create a new SocketClientHandler if a connection arrive
 */
public class SocketListener extends Thread {
    private ServerSocket serverSocket;
    private boolean closed = false;
    private int port;


    public SocketListener(int port) throws IOException {
        this.port = port;
    }

    @Override
    public void run() {

        try  {
            serverSocket = new ServerSocket(port);
            Logger.std().info("SocketListener started ["+serverSocket.getInetAddress().toString()+"]"+ "["+serverSocket.getLocalSocketAddress()+"]");

            while (!closed) {
                try {
                    //if someone try to connect to this server socket, accept and generate a new SocketClientHandler to handle him
                    Socket socket = serverSocket.accept();
                    Logger.std().info("Client connected with socket");
                    new Thread(new SocketClientHandler(socket)).start();
                } catch (IOException ioe) {
                    //here serverSocket is closed
                    break;
                }
            }
        } catch (IOException ioe) {
            Logger.std().error("Port not available for Socket Listener! Socket Listener won't run");
        }
    }

    public void close() {
        try {
            closed = true;
            serverSocket.close();
            Logger.std().info("ServerSocket of SocketListener closed");
        } catch (IOException e) {
            Logger.std().warning("ServerSocket of Socket Listener unclosable or already closed!");
        }
    }


}
