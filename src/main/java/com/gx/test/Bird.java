package com.gx.test;

public abstract class Bird {
    private String name;
    public abstract int fly();
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
