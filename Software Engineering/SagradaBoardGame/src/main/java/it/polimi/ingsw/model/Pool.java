package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.NotInPoolException;

import java.util.ArrayList;
import java.util.List;

public class Pool implements DiceContainer {
    private List<Die> dice;


    /**
     * The Pool is initialised as an empty ArrayList of Die. The controller will insert the right number of dice
     * depending on the number of players
     */
    Pool(){
        dice   =   new ArrayList<>();
    }

    Pool(Pool otherPool) {
        dice = new ArrayList<>();
        for (int i = 0; i < otherPool.dice.size(); i++) {
            dice.add(new Die(otherPool.dice.get(i)));
        }
    }

    @Override
    public Die getDie(int idview) {
        idview -= 1;
        return dice.get(idview);
    }

    @Override
    public void setDie(int idview, Die die) {
        idview -= 1;
        dice.set(idview, die);
    }

    @Override
    public void removeDie(int idview) {
        idview -= 1;
        dice.remove(idview);
    }

    @Override
    public List<Die> getAll() {
        return dice;
    }

    @Override
    public void addDie(Die die) {
        dice.add(die);
    }

    /**
     * removes a die from the pool if the pool actually contains it
     * @param die : the die we want to remove from the pool
     * @throws NotInPoolException when the die that we want to remove from the pool is not in it
     */
    @Override
    public void removeDie(Die die) {
        if(dice.contains(die)){
            dice.remove(die);
            return;
        }
        throw new NotInPoolException();
    }

    /**
     * @return the number of dice in the pool
     */
    @Override
    public int size(){
        return dice.size();
    }
}
