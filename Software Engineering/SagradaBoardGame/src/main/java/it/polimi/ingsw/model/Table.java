package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.connection.UserNotFoundException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Container of the things that are present in a real table during a match: Players, all needed Cards, Dice, the Bag and Boards
 */
public class Table {
    private List<Player> players;
    private List<Integer> publicObjectives;
    private List<Integer> toolCards;
    private List<Integer> favourPoints;
    private RoundTrack roundTrack;
    private DiceBag diceBag;
    private Pool pool;

    private int playerNextAvailableId;

    private String firstPlayer;

    public Table() {
        playerNextAvailableId = 0;

        players = new ArrayList<>();

        publicObjectives = new ArrayList<>(3);
        publicObjectives.add(1);
        publicObjectives.add(2);
        publicObjectives.add(3);

        toolCards = new ArrayList<>(3);
        toolCards.add(-1);
        toolCards.add(-1);
        toolCards.add(-1);

        favourPoints = new ArrayList<>(3);
        favourPoints.add(0);
        favourPoints.add(0);
        favourPoints.add(0);

        roundTrack = new RoundTrack();

        diceBag = new DiceBag();

        pool = new Pool();
    }

    public Table(Table otherTable) {
        //players
        players = new ArrayList<>(otherTable.players.size());
        for (int i = 0; i < otherTable.players.size(); i++) {
            players.add(new Player(otherTable.players.get(i)));
        }
        //pubObjectives
        publicObjectives = new ArrayList<>(otherTable.publicObjectives);

        //toolCard
        toolCards = new ArrayList<>(otherTable.toolCards.size());
        toolCards.addAll(otherTable.toolCards);
        //favourPoints
        favourPoints = new ArrayList<>(otherTable.favourPoints.size());
        favourPoints.addAll(otherTable.favourPoints);
        //roundtrack
        roundTrack = new RoundTrack(otherTable.roundTrack);
        //diceBag
        diceBag = new DiceBag(otherTable.diceBag);
        //pool
        pool = new Pool(otherTable.pool);
        //firstplayer
        firstPlayer = otherTable.firstPlayer;


    }

    public void addPlayer (String name) {
        players.add(new Player(playerNextAvailableId, name));
        playerNextAvailableId ++;
    }

    public void addPlayer(Player player) {
        players.add(player);
    }

    /**
     * Get a player contained in this table from its name
     * @param playerName as a string
     * @return the specified player
     * @throws UserNotFoundException if not present the name
     */
    public Player getPlayer(String playerName) {
        for (Player p :
                players) {
            if (p.getName().equals(playerName))
                return p;
        }
        throw new UserNotFoundException();
    }

    /**
     *
     * @param toolViewID 1 to 3
     * @param toolID 1 to 12
     */
    public void setToolCard(int toolViewID, int toolID) {
        if(toolViewID < 1 || toolViewID > 3)
            return;
        toolCards.set(toolViewID-1, toolID);
    }

    /**
     * Get the list of the players
     * @return An ArrayList of the players
     */
    public List<Player> getPlayers() {
        return players;
    }

    /**
     * Get the Pool
     * @return Pool
     */
    public Pool getPool() {
        return pool;
    }

    /**
     * Get the DiceBag
     * @return DiceBag
     */
    public DiceBag getDiceBag() {
        return diceBag;
    }

    /**
     * Get one of the current available tool cards by ID
     * @param toolViewNum from 1 to 3
     * @return The ID of the specified number
     */
    public int getToolCard(int toolViewNum) {
        return toolCards.get(toolViewNum-1);
    }


    /**
     * @return the list of all tools in the table
     */
    public List<Integer> getToolCards() {
        return toolCards;
    }

    /**
     * Get one of the current available public objectives by ID, 1 from num of objectives
     * @param publicObjectiveID ID of the public objective
     * @return The PublicObjectiveCard with the specified ID
     */
    public Integer getPublicObjective(int publicObjectiveID) {
        return publicObjectives.get(publicObjectiveID-1);
    }

    /**
     * @return the list containing all public objectives in the table
     */
    public List<Integer> getPublicObjectives() {
        return new ArrayList<>(publicObjectives);
    }

    /**
     * set a new list of public objectives, replacing the old one
     */
    public void setPublicObjectives(List<Integer> newPublicObjectives) {
        publicObjectives = newPublicObjectives;
    }

    /**
     * Get the RoundTrack
     * @return RoundTrack
     */
    public RoundTrack getRoundTrack() {
        return roundTrack;
    }


    /**
     * Get the value of the very first player of the game
     * @return the name of the player
     */
    public String getFirstPlayer() {
        return firstPlayer;
    }

    /**
     * Set the very first player of the whole game
     * @param firstPlayer name, as a String
     */
    public void setFirstPlayer(String firstPlayer) {
        this.firstPlayer = firstPlayer;
    }

    /**
     * Set the favours points for the specified tool
     * @param idview of the tool
     * @param favours to be set
     */
    public void setFavourPoints(int idview, int favours) {
        idview -= 1;
        favourPoints.set(idview, favours);
    }

    /**
     * @param idview of the tool
     * @return the favour points of the tool
     */
    public int getFavoursPoints(int idview) {
        idview -= 1;
        return favourPoints.get(idview);
    }

    /**
     * Return the idview associated with that tool
     * @param tool number: can be [1, 12]
     * @return an Optional which is empty if the specified tool is not available
     */
    public Optional<Integer> getIDView (int tool) {
        int index = toolCards.indexOf(tool);
        if (index == -1)
            return Optional.empty();
        else
            return Optional.of(index + 1);
    }
}
