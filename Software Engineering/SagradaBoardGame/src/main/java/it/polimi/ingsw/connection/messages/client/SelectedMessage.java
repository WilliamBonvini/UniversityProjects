package it.polimi.ingsw.connection.messages.client;

import it.polimi.ingsw.connection.server.ClientDispatcher;
import it.polimi.ingsw.connection.server.clienthandlers.AbstractClientHandler;
import it.polimi.ingsw.controller.IDView;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Logger;

/**
 * Message which tells the server this user selected a precise component in game
 */
public class SelectedMessage extends AbstractClientMessage {
    private static final String MESSAGETYPE = "selected";
    private String component;
    private int id;


    public SelectedMessage() {
        super(MESSAGETYPE);
    }

    public SelectedMessage(String component, int id) {
        super(MESSAGETYPE);
        this.component = component;
        this.id = id;
    }

    /**
     * pass to the controller the user's input
     * @param ach the Client Handler used to do the operation
     */
    @Override
    public void doOperation(AbstractClientHandler ach) {
        GameManager gm = ClientDispatcher.instance().getGameOf(ach.getUsername());
        Logger.std().error("SelectedMessagge.doOperation(): 0/0 - " + ach.getUsername() + ", " + component + ", " + id + "");
        gm.getFilter().addTarget(new IDView(gm, ach.getUsername(), component, id));
    }

}
