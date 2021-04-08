package it.polimi.ingsw.model.microoperations;

import java.util.ArrayList;
import java.util.List;

/**
 * Container of a list of MicroOperations
 */
public class MicroOperationProgram {
    private List<AbstractMicroOperation> microOperationList;

    public MicroOperationProgram () {
        microOperationList = new ArrayList<>();
    }

    public void addAll(int index, List<AbstractMicroOperation> microOperations) {
        microOperationList.addAll(index, microOperations);
    }

    public AbstractMicroOperation get(int index) {
        return microOperationList.get(index);
    }

    public List<AbstractMicroOperation> getAll() {
        return microOperationList;
    }

    public void add(int index, AbstractMicroOperation element) {
        microOperationList.add(index, element);
    }

    public void add(AbstractMicroOperation element) {
        microOperationList.add(element);
    }

    public void remove(int index) {
        microOperationList.remove(index);
    }

    public int size () {
        return microOperationList.size();
    }
}
