package it.polimi.ingsw.client.view.viewelements;


/**
 * Consists in the container class of a public objective cards, that is identified by an identifier and
 * a description of the card
 */
public class ViewObjective {
    private int id;
    private String name;
    private String description;
    private String value;

    public ViewObjective(){
        id=0;
        description="";
    }

    /**
     * Construct from another viewObjective
     * @param otherObjective
     */
    public ViewObjective(ViewObjective otherObjective) {
        if(otherObjective != null) {
            id = otherObjective.id;
            name = otherObjective.name;
            description = otherObjective.description;
            value = otherObjective.value;
        }
    }


    public int getID() {
        return id;
    }


    public String getDescription() {
        return description;
    }

    public String getName() {
        return name;
    }

    public String getValue() {
        return value;
    }
}
