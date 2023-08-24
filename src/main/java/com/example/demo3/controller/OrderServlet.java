package com.example.demo3.controller;

import com.example.demo3.business.*;
import com.example.demo3.data.DAOFactory;
import com.example.demo3.data.OrderDAO;
import com.example.demo3.data.ProductDAO;
import com.example.demo3.data.UserDAO;
import com.example.demo3.orderState.Observer.keepTrackOrder;
import com.example.demo3.util.CSRFTokenUtil;
import com.example.demo3.util.CookieUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;


@WebServlet(name = "OrderServlet", urlPatterns = {"/Order/*"})
public class OrderServlet extends HttpServlet {
    private final String defaultURL = "/Checkout.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String url = defaultURL;
        if (requestURI.endsWith("/inCheck")) {
            url = getShippingInfo(request, response);
            log("vo r nha má");
        }

        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String url = "/";

            if (requestURI.endsWith("/getOrder")) {
                url = order(request, response);
                log("vo r nha má");
            }

        response.sendRedirect(url);
    }

    private void addCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie firstnameCookie = new Cookie("firstname", request.getParameter("firstName"));
        Cookie lastnameCookie = new Cookie("lastname", request.getParameter("lastName"));
        Cookie addressCookie = new Cookie("address", request.getParameter("address"));
        Cookie phonenumCookie = new Cookie("phonenum", request.getParameter("PhoneNumber"));
        firstnameCookie.setMaxAge(60 * 24 * 365 * 2 * 60);
        firstnameCookie.setPath("/");
        lastnameCookie.setMaxAge(60 * 24 * 365 * 2 * 60);
        lastnameCookie.setPath("/");
        addressCookie.setMaxAge(60 * 24 * 365 * 2 * 60);
        addressCookie.setPath("/");
        phonenumCookie.setMaxAge(60 * 24 * 365 * 2 * 60);
        phonenumCookie.setPath("/");
        response.addCookie(firstnameCookie);
        response.addCookie(lastnameCookie);
        response.addCookie(addressCookie);
        response.addCookie(phonenumCookie);
    }

    private String getShippingInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = "/Checkout.jsp";
        String txt = "";
        List<Product> allPro = ProductDAO.selectProducts();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) { //nếu user đã sign in
            Cookie[] cookies = request.getCookies();
            txt = CookieUtil.getCookieValue(cookies, "cart");
            Cart cart = new Cart(txt, allPro);
            session.setAttribute("cart", cart);

        } else {  // chưa sign in thì kiểm cookie
            url = "Login1.jsp";
        }
        return url;
    }

    private String order(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url="Login1.jsp";
        String txt = "";
        HttpSession session = request.getSession();
        //Get shipping Info
        String sessionToken = (String) session.getAttribute(CSRFTokenUtil.getCsrfTokenSessionAttrName());
        String requestToken = request.getParameter("csrfToken");


            String firstName = (String) request.getAttribute("checkout-firstname");
            String lastName = (String) request.getAttribute("checkout-lastname");
            String email = (String) request.getAttribute("checkout-email");
            String address = (String) request.getAttribute("checkout-address");
            String phone = (String) request.getAttribute("checkout-phone");

            User user = (User) session.getAttribute("user");

            ShippingInfo userShipIn = new ShippingInfo();
            userShipIn.setAddress(address);
            userShipIn.setShippingCost(0.0);
            userShipIn.setShippingType("fast");
            userShipIn.setShippingRegionId(2);


            if (user != null) { //nếu user đã sign in
                Cart cart = (Cart) session.getAttribute("cart-list");
                DAOFactory.getInstance().makeOrder(userShipIn, user, cart);
                log("đưuọc r nha má 1");
                url = "index.jsp";
            } else {  // chưa sign in thì kiểm cookie
                url = "Login1.jsp";
            }


        return url;
    }
}
