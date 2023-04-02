package com.example.demo3.business;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.List;

import com.example.demo3.business.Product;

import static jakarta.persistence.FetchType.EAGER;

@Entity
@Table(name = "cartitem")
public class CartItem implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "CartItemId", nullable = false)
    private  Integer CartItemId;

    @ManyToOne
    private User user;

    @OneToOne
    private Product Product;

    public Product getProduct() {
        return Product;
    }

    public void setProduct(Product product) {
        Product = product;
    }

    @Column(nullable = true,length = 10)
    private Integer quantity;
    @Column(nullable = true,length = 10)
    private double subtotal;

    public CartItem() {
    }
    public CartItem(Product Product ,Integer cartItemId, Integer quantity, double subtotal) {
        this.CartItemId = cartItemId;
        this.Product = Product;
        this.quantity = quantity;
        this.subtotal = subtotal;
    }



    public Integer getCartItemId() {
        return CartItemId;
    }

    public void setCartItemId(Integer cartItemId) {
        CartItemId = cartItemId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public double getSubtotal() {
        double total;
        total = (double)this.quantity*this.Product.getProPrice();
        return total;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}