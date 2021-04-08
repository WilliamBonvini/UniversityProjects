package it.polimi.ingsw.model.factories;

import it.polimi.ingsw.exceptions.EmptyDeckException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Creates and returns integer which are IDs for objectives, without duplicates.
 */
public class ObjectiveFactory {

    private static final int NUM_OF_PUBLIC_OBJECTIVES = 10;
    private static final int NUM_OF_PRIVATE_OBJECTIVES = 5;

    private List<Integer> publicObjectiveIDs;
    private List<Integer> privateObjectiveIDs;

    public ObjectiveFactory() {
        publicObjectiveIDs = new ArrayList<>(NUM_OF_PUBLIC_OBJECTIVES);
        privateObjectiveIDs = new ArrayList<>(NUM_OF_PRIVATE_OBJECTIVES);
        for (int i = 1; i <= NUM_OF_PUBLIC_OBJECTIVES; i++) {
            publicObjectiveIDs.add(i);
        }

        //11 to 15
        for (int i = 1+NUM_OF_PUBLIC_OBJECTIVES; i <= NUM_OF_PUBLIC_OBJECTIVES + NUM_OF_PRIVATE_OBJECTIVES; i++) {
            privateObjectiveIDs.add(i);
        }

        Collections.shuffle(publicObjectiveIDs);
        Collections.shuffle(privateObjectiveIDs);
    }


    /**
     *
     * @return the integer representing the id of a random public objective in this deck
     * @throws EmptyDeckException if there are no more public objectives in the virtual deck
     */
    public Integer getRandomPublicObjectiveID() {
        if(publicObjectiveIDs.isEmpty())
            throw new EmptyDeckException();

        return publicObjectiveIDs.remove(0);
    }

    /**
     *
     * @return the integer representing the id of a random private objective in this deck
     * @throws EmptyDeckException if there are no more public objectives in the virtual deck
     */
    public Integer getRandomPrivateObjectiveID() {
        if(privateObjectiveIDs.isEmpty())
            throw new EmptyDeckException();

        return privateObjectiveIDs.remove(0);
    }

}
