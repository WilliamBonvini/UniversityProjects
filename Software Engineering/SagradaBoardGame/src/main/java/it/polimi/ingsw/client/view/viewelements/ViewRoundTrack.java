package it.polimi.ingsw.client.view.viewelements;

import it.polimi.ingsw.exceptions.client.InvalidViewParameterException;
import it.polimi.ingsw.model.Color;
import it.polimi.ingsw.model.Number;

/**
 * Represent a roundtrack from client-side
 */
public class ViewRoundTrack {
    private final ViewComponent[][] dice;
    private final int rounds;
    private final int maxHeight;
    private int height; //max height reached from this roundTrack


    /**
     * Create a new RoundTrack-view, with the specified size.
     * Also will instantiate every component inside which are all NONE-NONE
     * @param numOfRounds number of rounds
     * @param heightOfRounds max num of dice on a single round
     */
    public ViewRoundTrack(int numOfRounds, int heightOfRounds) {
        rounds = numOfRounds;
        maxHeight = heightOfRounds;
        dice = new ViewComponent[maxHeight][rounds];


        for (int round = 0; round < numOfRounds; round++) {
            for (int pileIndex = 0; pileIndex < heightOfRounds; pileIndex++) {
                dice[pileIndex][round] = new ViewComponent(Color.NONE, Number.NONE);
            }
        }
        height = 0; //at start is high 0, has no dice
    }


    /**
     * Set the die on a specific place. A standard ViewRoundTrack is 10 x 9, anyway dice are numbered from 1
     * to maximum size, (rounds x roundSize), and from 1 to rounds are the first die in each round pile.
     * @param place from 1 to max dice size (90 default)
     * @param die the placed die
     */
    public void setDie(int place, ViewComponent die) {
        //reduce place by 1 due to index starting from 0 but place from 1
        place -=1;
        if (place > dice.length* dice[0].length)
            throw new InvalidViewParameterException();
        int y = place/rounds;
        int x = place%rounds;
        //if the old die is none
        if(dice[y][x].isNone()) {
            if (!die.isNone()) { //check if the new die has content, if it has, update
                dice[y][x].setColor(die.getColor());
                dice[y][x].setNumber(die.getNumber());
                //update the height in case the new placed die is higher
                if(y + 1 > height)
                    height = y + 1;
            }
        } else { //else probably the old die is gonna be removed, anyway recalculate the height
            dice[y][x].setColor(die.getColor());
            dice[y][x].setNumber(die.getNumber());
            calculateHeight();
        }

    }

    /**
     *
     * @param pileY the height on the track where to take the die. from 0 to maxHeight - 1 (8 default)
     * @param round the round on the track where to take the die from 0 to num of rounds - 1 (9 default)
     * @return the component in that position
     */
    public ViewComponent getComponent(int pileY, int round) {
        return dice[pileY][round];
    }

    /**
     *
     * @param idView the id on the view, from 1 to 90
     * @return
     */
    public ViewComponent getComponent(int idView) {
        return dice[(idView-1)/rounds][(idView-1)%rounds];
    }

    public int getHeight() {
        return height;
    }

    public int getRounds() {
        return rounds;
    }

    /**
     *
     * @return the max id callable for this roundtrack for method getComponent
     */
    public int getMaxId() {
        return rounds*maxHeight;
    }

    /**
     * based on current state, calculate the height of the roundtrack and update the private height field
     */
    private void calculateHeight() {
        boolean atLeastOneDie = false;
        for (int pileY = 0; pileY < maxHeight; pileY++) {
            for (int round = 0; round < rounds; round++) {
                if(!dice[pileY][round].isNone()) {//if one die in the y is not none, is a die
                    atLeastOneDie = true;
                }
            }
            if(!atLeastOneDie) { //if there weren't dice on the row, the height is found, return
                height = pileY + 1;
                return;
            }
        }
    }



    
}
