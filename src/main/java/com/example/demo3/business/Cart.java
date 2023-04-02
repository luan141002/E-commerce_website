package com.example.demo3.business;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

import static jakarta.persistence.FetchType.EAGER;

@Entity
@Table(name = "cart")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Cart_SEQ")
    @SequenceGenerator(name = "Cart_SEQ")
    @Column(name = "cartid", nullable = false)
    private Integer cartId;

    @ManyToOne
    private User user;
    @OneToMany(fetch = EAGER, cascade = CascadeType.PERSIST)
    private List<CartItem> listCart;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<CartItem> getListCart() {
        return listCart;
    }

    public void setListCart(List<CartItem> listCart) {
        this.listCart = listCart;
    }

    public Cart() {
        listCart = new ArrayList<>();
    }
    public Cart(Integer cartId, User user, List<CartItem> listCart) {
        this.cartId = cartId;
        this.user = user;
        this.listCart = listCart;
    }
}