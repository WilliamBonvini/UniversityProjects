package it.polimi.ingsw.connection.server.clienthandlers;

import it.polimi.ingsw.globals.ConnectionGlobals;
import it.polimi.ingsw.connection.client.IRMIServerHandler;
import it.polimi.ingsw.connection.messages.client.AbstractClientMessage;
import it.polimi.ingsw.connection.messages.server.ServerHeartBeatMessage;
import it.polimi.ingsw.connection.messages.server.AbstractServerMessage;
import it.polimi.ingsw.utils.Logger;

import java.io.Serializable;
import java.rmi.NoSuchObjectException;
import java.rmi.RemoteException;
import java.util.Timer;
import java.util.TimerTask;

/**
 * the concrete client handler which handles a single user connected with RMI
 */
public class RMIClientHandler extends AbstractClientHandler implements IRMIClientHandler, Serializable {
    //its speaker on the other side
    private IRMIServerHandler rmiServerHandler;
    private int id;
    private Timer heartBeatTimer;
    private boolean unexported;

    /**
     * Empty constructor, will set offline without connect
     */
    public RMIClientHandler() throws RemoteException {
        super();
        isOnline = false;
    }

    public RMIClientHandler(IRMIServerHandler rmiServerHandler) throws RemoteException {
        super();
        unexported = false;
        this.rmiServerHandler = rmiServerHandler;
        //set up heartBeat thread, schedule to send a message every tot seconds specified in globals
        heartBeatTimer = new Timer();

        heartBeatTimer.schedule(new TimerTask() {
            @Override
            public void run() {
                try {
                    rmiServerHandler.receiveMessage(new ServerHeartBeatMessage());
                } catch (RemoteException re) {
                    //if remote exception, cut connection, stop timer and go offline
                    heartBeatTimer.cancel();
                    heartBeatTimer.purge();
                    goOffline();
                }
            }
        }, ConnectionGlobals.getRMIHeartBeatMillis(), ConnectionGlobals.getRMIHeartBeatMillis());
    }

    @Override
    public void sendMessage(AbstractServerMessage message) {
        if(isOnline) {
            try {
                rmiServerHandler.receiveMessage(message);
            } catch (RemoteException e) {
                goOffline();
            }
        }
    }

    @Override
    public void receiveMessage(AbstractClientMessage message) {
        message.doOperation(this);
    }

    public IRMIServerHandler getRmiServerHandler() {
        return rmiServerHandler;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public void goOffline() {
        if(isOnline)
        super.goOffline();

        try {
            heartBeatTimer.cancel();
            heartBeatTimer.purge();
            if(!unexported) {
                unexported = true;
                unexportObject(this, true);
            }

        } catch (NoSuchObjectException e) {
            Logger.std().warning("RMIClientHandler of '"+getUsername()+"' tried to unexport" +
                    "itself from registry unsuccessfully");
        }
        Logger.std().verbose("[RMIClientHandler] of " + getUsername() + "went offline.");
    }


}
