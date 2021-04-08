package it.polimi.ingsw.controller;

import it.polimi.ingsw.model.game.GameManager;

/**
 * Container of an IDView, server-side.
 * Created in the connection's classes, goes through the Filters
 * and then it can be extracted for the MicroOperations to be used
 */
public class IDView {

    private GameManager gm;

    private String player;
    private String component;
    private int id;

    public IDView (GameManager gm, String player, String component, int id) {
        this.gm = gm;

        this.player = player;
        this.component = component;
        this.id = id;
    }

    public GameManager getGameManager () {
        return gm;
    }
    public String getPlayer() {
        return player;
    }
    public String getComponent() {
        return component;
    }
    public int getId() {
        return id;
    }
    public String toString() {
        return player + " " + component + " " + id;
    }
}
