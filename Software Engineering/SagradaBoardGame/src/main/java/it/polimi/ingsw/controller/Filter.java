package it.polimi.ingsw.controller;

public abstract class Filter {

    private boolean active;

    public Filter () {
        this.active = false;
    }

    abstract boolean execute (IDView id);

    void use(boolean use) {
        this.active = use;
    }

    boolean isActive () {
        return this.active;
    }

    abstract String getName () ;
}
