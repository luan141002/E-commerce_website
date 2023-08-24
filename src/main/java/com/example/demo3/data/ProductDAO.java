package com.example.demo3.data;

import com.example.demo3.Iterator.ProductIterator;
import com.example.demo3.Iterator.productFilterIterator;
import com.example.demo3.business.Account;
import com.example.demo3.business.Order;
import com.example.demo3.business.Product;
/*import com.example.demo3.business.Size;*/
import com.example.demo3.orderState.Observer.keepTrackOrder;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;


import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

public class ProductDAO implements Serializable,Iterable<Serializable> {
    public static void insert(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {

            em.persist(product);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
    public static void update(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(product);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
    public static List<Product> selectProducts() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p from Product p";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        List<Product> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }
        return results;
    }
    public static List<Product> selectProductsindex(int quan) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager(); // thread-safe để không bị đụng độ
        String qString = "SELECT p from Product p";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        List<Product> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }

        return results.subList(0,quan);
    }
   /* public static List<Serializable> selectIndex(int quan, int from) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager(); // thread-safe để không bị đụng độ
        String qString = "SELECT p from Product p";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        List<Product> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }

        return results.subList(from,quan);
    }*/

    public static Product selectProduct(int productId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        return em.find(Product.class, productId);
    }

    @Override
    public Iterator<Serializable> iterator() {
        return new ProductIterator(selectProducts());
    }

   /* public static void insertSize(Size size) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(size);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }*/



}
