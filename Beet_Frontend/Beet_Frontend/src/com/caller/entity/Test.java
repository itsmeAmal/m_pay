package com.caller.entity;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Test {

    public static void main(String[] args) {
        double a = 12.09;
        String df = new DecimalFormat("#.00").format(a);
        System.out.println(df);
    }
}
