package com.example.demo3.data;

import com.example.demo3.Iterator.filter.Filter;
import com.example.demo3.Iterator.filter.Search;
import com.example.demo3.Iterator.filter.brandProductFilter;
import com.example.demo3.Iterator.filter.categoryProductFilter;
import com.example.demo3.business.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public class DAOFactory {
    AccountDAO ad = new AccountDAO();
    CartDAO cd = new CartDAO();
    OrderDAO od = new OrderDAO();
    UserDAO ud = new UserDAO();
    ProductDAO pd = new ProductDAO();

    // get Instance to call from other class
    private static DAOFactory instance;
    public static DAOFactory getInstance(){
        if(instance == null){
            instance = new DAOFactory();
        }
        return instance;
    }

    // ORDER
    //start
    public void makeOrder(ShippingInfo shippingInfo,User user ,Cart cart ){
        LocalDate curDate = LocalDate.now();
        Date date = java.sql.Date.valueOf(curDate);
        Order order = new Order();
        order.setOrderDetail(cart);
        order.setShipInfo(shippingInfo);
        order.setDateCreated(date);
        order.setUser(user);
        order.setNotify(1);
        OrderDAO.insert(order);
    }
    public void updateOrder(Order order){
        od.update(order);
    }


    //end

    //USER

    // start
    public void addUser(User user){
        ud.insert(user);
    }
    public void updateUser(User user){
        ud.update(user);
    }
    public void removeUser(User user){
        user.setUserStatus(0);
        ud.update(user);
    }
    // end

    //PRODUCT

    //start
    public void addProduct(Product product){
        pd.insert(product);
    }
    public void updateProduct(Product product){
        pd.update(product);
    }
    public void removeProduct(Product product){
        product.setProStatus(0);
        pd.update(product);
    }
    public List<Product> selectProducts()
    {
       return pd.selectProducts();
    }
    public List<Product> selectProductsindex(int quan)
    {
        return pd.selectProductsindex(quan);
    }

    //end
    //CART

    // start
    public boolean addToCart(Product product , int quantity,Cart cart, User user) {
        if (cart == null) {
            if (user != null) {
                // Retrieve the Cart of that id if they already logged in
                if (cd.getCartByUser1(user) != null) {
                    cart = CartDAO.getCartByUser1(user);
                }
                //Create a Cart if they haven't had a cart yet
                else {
                    cart = new Cart();
                    cart.setUser(user);
                    cd.insert(cart);
                }
            }
        }
        int check = 0;
        if (product != null) {
            CartItem cartItem = new CartItem();
            for (CartItem in : cart.getListCart()
            ) {
                if (in.getProduct().getId() == product.getId()) {
                    if (quantity != 1) {
                        in.setQuantity(in.getQuantity() + quantity);
                        check = 1;
                    } else {
                        in.setQuantity(in.getQuantity() + 1);
                        check = 1;
                    }
                }
            }
            if (check == 0) {
                cartItem.setProduct(product);
                cartItem.setSize("L");
                cart.setListCart(cd.addItem(cart.getListCart(), cartItem));
            }
        }
        if (user!=null)
        {
            cd.update(cart);
            return true;
        }
        else return false;
    }
    public double getTotalPrice(Cart cart)
    {
        return cd.getTotalCurrencyFormat(cart.getListCart());
    }
    public boolean updateCart(Product product , int quantity,Cart cart, User user) {
        try {

            if (quantity < 0) {
                quantity = 1;
            }
        } catch (NumberFormatException ex) {
            quantity = 1;
        }

        if (product != null && cart != null) {
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setQuantity(quantity);
            if (quantity > 0) {
                cart.setListCart(cd.addItem(cart.getListCart(),cartItem));
            } else {
                cart.setListCart(cd.removeItem(cart.getListCart(),cartItem));
            }
        }
        if (user!=null)
        {
            cd.update(cart);
            return true;
        }else{
            return false;
        }
    }
    public boolean removeCart(Product product,Cart cart, User user) {
        if (product != null && cart != null) {
            CartItem lineItem = new CartItem();
            lineItem.setProduct(product);
            cart.setListCart(cd.removeItem(cart.getListCart(), lineItem));
        }
        if (user != null) {
            cd.update(cart);
            return true;
        } else {
            return false;
        }
    }
    public void saveCart(Cart cart)
    {
        cd.insert(cart);
    }
    public void saveUpdateCart(Cart cart)
    {
        cd.update(cart);
    }
    public void clearCart(Cart cart)
    {
        cd.clearCart(cart);
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
    public Cart getCartByUser(User user)
    {
        return  cd.getCartByUser1(user);
    }

    //end

    //ACCOUNT

    // start
    public void addAccount(Account account){
        ad.insert(account);
    }
    public void updateAccount(Account account){
        ad.update(account);
    }
    public void removeAccount(Account account){
        ad.update(account);
    }
    // end

    //PAGE
    public Filter getFilter(int index){
        switch (index){
            case (1):
                return new categoryProductFilter();
            case (2):
                return new brandProductFilter();
            case(3):
                return new Search();
            default:
                return null;
        }
    }
    public String getCategory(int index){
        switch (index){
            case (1):
                return "TOP";
            case (2):
                return "BOTTOM";
            case(3):
                return "BAG";
            case(4):
                return "SNEAKER";
            case (5):
                return "adidas";
            case (6):
                return "nike";
            default:
                return null;
        }
    }

}
