package com.example.demo3.data;

import com.example.demo3.business.Account;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class AccountDAO {
    public static void insert(Account account) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(account);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }



    public static Boolean findAccount(Account account) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT a FROM Account a "
                + "WHERE a.username = :username and a.password= :pass";
        TypedQuery<Account> q = em.createQuery(qString, Account.class);
        q.setParameter("username", account.getUsername());
        q.setParameter("pass", account.getPassword());
        Account result = null;
        try {
            result = q.getSingleResult();
            System.out.println("Username: " + result.getUsername());
            System.out.println("Password: " + result.getPassword());
        } catch (NoResultException ex) {
            return false;
        } finally {
            em.close();
        }

        return result != null;
    }
    public static Account findAccountByUsername(String username) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT a FROM Account a "
                + "WHERE a.username = :username";
        TypedQuery<Account> q = em.createQuery(qString, Account.class);
        q.setParameter("username", username);
        Account result = null;
        try {
            result = q.getSingleResult();
            System.out.println("Username: " + result.getUsername());
            System.out.println("Password: " + result.getPassword());
        } catch (NoResultException ex) {
            return result;
        } finally {
            em.close();
        }

        return result;
    }
}
