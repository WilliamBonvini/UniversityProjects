package it.polimi.ingsw.utils;

import java.io.Serializable;

/**
 * Stores two objects together
 */
public class Couple<T,E> implements Serializable {
    private T t;
    private E e;

    public Couple(T t, E e) {
        this.t = t;
        this.e = e;
    }

    public void setFirst(T t) {
        this.t = t;
    }

    public void setSecond(E e) {
        this.e = e;
    }

    public T getFirst() {
        return t;
    }

    public E getSecond() {
        return e;
    }

    @Override
    public boolean equals(Object obj) {
        return obj instanceof Couple &&
                ((Couple) obj).getFirst().equals(getFirst()) &&
                ((Couple) obj).getSecond().equals(getSecond());
    }
}
