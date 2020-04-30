package com.gx.test;

public class B implements Cloneable{
    private String name = "B";
    private int age = 100;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public Object clone(){
        try{
            return super.clone();
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public String toString() {
        return "B{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
