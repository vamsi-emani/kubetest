package com.nerdysermons;

import java.util.stream.Stream;

public class Echo {

    public static void main(String[] args) throws InterruptedException {
        Stream.of(args).forEach( arg -> System.out.println(arg + " "));
        Thread.sleep(7000l);
    }
}
