package it.polimi.ingsw.utils;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class StringVerifierTest {

    @Test
    void verifyName() {
        //should allow 3-10 long strings, with lowercase and digits, plus special characters '!' and '&'
        StringVerifier nv = new StringVerifier(3, 10, true, false,
                true, '!', '&');
        //test some names with this policy

        assertTrue(nv.verifyString("000")); //3
        assertTrue(nv.verifyString("qwerty")); //5
        assertTrue(nv.verifyString("p0tr!!!!!!")); //10
        assertTrue(nv.verifyString("&!&!&y90"));//8

        assertFalse(nv.verifyString(null));
        assertFalse(nv.verifyString("re"));//2
        assertFalse(nv.verifyString("qwertyqwertyb")); //too long, 11 chars
        assertFalse(nv.verifyString("qwertyASD")); //uppercase, out of policy
        assertFalse(nv.verifyString("qwe?"));//special out of policy
    }
}