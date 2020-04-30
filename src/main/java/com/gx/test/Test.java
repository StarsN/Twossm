package com.gx.test;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class Test {
    public void test(Bird bird){
        System.out.println(bird.getName() + "能够飞" + bird.fly() + "米");
    }
    public static void main(String[] args){
//        Test test = new Test();
//        test.test(new Bird() {
//            @Override
//            public int fly() {
//                return 1000;
//            }
//            @Override
//            public String getName() {
//                return "小鸡";
//            }
//        });
        A a = new A();
        A a1 = (A) a.clone();
        System.out.println("a=" + a.toString());
        System.out.println("a1=" + a1.toString());
        a.b.setName("B1");
        a.b.setAge(101);
        System.out.println("a=" + a.toString());
        System.out.println("a1=" + a1.toString());
    }

    public static <E> void printArray(E[] inputArray,List<?> a){
        for (E element: inputArray) {
            System.out.println(element);
        }
    }

    public class Box<T>{
        private T t;
        public void add(T t){
            this.t=t;
        }
        public T get(){
            return t;
        }
    }
}
