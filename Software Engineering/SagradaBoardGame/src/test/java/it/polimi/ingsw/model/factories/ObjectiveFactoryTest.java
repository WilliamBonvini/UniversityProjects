package it.polimi.ingsw.model.factories;

import it.polimi.ingsw.exceptions.EmptyDeckException;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ObjectiveFactoryTest {

    @Test
    void getRandomPublicObjectiveID() {
        ObjectiveFactory of = new ObjectiveFactory();
        for (int i = 0; i < 10; i++) {
            of.getRandomPublicObjectiveID();
        }

        assertThrows(EmptyDeckException.class, () -> of.getRandomPublicObjectiveID());
    }

    @Test
    void getRandomPrivateObjectiveID() {
        ObjectiveFactory of = new ObjectiveFactory();
        for (int i = 0; i < 5; i++) {
            of.getRandomPrivateObjectiveID();
        }

        assertThrows(EmptyDeckException.class, () -> of.getRandomPrivateObjectiveID());
    }
}