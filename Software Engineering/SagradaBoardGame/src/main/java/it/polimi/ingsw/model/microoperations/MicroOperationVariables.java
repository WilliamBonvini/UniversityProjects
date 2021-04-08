package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.InvalidComponentException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.Player;
import it.polimi.ingsw.model.Table;
import it.polimi.ingsw.utils.Couple;
import it.polimi.ingsw.model.Number;
import it.polimi.ingsw.utils.Logger;

import java.util.*;

/**
 * Container of the variables used by all the MicroOperations during a match
 */
public class MicroOperationVariables {
    // True if we are in the second sets of turns of a single round
    private boolean isSecondTurn;

    // The current player that is playing
    private Player currentPlayer;

    // Numbers that the current dice can assume for the current transformation
    private List<Couple<Number, Number>> restrictedNumbers;

    // Memorize if a ViewComponent is requested and the IdViews sent by the client
    private HashMap<String, Couple<Boolean, List<Integer>>> components;

    // Components' names
    private Set<String> componentsNames;

    // True if a user called a "pass" command and the InputMicroOperation don't know it yet
    private boolean pass;

    // Current choose schema to be displayed. 0 if none
    private int schema;

    // Setted aside idview
    private int settedAsideIDView;

    // Table saved by the checkpoint MicroOperation
    private Table checkpointTable;

    public MicroOperationVariables () {
        pass = false;
        setSecondTurn(false);
        setCurrentPlayer(null);
        restrictedNumbers = new ArrayList<>();

        componentsNames = new TreeSet<>();
        componentsNames.add(ModelGlobals.componentChoose());
        componentsNames.add("current");
        componentsNames.add(ModelGlobals.componentPool());
        componentsNames.add(ModelGlobals.componentRoundTrack());
        componentsNames.add(ModelGlobals.componentBoard());
        componentsNames.add(ModelGlobals.componentTool());

        components = new HashMap<>();
        for (String component : componentsNames)
            components.put(component, new Couple<>(false, new ArrayList<>()));
    }

    public Optional<Player> getCurrentPlayer() {
        if(currentPlayer == null)
            return Optional.empty();
        return Optional.of(currentPlayer);
    }
    public void setCurrentPlayer(Player currentPlayer) {
        this.currentPlayer = currentPlayer;
    }

    List<Couple<Number, Number>> getRestrictedNumbers() {
        List<Couple<Number, Number>> numbers = new ArrayList<>(restrictedNumbers);
        Collections.shuffle(numbers);
        return numbers;
    }
    void addNumberRestriction(Couple<Number, Number> number) {
        this.restrictedNumbers.add(number);
    }
    void clearRestrictedNumber () {
        this.restrictedNumbers.clear();
    }

    public boolean isSecondTurn() {
        return isSecondTurn;
    }
    void setSecondTurn(boolean secondTurn) {
        isSecondTurn = secondTurn;
    }

    /**
     * Pop all the idviews from a component
     * @param component to be popped
     * @return a list of integers of the component
     */
    List<Integer> popAll(String component) {
        if(components.containsKey(component)) {
            List<Integer> tmp = components.get(component).getSecond();
            Logger.std().verbose("Popping: " + tmp);
            components.replace(component, new Couple<>(false, new ArrayList<>()));
            return tmp;
        }
        else
            throw new InvalidComponentException();
    }

    /**
     * Check if there are some idviews
     * @return true if empty
     */
    public boolean empty () {
        for(String name : componentsNames)
            if(!components.get(name).getSecond().isEmpty())
                return false;
        return true;
    }

    /**
     * Request a component to be filled
     * @param component to be filled
     */
    public void request(String component) {
        if(components.containsKey(component))
            components.get(component).setFirst(true);
        else
            throw new InvalidComponentException();
    }

    /**
     * Tell if a component is requested
     * @param component to be checked
     * @return true if the component need to be filled
     */
    public boolean isRequested (String component) {
        if(components.containsKey(component)) {
            return components.get(component).getFirst();
        }
        else
            throw new InvalidComponentException();
    }

    /**
     * Clear all the requested inputs
     */
    void clearInputs () {
        for (String name : componentsNames)
            components.get(name).setFirst(false);
    }

    /**
     * Fill a component with the specified idviews
     * @param component to be filled
     * @param idviews to be used
     */
    public void fill(String component, List<Integer> idviews) {
        if(components.containsKey(component)) {
            Logger.std().verbose("MOV.fill(): Trying to fill " + component);
            if (isRequested(component)) {
                components.get(component).getSecond().addAll(idviews);
                Logger.std().verbose("MOV.fill(): Filled with " + idviews);
            }
            else
                Logger.std().verbose("MOV.fill(): Filling failed: not requested component \"" + component + "\"");
        }
        else
            throw new InvalidComponentException();
    }

    /**
     * Call this method if a user requested a "pass" command
     */
    public void pass () {
        pass = true;
    }

    /**
     * This function can be called just once for every pass that a user send!
     * It should be called just by the InputMicroOperation
     * @return true if the current user called a "pass" command, false otherwise
     */
    boolean stopWaitingForInput () {
        if (pass) {
            pass = false;
            return true;
        }
        return false;
    }

    /**
     * Set the schema to be displayed client-side
     * @param schema to be displayed client-side
     */
    void setSchema (int schema) {
        this.schema = schema;
    }

    /**
     * Return the current displayed schema
     * @return current schema
     */
    public int getSchema () {
        return schema;
    }

    /**
     * Memorize an idview
     * @param component to be memorized
     */
    void setAside (String component) {
        if(components.containsKey(component))
            settedAsideIDView = components.get(component).getSecond().get(0);
        else
            throw new InvalidComponentException();
    }

    /**
     * Get the memorized idview
     * @return the memorized idview
     */
    public int getSetAsideIDView() {
        return settedAsideIDView;
    }

    public void setTable (Table table) {
        this.checkpointTable = new Table(table);
    }
    public Table getTable () {
        return checkpointTable;
    }
}
