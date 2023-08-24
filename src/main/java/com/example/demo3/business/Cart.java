package com.example.demo3.business;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import static com.sun.activation.registries.LogSupport.log;
import static jakarta.persistence.FetchType.EAGER;

@Entity
@Table(name = "carts")
public class Cart implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cartid", nullable = false)
    private Integer cartId;

    @ManyToOne
    private User user;
    @OneToMany(fetch = EAGER, cascade = CascadeType.ALL)
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
    public int getCount(){
        return listCart.size();
    }
    public Product findCartItemById(int id , List<Product> listCart)
    {
        Product itemIndex = null ;
        for (Product index:listCart) {
            if(index.getId().equals(id))
            {
               itemIndex = index;
            }

        }
        return itemIndex;
    }

    public double getTotalCost(){
        double totalCost=0;
        for (CartItem item : listCart
             ) {
            totalCost+=(item.getProduct().getProPrice()*item.getQuantity());
        }
        return totalCost;
    }
    public Cart(String txt , List<Product> list){
        listCart =new ArrayList<>();
       try {
           if (txt != null && txt.length() != 0) {
               String[] s = txt.split(",");
               for (String i : s) {
                   String[] n = i.split(":");
                   int id = Integer.parseInt(n[0]);
                   int quantity = Integer.parseInt(n[1]);
                   Product cartItem = findCartItemById(id,list);
                   CartItem item = new CartItem() ;
                   item.setProduct(cartItem);
                   item.setQuantity(quantity);
                   listCart.add(item);
                   //System.out.println("cart id : " + listCart.get(0).getProduct().getProName());
               }
           }
       }catch (NumberFormatException e){


       }
    }
}