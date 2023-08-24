package com.example.demo3.data;

import com.example.demo3.business.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.text.NumberFormat;
import java.util.List;

public class CartDAO {
    public  void insert(Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(cart);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }
    public void update(Cart cart) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(cart);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public Cart getCartByUser(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT c FROM Cart c WHERE c.user.id = :email";
        TypedQuery<Cart> q = em.createQuery(qString, Cart.class);
        q.setParameter("email",user.getUserID());
        Cart result = null;
        try {
            result = q.getSingleResult();
        } catch (NoResultException ex) {
            return null;
        } finally {
            em.close();
        }

        return result;
    }

    public static Cart getCartByUser1(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        return em.find(Cart.class, user.getUserID());
    }
    public static int getCount(List<CartItem> items) {
        return items.size();
    }

    public List<CartItem> addItem(List<CartItem> items, CartItem item) { //add to cart on session
        //If the item already exists in the cart, only the quantity is changed.
        int code = item.getProduct().getId();
        int quantity = item.getQuantity();
        for (int i = 0; i < items.size(); i++) {
            CartItem lineItem = items.get(i);
            if (lineItem.getProduct().getId() == code) {
                lineItem.setQuantity(quantity);
                return items;
            }
        }
        items.add(item);
        return items;
    }

    public List<CartItem> removeItem(List<CartItem> items, CartItem item) {
        int code = item.getProduct().getId();
        for (int i = 0; i < items.size(); i++) {
            CartItem lineItem = items.get(i);
            if (lineItem.getProduct().getId() == code) {
                items.remove(i);
                break;
            }
        }
        return items;
    }

    public static Cart clearCart(Cart cart) {
        cart.getListCart().clear();
        return cart;
    }

    public static double getTotalCurrencyFormat(List<CartItem> items) {
        double totalPrice = 0;
        if(items!= null && items.isEmpty()!=true) {
            for (int i = 0; i < items.size(); i++) {
                CartItem lineItem = items.get(i);
                totalPrice += lineItem.getProduct().getProPrice() * lineItem.getQuantity();
            }

            return totalPrice;
        }
        else {

            return totalPrice;
        }
    }
    public static Double getTotal(List<CartItem> items) {
        double totalPrice = 0;
        for (int i = 0; i < items.size(); i++) {
            CartItem lineItem = items.get(i);
            totalPrice += lineItem.getProduct().getProPrice() * lineItem.getQuantity();
        }
        return totalPrice;
    }

}
