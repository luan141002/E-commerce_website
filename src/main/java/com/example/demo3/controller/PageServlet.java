package com.example.demo3.controller;


import com.example.demo3.Iterator.filter.Filter;
import com.example.demo3.Iterator.productFilterIterator;
import com.example.demo3.business.Order;
import com.example.demo3.business.Product;
import com.example.demo3.business.User;
import com.example.demo3.data.*;
import com.example.demo3.Iterator.filter.*;
import com.example.demo3.util.CSRFTokenUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "PageServlet",urlPatterns={"/Page/*"})
public class PageServlet extends HttpServlet {
    private static final long serialVersionUID = 102831973239L;
    String defaultURL = "/Shopping.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String requestURI = request.getRequestURI();
            String url = defaultURL;
            if (requestURI.endsWith("/pageIndex")) {
                url = separatePage(request, response);
            }
            else if (requestURI.endsWith("/applyFilter")) {
                url = applyFilter(request, response);
            }
            else if (requestURI.endsWith("/checkOrder")) {
                url = getListOrder(request, response);
            }


            log("RequestURI: " + url);
        /*getServletContext()
                .getRequestDispatcher(url)
                .forward(request,response);*/
            response.sendRedirect(url);

    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String url = defaultURL;
        if (requestURI.endsWith("/pageIndex")) {
            url = separatePage(request, response);
        }
        else if (requestURI.endsWith("/applyFilter")) {
            url = applyFilter(request, response);
        }
        else if (requestURI.endsWith("/checkOrder")) {
            url = getListOrder(request, response);
        }
        else if (requestURI.endsWith("/updateUser")) {
            HttpSession session = request.getSession();
            String sessionToken = (String) session.getAttribute(CSRFTokenUtil.getCsrfTokenSessionAttrName());
            String requestToken = request.getParameter("csrfToken");
            if (sessionToken == null || !sessionToken.equals(requestToken)) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid CSRF token");
                return;
            }
            url = updateProfile(request, response);
        }


        log("RequestURI: " + url);
        /*getServletContext()
                .getRequestDispatcher(url)
                .forward(request,response);*/
        response.sendRedirect(url);
    }
    private String separatePage(HttpServletRequest request,
                                  HttpServletResponse response) {
        ProductDAO pd = new ProductDAO();
        HttpSession session = request.getSession();
        Iterator<Serializable> productIterator = pd.iterator();
        List<Product> lProPage = new ArrayList<>() ;
        String indexPS = request.getParameter("indexP");
        int startIndex = 0;
        if(indexPS != null) {
            startIndex = (Integer.parseInt(indexPS)-1)*8 ;

        }else{
            startIndex = 0;
        }
        //startIndex = Integer.parseInt(request.getParameter("indexP"));
        int endIndex = startIndex+8;
        int currentIndex = 0;
        while (productIterator.hasNext()) {
            Serializable data = productIterator.next();
            if (currentIndex >= startIndex && currentIndex < endIndex) {
                lProPage.add((Product)data);
            }
            currentIndex++;
        }
        session.setAttribute("indexPage",startIndex);
        session.setAttribute("lPropage",lProPage);

        return  "Shopping.jsp";
    }
    private String getListOrder(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user  = (User) session.getAttribute("user");
        List<Order> orderList = OrderDAO.selectOrder();
        System.out.println(orderList.get(0).getStatusMessage());
        List<Order> newOrderList = new ArrayList<>();
        for (Order order:orderList
             ) {
            if(order.getUser().getUserID()==user.getUserID())
            {
               newOrderList.add(order);
               order.getOrderDetail().getTotalCost();
            }
        }


        session.setAttribute("orderlist",newOrderList);
        return "/OrderList.jsp";
    }
    private String updateProfile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();


        User user  = (User) session.getAttribute("user");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String email = request.getParameter("email");
        int phone = Integer.parseInt(request.getParameter("phone"));
        String address = request.getParameter("address");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("newPassword2");

        String message = "confirm password doesn't match";

        user.setFirstName(fname);
        user.setLastName(lname);
        user.setUserPhone(phone);
        user.setUserAddress(address);
        System.out.println(newPassword);
        System.out.println(confirmPassword);
        if (newPassword.trim().equals(confirmPassword.trim())){
            user.getAccount().setPassword(newPassword);
        }
        /*else {
            session.setAttribute("message",message);
            return "/Profile.jsp";
        }*/
        DAOFactory.getInstance().updateUser(user);
        session.setAttribute("user",user);
        return "/Profile.jsp";
    }


    private String applyFilter(HttpServletRequest request,
                               HttpServletResponse response)
    {
        ProductDAO pd = new ProductDAO();
        String searchKey = null;
        HttpSession session = request.getSession();
        List<Product> lProPage = new ArrayList<>() ;
        //get parameters from session
        System.out.println(request.getParameter("category") +","+request.getParameter("cIndex")+","+request.getParameter("searchKey"));
        int indexCategory = Integer.parseInt(request.getParameter("category"));

        int cindex=0;
        if(request.getParameter("cIndex")!=null)
        {
            cindex = Integer.parseInt(request.getParameter("cIndex"));
        }
        else{
            cindex = 0;
        }
        searchKey = (String)request.getParameter("searchKey");

        String sIndex;
        if(searchKey!=null){
            sIndex = searchKey.trim();

        }else{
            sIndex = DAOFactory.getInstance().getCategory(cindex).trim();
        }
        //apply filter into the lProduct
        Filter filter;
        filter = DAOFactory.getInstance().getFilter(indexCategory);
        // create an iterator with the category filter

        Iterator<Product> iterator = new productFilterIterator(ProductDAO.selectProducts(),filter,sIndex);
        // iterate over the filtered products
        while (iterator.hasNext()) {
            Product product = iterator.next();
            lProPage.add(product);
            System.out.println(product.getProName());
        }
        session.setAttribute("lPropage",lProPage);



        return  "Shopping.jsp";
    }


}


