package it.polimi.ingsw.model;

import it.polimi.ingsw.exceptions.AlreadyEmptyException;
import it.polimi.ingsw.exceptions.BoardDimensionException;
import it.polimi.ingsw.globals.ModelGlobals;
import it.polimi.ingsw.utils.Logger;

import java.util.ArrayList;
import java.util.List;

public class Board implements DiceContainer {
    private Cell[][] grid;
    private String boardName;
    private int favourDifficulty;
    private int id;

    /**
     * Create a board based on a grid of Cells
     * @param grid the grid of Cells passed to build this Board. Must be 5x4
     * @throws BoardDimensionException if the grid of Cells is not 5x4
     */
    public Board(String boardName, int favourDifficulty, Cell[][] grid) throws BoardDimensionException {
        if(grid.length != ModelGlobals.boardSizeX() || grid[0].length != ModelGlobals.boardSizeY())
            throw new BoardDimensionException();
        this.grid = grid;
        this.boardName = boardName;
        this.favourDifficulty = favourDifficulty;
    }

    /**
     * Build a copy of the board passed
     * @param b to be copied
     */
    public Board(Board b) {
        this.grid = copyGridFromGrid(b.grid);
        this.boardName = b.boardName;
        this.favourDifficulty = b.favourDifficulty;
        this.id = b.id;
    }


    public Cell getCell(int gridX, int gridY) {
        return grid[gridX][gridY];
    }

    public Cell getCellById(int idview) {
        idview -= 1;
        return grid[idview % ModelGlobals.boardSizeX()][idview / ModelGlobals.boardSizeX()];
    }

    public String getBoardName() {
        return boardName;
    }

    public int getFavourDifficulty() {
        return favourDifficulty;
    }

    public String toString() {
        StringBuilder gridString = new StringBuilder();
        for (int j = 0; j < 4; j++) {
            for (int i = 0; i < 5; i++) {
                if(grid[i][j].hasDie())
                    gridString.append(grid[i][j].getDie().toString());
                else
                    gridString.append(grid[i][j].toString());
            }
            gridString.append('\n');
        }
        //append the neutral color
        gridString.append(Color.NONE.toString());
        StringBuilder favours = new StringBuilder();
        for (int i = 0; i < favourDifficulty; i++) {
            favours.append('*');
        }
        return "["+boardName + "]\nDifficulty: " + favours.toString() + "\n"+ gridString.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Board) {
            Board board = (Board) obj;
            //check if has the same logical grid
            boolean equalGrid = grid.length == board.grid.length && grid[0].length == board.grid[0].length;
            for (int j = 0; j < ModelGlobals.boardSizeY(); j++) {
                for (int i = 0; i < ModelGlobals.boardSizeX(); i++) {
                    if(grid[i][j] == null) {
                        if(board.grid[i][j] != null)
                            equalGrid = false;
                    } else if(!grid[i][j].equals(board.grid[i][j]))
                        equalGrid = false;
                }
            }
            //true if has the same logical grid, same name and same difficulty
            return  getBoardName().equals(board.getBoardName()) &&
                    getFavourDifficulty() == board.getFavourDifficulty() &&
                    equalGrid;
        }
        return false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private Cell[][] copyGridFromGrid(Cell[][] otherGrid) {
        if(otherGrid == null)
            return null;
        Cell[][] result = new Cell[otherGrid.length][otherGrid[0].length];
        for (int j = 0; j < otherGrid[0].length; j++) {
            for (int i = 0; i < otherGrid.length; i++) {
                result[i][j] = new Cell(otherGrid[i][j]);
            }
        }
        return result;
    }


    @Override
    public Die getDie(int idview) {
        idview -= 1;
        return grid[idview % ModelGlobals.boardSizeX()][idview / ModelGlobals.boardSizeX()].getDie().get();
    }

    @Override
    public void setDie(int idview, Die die) {
        idview -= 1;
        grid[idview % ModelGlobals.boardSizeX()][idview / ModelGlobals.boardSizeX()].placeDie(die);
    }

    @Override
    public void removeDie(int idview) {
        idview -= 1;
        try {
            grid[idview % ModelGlobals.boardSizeX()][idview / ModelGlobals.boardSizeX()].takeDie();
        } catch (AlreadyEmptyException e) {
            Logger.std().error("Board.removeDie(): AlreadyEmptyException");
        }
    }

    @Override
    public List<Die> getAll() {
        List<Die> dice = new ArrayList<>();
        for (Cell[] aGrid : grid)
            for (Cell anAGrid : aGrid)
                if(anAGrid.getDie().isPresent())
                    dice.add(anAGrid.getDie().get());
        return dice;
    }

    @Override
    public void addDie(Die die) {
        throw new UnsupportedOperationException();
    }

    @Override
    public void removeDie(Die die) {
        throw new UnsupportedOperationException();
    }

    @Override
    public int size() {
        return ModelGlobals.boardSizeX() * ModelGlobals.boardSizeY();
    }

    public boolean isEmpty() {
        for (int j = 0; j < grid[0].length; j++)
            for (Cell[] aGrid : grid)
                if (aGrid[j].hasDie())
                    return false;
        return true;
    }
}
