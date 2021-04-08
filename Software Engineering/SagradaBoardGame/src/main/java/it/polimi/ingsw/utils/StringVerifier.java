package it.polimi.ingsw.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * Setup a policy to check if a string matches with that policy
 */
public class StringVerifier {
    private int minLength;
    private int maxLength;
    private boolean allowLowercase;
    private boolean allowUppercase;
    private boolean allowDigits;
    private List<Character> allowedSpecial;


    /**
     * Build a Verifier with a specific policy
     * @param minLength the minimum number of letters accepted
     * @param maxLength the maximum number of letters accepted
     * @param allowLowercase if true lowercase in a nickname will be accepted
     * @param allowUppercase if true uppercase in a nickname will be accepted
     * @param allowDigits if true digits in a nickname will be accepted
     * @param c all the other special characters to include in the policy
     */
    public StringVerifier(int minLength, int maxLength, boolean allowLowercase, boolean allowUppercase,
                          boolean allowDigits, Character... c) {
        this.minLength = minLength;
        this.maxLength = maxLength;
        this.allowLowercase = allowLowercase;
        this.allowUppercase = allowUppercase;
        this.allowDigits = allowDigits;
        //add any allowed special character to the list
        if(c != null) {
            allowedSpecial = new ArrayList<>(c.length);
            for (int i = 0; i < c.length; i++) {
                allowedSpecial.add(c[i]);
            }
        } else {
            allowedSpecial = new ArrayList<>(1);
        }
    }

    /**
     * verify that the name passed it's ok with the policy previously set to this StringVerifier
     * @param testedString
     * @return true if matches the policy. null is considered always false
     */
    public boolean verifyString(String testedString) {
        //check null
        if(testedString==null)
            return false;
        //check first length if is ok
        if(testedString.length() < minLength || testedString.length() > maxLength)
            return false;

        //now check every character in the string. If does not match the policy, then is false the verification
        for (int i = 0; i < testedString.length(); i++) {
            if (!checkPolicyForChar(testedString.charAt(i)))
                return false;
        }
        //if no policy is violated, then the name is ok
        return true;
    }

    /**
     *
     * @param testedChar
     * @return true if the test is ok with the policies
     */
    private boolean checkPolicyForChar(char testedChar) {
        boolean isSpecial = false;
        //check for special characters. If is one of them mark as special (therefore allowed)
        for (Character c : allowedSpecial) {
            if(c.equals(testedChar))
                isSpecial = true;
        }
        //check general policies
        //return FALSE IF: is not special and does not belongs to digits, upper and lowercase...
        return !(
                (  !isSpecial &&
                !(Character.isDigit(testedChar) ||
                        Character.isLowerCase(testedChar) ||
                        Character.isUpperCase(testedChar))
                ) || //...or if violates one of the policies
                ((Character.isDigit(testedChar)      &&  !allowDigits) ||
                        (Character.isUpperCase(testedChar)   &&  !allowUppercase) ||
                        (Character.isLowerCase(testedChar)   &&  !allowLowercase)
                )
        );
    }
}
