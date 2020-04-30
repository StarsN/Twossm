package com.gx.test;

public class A implements Cloneable {
    public String  name = "A";
    public int age = 200;
    public B b = new B();
    @Override
    public String toString() {
        return "A{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", b=" + b +
                '}';
    }

    @Override
    public Object clone(){
        A a = null;
        try{
            a = (A) super.clone();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        a.b = (B) b.clone();
        return a;
    }
}
