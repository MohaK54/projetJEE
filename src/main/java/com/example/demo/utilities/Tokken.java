package com.example.demo.utilities;

import java.util.UUID;

public class Tokken {
    public static String TOKKEN_SESSION ;

    public static String getToken() {

        return TOKKEN_SESSION;
    }

    public static void generateTokken() {

        TOKKEN_SESSION = UUID.randomUUID().toString();
    }
}
