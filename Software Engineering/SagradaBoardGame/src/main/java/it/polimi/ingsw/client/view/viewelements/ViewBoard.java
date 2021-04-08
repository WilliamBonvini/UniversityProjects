package it.polimi.ingsw.client.view.viewelements;



import java.util.ArrayList;
import java.util.List;

/**
 * Class representing a board client-side
 */
public class ViewBoard {
    private String name; //which will be at first the name of the board, and afterwards the name of the player who chose it
    private int favours;
    private List<ViewBoardCell> board;

    public ViewBoard(){
        board = new ArrayList<>(20);
        for (int i = 0; i < 20; i++) {
            board.add(new ViewBoardCell());
        }
    }

    /**
     * @param cellID from 1 to 20
     * @return the cell in that position
     */
    public ViewBoardCell getCell(int cellID) {
        return board.get(cellID-1);
    }

    /**
     * @param row from 0 to 3
     * @param col from 0 to 4
     * @return the cell in that position
     */
    public ViewBoardCell getCell(int row, int col) {
        return board.get(row*5+ col);
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getFavours() {
        return favours;
    }

    public void setFavours(int favours) {
        this.favours = favours;
    }
}
