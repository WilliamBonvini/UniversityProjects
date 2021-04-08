package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.RoundIndexOutOfBoundException;

import java.util.ArrayList;
import java.util.List;
/**
 * Container that represent the RoundTrack
 */
public class RoundTrack implements DiceContainer {
    private List<List<Die>> dice;

    /**
     * Create the round track with 10 rounds
     */
    RoundTrack(){
        dice = new ArrayList<>();

        for(int i = 0; i < 10; i++)
            dice.add(new ArrayList<>());
    }

    /**
     * Create a RoundTrack based from
     * @param otherRoundTrack to be copied
     */
    RoundTrack(RoundTrack otherRoundTrack) {
        dice = new ArrayList<>(10);

        for (int i = 0; i < otherRoundTrack.dice.size(); i++) {
            dice.add(new ArrayList<>(9));
        }

        for (int i = 0; i < otherRoundTrack.dice.size(); i++) {
            for (int j = 0; j < otherRoundTrack.dice.get(i).size(); j++) {
                dice.get(i).add(new Die(otherRoundTrack.dice.get(i).get(j)));
            }
        }
    }

    /**
     * Add a Die to the specified round
     * @param die the Die to add
     * @param round the round where the Die is added. Must be [0, number of rounds)
     */
    public void addDie(Die die, int round) {
        if(round < 0 || round >= 10)
            throw new RoundIndexOutOfBoundException();
        dice.get(round).add(die);
    }

    /**
     * Create an ArrayList<Die> containing every dice of the specified round
     * @param round Must be [0, number of rounds)
     * @return ArrayList<Die> containing every dice of the specified round
     */
    public List<Die> getDice(int round) {
        if(round < 0 || round >= 10)
            throw new RoundIndexOutOfBoundException();
        return new ArrayList<>(this.dice.get(round));
    }

    @Override
    public Die getDie(int idview) {
        idview -= 1;
        return dice.get(idview % 10).get(idview / 10);
    }

    @Override
    public void setDie(int idview, Die die) {
        idview -= 1;
        dice.get(idview % 10).add(die);
    }

    @Override
    public void removeDie(int idview) {
        idview -= 1;
        dice.get(idview % 10).remove(idview / 10);
    }

    @Override
    public List<Die> getAll() {
        ArrayList<Die> all = new ArrayList<>();
        for(List<Die> i : this.dice)
            all.addAll(i);
        return all;
    }

    @Override
    public void addDie(Die die) {
        throw new UnsupportedOperationException();
    }

    @Override
    public void removeDie(Die die) {
        throw new UnsupportedOperationException();
    }

    @Override
    public int size() {
        return dice.size()*9;
    }

    public boolean isEmpty(int idview) {
        idview -= 1;
        return idview / 10 >= dice.get(idview % 10).size();
    }
}
