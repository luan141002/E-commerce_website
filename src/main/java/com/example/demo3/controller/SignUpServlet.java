package com.example.demo3.controller;

import com.example.demo3.business.Account;
import com.example.demo3.data.AccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import static com.example.demo3.data.AccountDAO.findAccount;
import static com.example.demo3.data.AccountDAO.insert;

@WebServlet(urlPatterns={"/signup"})
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //get data : request
            String name = request.getParameter("name-email");
            String email = request.getParameter("regist-email");
            String password = request.getParameter("regist-password");
            String secondpassword = request.getParameter("regist-secondpassword");

            try {
                if (email!= null && password!= null) {
                    if (password.equals(secondpassword)) {
                        Account inuser = new Account(email, password);
                        AccountDAO.insert(inuser); // singleton
                        response.sendRedirect("Login1.jsp");
                    } else {
                        response.sendRedirect("Register.jsp");
                    }
                }
            }catch (Exception e) {
                    e.printStackTrace();
                }




            out.println(email + password);


        }
    }
}
