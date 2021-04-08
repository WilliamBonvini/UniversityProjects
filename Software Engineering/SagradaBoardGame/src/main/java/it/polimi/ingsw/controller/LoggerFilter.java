package it.polimi.ingsw.controller;

import it.polimi.ingsw.utils.Logger;

public class LoggerFilter extends Filter {
    @Override
    boolean execute(IDView id) {
        Logger.std().verbose("LoggerFilter: " + id.getPlayer() + ", " + id.getComponent() + ", " + id.getId());
        return true;
    }

    @Override
    String getName() {
        return "logger";
    }
}
