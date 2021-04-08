package it.polimi.ingsw.model.microoperations;

import it.polimi.ingsw.exceptions.*;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.model.DiceContainer;
import it.polimi.ingsw.model.Die;
import it.polimi.ingsw.model.game.Flow;
import it.polimi.ingsw.model.game.GameManager;
import it.polimi.ingsw.utils.Logger;

import java.util.*;

import static java.lang.Integer.parseUnsignedInt;

/**
 * Implements the MOVE MicroOperation
 */
public class MoveMicroOperation extends AbstractMicroOperation {

    private static final String ALL         = "all";
    private static final String RANDOM      = "random";
    private static final String USER        = "user";
    private static final String APPEND      = "append";

    private GameManager gm;

    private List<Die> dice;
    private Integer quantity;

    private List<Integer> viewIDs;


    public MoveMicroOperation (String ... parameters) {
        super("move", parameters);
    }

    @Override
    public void doOperation(GameManager gm, Flow flow) throws WrongParametersNumberException, IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        this.gm = gm;

        MicroOperationVariables mov = flow.getMicroOperationVariables();

        dice = new ArrayList<>();

        if (parameters.size() == 5) {
            if (parameters.get(2).equals(USER)){
                try {
                    viewIDs = mov.popAll(parameters.get(1));
                } catch (InvalidComponentException invalidComponent) {
                    throw new MicroOperationSyntaxErrorException("Can't popAll(\"" + parameters.get(1) + "\")");
                }
            }
            else if(parameters.get(4).equals(USER)) {
                try {
                    viewIDs = mov.popAll(parameters.get(3));
                } catch (InvalidComponentException invalidComponent) {
                    throw new MicroOperationSyntaxErrorException("Can't popAll(\"" + parameters.get(3) + "\")");
                }
            }

            if (parameters.get(0).equals(ALL)) {
                extractAll();
                quantity = dice.size();
            } else {
                quantity = parseUnsignedInt(parameters.get(0));
                extractSome();
            }
            insert();
            gm.notifyChanged();

            Logger.std().verbose("MoveMicroOp: " + parameters);
            Logger.std().verbose("MoveMicroOp: DiceInCurrent: " + flow.getMicroOperationVariables().getCurrentPlayer().orElseThrow(CantAccessPlayerException::new).getAll().toString());
        } else
            throw new WrongParametersNumberException();
    }

    @Override
    public boolean equalsType(Object obj) {
        return obj instanceof MoveMicroOperation;
    }

    private void extractAll() throws IllegalParameterException {
        DiceContainer container;
        try {
            container = gm.getDiceContainer(parameters.get(1));
        } catch (InvalidComponentException e) {
            throw new IllegalParameterException();
        }
        try {
            Logger.std().debug("Move.extractAll() (1/2): in move: " + dice + ". in container: " + container.getAll());
        } catch (UnsupportedOperationException e) {
            Logger.std().debug("Move.extractAll() (1/2): tried to log unsupported getAll()");
        }
        dice.addAll(container.getAll());
        for (Die die : dice)
            container.removeDie(die);
        try {
            Logger.std().debug("Move.extractAll() (2/2): in move: " + dice + ". in container: " + container.getAll());
        } catch (UnsupportedOperationException e) {
            Logger.std().debug("Move.extractAll() (2/2): tried to log unsupported getAll()");
        }
    }

    private void extractSome() throws IllegalParameterException, QuantityDifferFromViewIDsException {
        Random r = new Random((long)(Math.random() * 10000));
        DiceContainer container;
        try {
            container = gm.getDiceContainer(parameters.get(1));
        } catch (InvalidComponentException e) {
            throw new IllegalParameterException();
        }
        try {
            Logger.std().debug("Move.extractSome() (1/2): in move: " + dice + ". in container: " + container.getAll());
        } catch (UnsupportedOperationException e) {
            Logger.std().debug("Move.extractSome() (1/2): tried to log unsupported getAll()");
        }
        switch (parameters.get(2)) {
            case USER:
                break;
            case RANDOM:
                viewIDs = new ArrayList<>();

                // Generate all the possible idviews
                for (int i = 1; i <= container.size(); i++)
                    viewIDs.add(i);
                // Randomly delete some of them
                for (int i = 0; i < container.size() - quantity; i++)
                    viewIDs.remove(r.nextInt(viewIDs.size()));
                break;
            default:
                throw new IllegalParameterException();
        }

        if (quantity != viewIDs.size())
            throw new QuantityDifferFromViewIDsException();

        // Read all the dice that I need
        for (Integer j : viewIDs)
            dice.add(container.getDie(j));
        viewIDs.sort(Collections.reverseOrder());
        // Delete the dice that I just read
        for (Integer j : viewIDs)
            container.removeDie(j);
        try {
            Logger.std().debug("Move.extractSome() (2/2): in move: " + dice + ". in container: " + container.getAll());
        } catch (UnsupportedOperationException e) {
            Logger.std().debug("Move.extractSome() (2/2): tried to log unsupported getAll()");
        }
    }

    private void insert () throws IllegalParameterException, MicroOperationSyntaxErrorException, QuantityDifferFromViewIDsException {
        if(parameters.get(3).equals(ModelGlobals.componentRoundTrack()))
        {
            int round = 0;
            switch (parameters.get(4)) {
                case USER:
                    if (quantity != viewIDs.size())
                        throw new QuantityDifferFromViewIDsException();
                    for(int i = 0;i < quantity;i++)
                        gm.getTable().getRoundTrack().setDie(viewIDs.get(i), dice.get(i));
                    break;
                case RANDOM:
                    throw new MicroOperationSyntaxErrorException("Can't have " + parameters.get(3) + " and " + parameters.get(4));
                case APPEND:
                    // Search the first free column of the RoundTrack
                    for(int i = 0;i < 10;i++)
                        try {
                            if(gm.getTable().getRoundTrack().getDice(i).isEmpty()) {
                                round = i;
                                break;
                            }
                        } catch (RoundIndexOutOfBoundException e) {
                            Logger.std().error("MoveMicroOperation.insert() (1): RoundIndexOutOfBoundException");
                        }
                    for(Die die : dice)
                        gm.getTable().getRoundTrack().addDie(die, round);
                    break;
                default:
                    throw new IllegalParameterException();
            }
        }
        else
        {
            DiceContainer container;
            try {
                container = gm.getDiceContainer(parameters.get(3));
            } catch (InvalidComponentException e) {
                throw new IllegalParameterException();
            }
            try {
                Logger.std().debug("Move.insert() (1/2): in move: " + dice + ". in container: " + container.getAll());
            } catch (UnsupportedOperationException e) {
                Logger.std().debug("Move.insert() (1/2): in move: \" + dice + \". in container: (can't getAll(), UnsupportedOperation)");
            }
            switch (parameters.get(4)) {
                case USER:
                    if (quantity != viewIDs.size())
                        throw new QuantityDifferFromViewIDsException("quantities "+quantity +" "+ viewIDs.size());

                    for (int i = 0;i < quantity;i++)
                        container.setDie(viewIDs.get(i), dice.get(i));
                    break;
                case RANDOM:
                case APPEND:
                    for(Die die : dice)
                        container.addDie(die);
                    break;
                default:
                    throw new IllegalParameterException();
            }
            try {
                Logger.std().debug("Move.insert() (2/2): in move: " + dice + ". in container: " + container.getAll());
            } catch (UnsupportedOperationException e) {
                Logger.std().debug("Move.insert() (1/2): in move: \" + dice + \". in container: (can't getAll(), UnsupportedOperation)");
            }
        }

        dice.clear();
    }
}

