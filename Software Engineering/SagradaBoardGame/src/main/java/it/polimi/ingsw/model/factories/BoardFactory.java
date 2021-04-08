package it.polimi.ingsw.model.factories;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import it.polimi.ingsw.exceptions.EmptyDeckException;
import it.polimi.ingsw.model.Board;
import it.polimi.ingsw.utils.Couple;
import it.polimi.ingsw.globals.FilepathGlobals;
import it.polimi.ingsw.utils.Logger;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.NoSuchElementException;

/**
 * Factory-class for Boards. Can extract from a virtual deck couples of boards always different until empty
 */
public class BoardFactory {

    private List<Couple<Board,Board>> boardCouples;
    private static final List<Couple<Board, Board>> referenceBoardCouples = loadReference();


    /**
     * Constructor which also loads from file the boards
     * @throws IOException if an error occured while opening the boards' file
     */
    public BoardFactory() throws IOException {
        boardCouples = new ArrayList<>();
        Board[] boards = loadBoards();
        //every two boards given adiacent from loadBoards, couple them as 1 card
        for (int i = 0; i < boards.length-1; i+=2) {
            boardCouples.add(new Couple<>(boards[i], boards[i+1]));
        }
        //shuffle the boards, as if it was a deck of cards
        Collections.shuffle(boardCouples);
    }


    /**
     * Take a random couple of boards. The couple will be removed from the list of obtainable couples, therefore
     * is not possible to get two times the same couple of boards.
     * @return one of the couple of boards which in the board game are on the same card (opposites sides)
     * @throws EmptyDeckException if there are no more couples of boards remained when this method is called
     */
    public Couple<Board, Board> getBoardCouple() {
        if(boardCouples.isEmpty())
            throw new EmptyDeckException();
        //since the fact the list is shuffled in the Constructor, it's ok to take the same index every time
        return boardCouples.remove(0);
    }

    /**
     * return a specific Board based on its ID: in data, ids are stored from 1 to 24
     * NOTE: this method does not depend on the current deck: even if a board with the id requested has been taken
     * away with the {@code getBoardCouple} method, if the id is valid it will return the specific board.
     *
     * NOTE 2: this method WON'T take away the specified board from the deck, if present
     *
     * @param id from 1 to 24
     * @return the Board with the specified id
     * @throws NoSuchElementException if the id is invalid or the board with the specified id is not in the deck
     */
    public static Board getBoardByID(int id)  {
        for (Couple<Board, Board> c: referenceBoardCouples) {
            if(c.getFirst().getId() == id)
                return new Board(c.getFirst());
            if(c.getSecond().getId() == id)
                return new Board(c.getSecond());
        }
        if(referenceBoardCouples.isEmpty())
            Logger.std().error("ERROR: Board Reference for IDs is empty! Boards were not loaded correctly from file!");
        throw new NoSuchElementException();
    }

    /**
     * @return true if there is at least one Couple of Boards which can be obtained with getBoardCouple()
     */
    public boolean hasRemainingCouples() {
        return !boardCouples.isEmpty();
    }



    /**
     * private method to load boards to a specificed file
     */
    private static Board[] loadBoards() throws IOException {
        try (Reader reader = new FileReader(FilepathGlobals.BOARDS_JSON_PATH)){
            Gson gson = new GsonBuilder().create();
            return gson.fromJson(reader, Board[].class);
        }
    }

    private static List<Couple<Board, Board>> loadReference() {
        Board[] boards = new Board[0];
        List<Couple<Board, Board>> result = new ArrayList<>(12);
        try {
            boards = loadBoards();
            //every two boards given adiacent from loadBoards, couple them as 1 card
            for (int i = 0; i < boards.length-1; i+=2) {
                result.add(new Couple<>(boards[i], boards[i+1]));
            }
            return result;
        } catch (IOException e) {
            Logger.std().error("ERROR: BoardFactory could not read from file '"
                    + FilepathGlobals.BOARDS_JSON_PATH + "'! There will be no reference for boards!");
        }
        return new ArrayList<>(1);
    }

}
