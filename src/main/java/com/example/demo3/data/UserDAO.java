package com.example.demo3.data;


import com.example.demo3.Iterator.UserIterator;
import com.example.demo3.business.Product;
import com.example.demo3.business.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;


public class UserDAO implements Iterable<Serializable> {

    public  void insert(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
    public static User selectUserByID(int userID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        return em.find(User.class, userID);
    }
    public void update(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
    public static List<User> selectUsers() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p from User p";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        List<User> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }
        return results;
    }
    public static User findUserByUsername(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u "
                + "WHERE u.account.username = :email";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("email", email.trim());
        User result = null;
        try {
            result = q.getSingleResult();
            System.out.println("Maillllllllllllll: " + result.getEmail());
        } catch (NoResultException ex) {
            return result;
        } finally {
            em.close();
        }

        return result;
    }
    public static Boolean findemail(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u "
                + "WHERE u.Email = :email";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("email", email.trim());
        User result = null;
        try {
            result = q.getSingleResult();

        } catch (NoResultException ex) {
            return false;
        } finally {
            em.close();
        }

        return result!=null;
    }

    public static User selectUser(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u "
                + "WHERE u.account.username = :email";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("email", email);
        User result = null;
        try {
            result = q.getSingleResult();
        } catch (NoResultException ex) {
            return result;
        } finally {
            em.close();
        }

        return result;
    }
    public static User findUserbyAccount(int aID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u "
                + "WHERE u.id = :aID";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("aID", aID);
        User result = null;
        try {
            result = q.getSingleResult();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }

        return result;
    }

    @Override
    public Iterator<Serializable> iterator() {
        return new UserIterator(selectUsers());
    }
}
