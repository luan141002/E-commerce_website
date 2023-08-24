package com.example.demo3.controller;

import com.example.demo3.business.*;
import com.example.demo3.data.CartDAO;
import com.example.demo3.data.DAOFactory;
import com.example.demo3.data.ProductDAO;
import com.example.demo3.data.UserDAO;
import com.example.demo3.util.CSRFTokenUtil;
import com.example.demo3.util.CookieUtil;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.io.IOException;


@WebServlet(name = "CartServlet",urlPatterns={"/Cart/*"})
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 102831973239L;
    private static final String defaultURL = "/Cart1.jsp";
    Timer timer;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String url = defaultURL;

            log("RequestURI: " + requestURI);
            if (requestURI.endsWith("/showCart")) {
                url = showCart(request, response);
            } else if (requestURI.endsWith("/addItem")) {
                url = addItem(request, response);
            } else if (requestURI.endsWith("/updateItem")) {
                url = updateItem(request, response);
            } else if (requestURI.endsWith("/removeItem")) {
                url = removeItem(request, response);
            } else if (requestURI.endsWith("/clearCart")) {
                url = clearCart(request, response);
            }

        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String url = "/";

        if (requestURI.endsWith("/showCart")) {
            url = showCart(request, response);
        } else if (requestURI.endsWith("/addItem")) {
            url = addItem(request, response);
        } else if (requestURI.endsWith("/updateItem")) {
            url = updateItem(request, response);
        } else if (requestURI.endsWith("/removeItem")) {
            url = removeItem(request, response);
        } else if (requestURI.endsWith("/clearCart")) {
            url = clearCart(request, response);
        }


        response.sendRedirect(url);
    }
    private String clearCart(HttpServletRequest request,
                             HttpServletResponse response) {
        HttpSession session = request.getSession();
        final Object lock = request.getSession().getId().intern();
        Cart cart;
        synchronized (lock) {
            cart = (Cart) session.getAttribute("cart");
            DAOFactory.getInstance().clearCart(cart);
            request.getSession().setAttribute("cart", cart);
        }
        session.setMaxInactiveInterval(-1);
        return "Cart/showCart";
    }

    private String showCart(HttpServletRequest request,
                            HttpServletResponse response) {
        HttpSession session = request.getSession();
        Cart cart;
        User user = (User) session.getAttribute("user");
        double totalPrice;
        final Object lock = request.getSession().getId().intern();
        synchronized (lock) {
            //cart = (Cart) session.getAttribute("cart-list");
            /*if (cart == null) {*/
                if(user!=null){
                    User user1 = UserDAO.selectUserByID(user.getUserID());
                    System.out.println(user.getUserID());
                    // Retrieve the Cart of that id if they already logged in
                    if(DAOFactory.getInstance().getCartByUser(user1)!=null){
                        session.removeAttribute("cart-list");

                        cart= DAOFactory.getInstance().getCartByUser(user1);

                        System.out.println(cart.getListCart().get(0).getProduct().getProName());
                        int n = cart.getListCart().size();
                        request.getSession().setAttribute("size",n);
                        request.getSession().setAttribute("data",cart.getListCart());
                        request.getSession().setAttribute("cart-list", cart);
                    }
                    //Create a Cart if they haven't had a cart yet
                    else {
                        cart = new Cart();
                        cart.setUser(user);
                        DAOFactory.getInstance().saveCart(cart);
                        session.removeAttribute("cart-list");
                        int n = cart.getListCart().size();
                        request.getSession().setAttribute("size",n);
                        request.getSession().setAttribute("data",cart.getListCart());
                        request.getSession().setAttribute("cart-list", cart);
                    }
                } else {
                    session.removeAttribute("cart-list");
                    showCartByCookie(request,response);
                }
                request.setAttribute("cartInfo", "Your cart is empty");
            }

        session.setMaxInactiveInterval(-1);
        return defaultURL;
    }
    private void showCartByCookie(HttpServletRequest request,
                            HttpServletResponse response) {

        Cookie[] arr = request.getCookies();
        List<Product> allPro = ProductDAO.selectProducts();
        String cartCookie = CookieUtil.getCookieValue(arr,"cart");
        Cart cart;
        String totalPrice;
        cart = new Cart(cartCookie,allPro);
        List<CartItem> itemList = cart.getListCart();
        int n;
            if(itemList!=null){
                n = itemList.size();
                request.getSession().setAttribute("size",n);
                request.getSession().setAttribute("data",itemList);
                request.getSession().setAttribute("cart-list", cart);
            }
            else{
                n = 0;
            }

    }
//---------------------------------------- CRUD Cart -----------------------------------------------------------
    private String addItem(HttpServletRequest request,
                           HttpServletResponse response) {
        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        String txt ="";
        final Object lock = request.getSession().getId().intern();
        //Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        Cart cart;
        double totalPrice = 0;
        synchronized (lock) {
            cart = (Cart) session.getAttribute("cart-list");
        }
        int productCode = Integer.parseInt(request.getParameter("productCode"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String size = request.getParameter("size");
        Product product = ProductDAO.selectProduct(productCode);
        int check = 0 ;

            if(!DAOFactory.getInstance().addToCart(product,quantity,cart,user)){
                updateCookie(request,response,cart);
            }
            totalPrice = DAOFactory.getInstance().getTotalPrice(cart);
            //Lấy dữ liệu cart cookie hiện tại và Xoá cart hiện tại trong cookie để thay bằng cái mới


        //xử lý đồng bộ hóa (thread-safe)
        synchronized (lock) {
            session.setAttribute("cart-list", cart);
            session.setAttribute("total", totalPrice);
        }


        session.setMaxInactiveInterval(-1);
        return "/Shopping.jsp";
    }

    private String updateItem(HttpServletRequest request,
                              HttpServletResponse response) {
        final Object lock = request.getSession().getId().intern();
        String quantityString = request.getParameter("quantity");
        int productCode = Integer.parseInt(request.getParameter("productCode"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart;
        double totalPrice;
        synchronized (lock) {
            cart = (Cart) session.getAttribute("cart-list");
            int quantity;
            try {
                quantity = Integer.parseInt(quantityString);
                if (quantity < 0) {
                    quantity = 1;
                }
            } catch (NumberFormatException ex) {
                quantity = 1;
            }
            Product product = ProductDAO.selectProduct(productCode);
            if (product != null && cart != null) {
                CartItem cartItem = new CartItem();
                cartItem.setProduct(product);
                cartItem.setQuantity(quantity);
                if (quantity > 0) {
                    cart.setListCart(DAOFactory.getInstance().addItem(cart.getListCart(),cartItem));
                    totalPrice = DAOFactory.getInstance().getTotalPrice(cart);
                    session.setAttribute("total", totalPrice);
                    log("total update: " + totalPrice);
                } else {
                    cart.setListCart(DAOFactory.getInstance().removeItem(cart.getListCart(), cartItem));
                }
            }

        }
        if (user!=null)
        {
            DAOFactory.getInstance().saveUpdateCart(cart);
        }else{
            updateCookie(request,response,cart);
        }
        session.setAttribute("cart-list", cart);
        session.setMaxInactiveInterval(-1);
        return defaultURL;
    }

    private String removeItem(HttpServletRequest request,
                              HttpServletResponse response) {
        final Object lock = request.getSession().getId().intern();
        HttpSession session = request.getSession();
        //Cart cart = (Cart) session.getAttribute("cart");
        Cart cart;
        double totalPrice;
        synchronized (lock) {
            cart = (Cart) session.getAttribute("cart-list");
        }
        int productCode = Integer.parseInt(request.getParameter("productCode"));
        Product product = ProductDAO.selectProduct(productCode);
        if (product != null && cart != null) {
            CartItem lineItem = new CartItem();
            lineItem.setProduct(product);
            cart.setListCart(DAOFactory.getInstance().removeItem(cart.getListCart(), lineItem));
            totalPrice = DAOFactory.getInstance().getTotalPrice(cart);
            request.getSession().setAttribute("total", totalPrice);
            User user = (User) session.getAttribute("user");
            if (user!=null)
            {
                DAOFactory.getInstance().saveUpdateCart(cart);
            }else{
                updateCookie(request,response,cart);
            }
            session.setAttribute("cart-list", cart);
            session.setAttribute("total", totalPrice);
        }

        session.setMaxInactiveInterval(-1);
        return "Cart/showCart";
    }
    private void updateCookie(HttpServletRequest request, HttpServletResponse response,Cart  cart) {


        Cookie[] cookies = request.getCookies();
        String txt ="";
        if(cookies!=null)
        {
            for (Cookie index : cookies){
                if (index.getName().equals("cart"))
                {
                    txt+=index.getValue();
                    index.setMaxAge(0);
                    response.addCookie(index);
                }
            }
        }
        List<CartItem> items = cart.getListCart();
        if(items.size()>0){
            txt = items.get(0).getProduct().getId().toString() + ":" +
                    items.get(0).getQuantity().toString();
            for(int i=1;i<items.size();i++)
            {
                txt+=","+items.get(i).getProduct().getId().toString() + ":" +
                        items.get(i).getQuantity().toString();
            }
        }
        else{
            txt="";
        }
        Cookie cookie = new Cookie("cart",txt.toString());
        cookie.setMaxAge(2*24*60*60);
        response.addCookie(cookie);
    }
}
