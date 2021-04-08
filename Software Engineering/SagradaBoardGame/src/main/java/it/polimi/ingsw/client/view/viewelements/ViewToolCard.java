package it.polimi.ingsw.client.view.viewelements;

/**
 * contains all the needed information to be displayed by the client for a generic tool card.
 * a toolcard is identified by numToolCard which is an int that goes from 1 to 12 and identifies the actual tool card.
 * numFavourPoints is the number of favour points that have been put on the tool card.
 */
public class ViewToolCard {
    private int numToolCard;
    private int numFavourPoints;
    private String name;
    private String description;

    /**
     * the constructor initializes the tool card identifier at zero (which does not correspond to any actual tool card
     * and the number of favour points at zero as well, because at the beginning of the game each tool card has zero
     * favour points on it.
     */
    public ViewToolCard(){
        numToolCard=0;
        numFavourPoints=0;
        name = "Nome Tool";
        description = "Descrizione Tool";
    }

    public String getName() {
        return name;
    }

    public int getNumToolCard() {
        return numToolCard;
    }

    public int getNumFavourPoints() {
        return numFavourPoints;
    }

    public void setNumFavourPoints(int numFavourPoints) {
        this.numFavourPoints = numFavourPoints;
    }

    public String getDescription() {
        return description;
    }
}
