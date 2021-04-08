package it.polimi.ingsw.client.view.viewelements;

import it.polimi.ingsw.utils.Couple;

/**
 * Represent a choice made by the server. Should be obtained through the corresponding factory class, as
 * it instances only specific choices based on IDs
 */
public class ViewChoice {

    private int id;
    private String question;
    private Couple<Integer, String>[] options;

    public ViewChoice(int id, String question, Couple<Integer, String>... options) {
        this.id = id;
        this.question = question;
        this.options = options;
    }

    public int getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }

    public Couple<Integer, String>[] getOptions() {
        return options;
    }
}
