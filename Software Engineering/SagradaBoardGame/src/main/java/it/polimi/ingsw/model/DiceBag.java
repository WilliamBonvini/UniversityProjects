package it.polimi.ingsw.model;


import it.polimi.ingsw.exceptions.AlreadyFullException;
import it.polimi.ingsw.exceptions.InvalidIdException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class DiceBag implements DiceContainer {
    private ArrayList<Die> dice;

    /**
     * Creates a bag of 90 dice, 18 for each color, three instances of each value a die can have.
     * @throws InvalidIdException in case the number passed as a parameter in the method setDieNumberById is
     * less than 1 or more than 6
     */
    DiceBag() {
        dice    =   new ArrayList<>();
        Die die;
        int i;
        Random r = new Random();

        for (i = 1; i <= 18; i++) {
            die = new Die(Color.RED,Number.NONE);
            die.setValue(Number.getNumberById(r.nextInt(6) + 1));
            dice.add(die);
        }

        for (i = 1; i <= 18; i++) {
            die = new Die(Color.BLUE,Number.NONE);
            die.setValue(Number.getNumberById(r.nextInt(6) + 1));
            dice.add(die);
        }

        for (i = 1; i <= 18; i++) {
            die = new Die(Color.GREEN,Number.NONE);
            die.setValue(Number.getNumberById(r.nextInt(6) + 1));
            dice.add(die);
        }


        for (i = 1; i <= 18; i++) {
            die = new Die(Color.YELLOW,Number.NONE);
            die.setValue(Number.getNumberById(r.nextInt(6) + 1));
            dice.add(die);
        }


        for (i = 1; i <= 18; i++) {
            die = new Die(Color.PURPLE,Number.NONE);
            die.setValue(Number.getNumberById(r.nextInt(6) + 1));
            dice.add(die);
        }

        Collections.shuffle(dice);
    }


    DiceBag(DiceBag otherDiceBag) {
        dice = new ArrayList<>(otherDiceBag.size());
        for (int i = 0; i < otherDiceBag.size(); i++) {
            dice.add(new Die(otherDiceBag.dice.get(i)));
        }
    }

    @Override
    public Die getDie(int idview) {
        Die die = dice.get(0);
        dice.remove(0);
        return die;
    }

    @Override
    public void setDie(int idview, Die die) {
        throw new UnsupportedOperationException();
    }

    @Override
    public void removeDie(int idview) {
        // This method is empty because the die is already removed in getDie()
    }

    @Override
    public List<Die> getAll() {
        throw new UnsupportedOperationException();
    }

    /**
     * @param die : the die that we want to add to the DiceBag
     * @throws AlreadyFullException if the DiceBag already contains all the possible dice (90)
     */
    public void addDie(Die die) {
        dice.add(die);
    }

    @Override
    public void removeDie(Die die) {
        dice.remove(die);
    }

    /**
     * @return the number of dice contained in the DiceBag
     */
    @Override
    public int size(){
        return dice.size();
    }

    public boolean contains(Die die){
        return dice.contains(die);
    }
}
