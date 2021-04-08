package it.polimi.ingsw.connection.client;

import it.polimi.ingsw.connection.messages.client.AbstractClientMessage;
import it.polimi.ingsw.connection.messages.client.ClientHeartBeatMessage;
import it.polimi.ingsw.connection.messages.server.AbstractServerMessage;
import it.polimi.ingsw.connection.server.IRMIListener;
import it.polimi.ingsw.connection.server.clienthandlers.IRMIClientHandler;
import it.polimi.ingsw.exceptions.connection.UnavailableConnectionException;
import it.polimi.ingsw.globals.ConnectionGlobals;
import it.polimi.ingsw.utils.Logger;

import java.io.Serializable;
import java.rmi.NoSuchObjectException;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.Timer;
import java.util.TimerTask;

/**
 * RMI version of Server Handler
 */
public class RMIServerHandler extends AbstractServerHandler implements IRMIServerHandler, Serializable {

    private IRMIClientHandler clientHandler;

    private Timer heartBeatTimer;

    public RMIServerHandler() throws UnavailableConnectionException, RemoteException {
        try {

            IRMIListener rmiListener = ConnectionManager.instance().getIrmiListener();

            clientHandler = rmiListener.register(this);

            setUpHeartBeatTimer();

        } catch (RemoteException e) {
            throw new UnavailableConnectionException();
        }
    }

    private void setUpHeartBeatTimer() {
        heartBeatTimer = new Timer();

        heartBeatTimer.schedule(new TimerTask() {
            @Override
            public void run() {
                sendMessage(new ClientHeartBeatMessage());
            }
        }, ConnectionGlobals.getRMIHeartBeatMillis(), ConnectionGlobals.getRMIHeartBeatMillis());
    }



    @Override
    public void sendMessage(AbstractClientMessage message) {
        try {
            if(isConnected())
                clientHandler.receiveMessage(message);
        } catch (RemoteException e) {
            serverClosed();
            disconnect();
        }

    }

    @Override
    public void receiveMessage(AbstractServerMessage message) throws RemoteException  {
        if(isConnected())
            message.doOperation(this);
    }


    @Override
    public void disconnect() {
        try {
            if(isConnected()) {
                setDisconnected();
                heartBeatTimer.cancel();
                heartBeatTimer.purge();
                UnicastRemoteObject.unexportObject(this, true);
            }
        } catch (NoSuchObjectException e) {
            Logger.std().warning("unexported failed!");
        }
    }
}
