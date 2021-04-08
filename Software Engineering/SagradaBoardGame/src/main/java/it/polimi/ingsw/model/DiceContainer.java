package it.polimi.ingsw.model;

import it.polimi.ingsw.model.Die;

import java.util.List;

public interface DiceContainer {

    Die getDie(int idview);
    void setDie(int idview, Die die);
    void removeDie(int idview);

    List<Die> getAll();
    void addDie(Die die);
    void removeDie(Die die);

    int size();
}
