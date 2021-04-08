package it.polimi.ingsw.controller;

import it.polimi.ingsw.exceptions.InvalidFilterException;
import it.polimi.ingsw.utils.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * A collector of Filters
 */
public class FilterChain {
    private HashMap<String, Filter> filters;
    private IDView target;
    private List<String> names;

    public FilterChain () {
        filters = new HashMap<>();
        names = new ArrayList<>();
    }

    /**
     * Append a Filter to the chain
     * @param filter
     */
    public void addFilter (Filter filter) {
        filters.put(filter.getName(), filter);
        names.add(filter.getName());
    }

    /**
     * Activate or deactivate a filter
     * @param name
     * @param use
     */
    public void setUse (String name, boolean use) {
        if (!names.contains(name))
            throw new InvalidFilterException();
        filters.get(name).use(use);
    }

    /**
     * Test the chain. If an active Filter fail the test, the whole chain fails
     * @return the result of the test
     */
    public boolean execute () {
        Logger.std().verbose("Executing chain . . .");

        for (String name : names) {
            Filter filter = filters.get(name);
            if (filter.isActive() && !filter.execute(target))
                return false;
        }
        return true;
    }

    /**
     * Set the target to test
     * @param target
     */
    public void setTarget (IDView target) {
        this.target = target;
    }
}
