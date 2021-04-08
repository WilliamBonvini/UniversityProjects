package it.polimi.ingsw.utils;

import java.util.List;
import java.util.Scanner;
import java.util.function.BooleanSupplier;

/**
 * Console which can print on and ask input from CLI, also gives some support method for reading/printing.
 */
public class Console {

    private static Scanner scanner = new Scanner(System.in);

    public Console() {
    }

    public static String nextLine() {
        return scanner.nextLine();
    }

    public static String askInput(String message) {
        System.out.println(message);
        return scanner.nextLine();
    }


    public static void println(String s) {
        System.out.println(s);
    }

    public static void print(String s) { System.out.print(s); }

    /**
     * Print in a line for every message contained in {@code strings}, if there are any
     * The messages are printed in normal order
     * @param strings
     */
    public static void printlnMulti(List<String> strings) {
        if (strings == null)
            return;
        while(strings.size() > 0) {
            println(strings.remove(0));
        }
    }

    /**
     * Print every message contained in {@code strings}, if there are any. THe messages are printed one after other,
     * without line separator. To separate with line, use the {@code printlnMulti} method instead
     * The messages are printed in normal order
     * @param strings
     */
    public static void printMulti(List<String> strings) {
        if (strings == null)
            return;
        while(strings.size() > 0) {
            print(strings.remove(0));
        }
    }


    /**
     * Wait until an expression {@code boolFunction} given as lambda becomes true. Until then, print every
     * {@code millis} milliseconds the {@code symbol} passed as parameter on the console. Wait for at maximum
     * {@code maxTimes} times, then return anyway
     * @param symbol
     * @param millis
     * @param maxTimes
     * @param boolFunction
     */
    public static void waitAndPrintUntil(String symbol, long millis, int maxTimes, BooleanSupplier boolFunction) {
        int times = 0;
        //as long the expression is false and the iterated times are under maxTimes, loop
        while (!boolFunction.getAsBoolean() && times <= maxTimes) {
            try {
                Thread.sleep(millis);
            } catch (InterruptedException e) {
                //do nothing
            } finally {
                System.out.print(symbol);
                times++;
            }
        }
        System.out.println();
    }

}
