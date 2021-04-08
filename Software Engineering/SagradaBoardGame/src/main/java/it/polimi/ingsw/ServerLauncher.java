package it.polimi.ingsw;

import it.polimi.ingsw.connection.server.ClientDispatcher;

/**
 * Entry point of the Server
 */
public class ServerLauncher
{
    public static void main( String[] args )
    {
        ClientDispatcher.instance().start();
    }
}
