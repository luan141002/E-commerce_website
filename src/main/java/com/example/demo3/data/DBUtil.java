package com.example.demo3.data;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DBUtil {
    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("JPAConnection");

    public static EntityManagerFactory getEmFactory() {
        return emf;
    }
}
