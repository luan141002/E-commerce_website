package com.example.demo3.controller;

import com.example.demo3.business.Account;
import com.example.demo3.business.User;
import com.example.demo3.data.AccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

import static com.example.demo3.data.AccountDAO.findAccount;


@WebServlet(urlPatterns={"/userLogin"})
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter())
        {
            //get data : request
            String email = request.getParameter("login-email"); // get email from the login page
            String password = request.getParameter("login-password");
            try {
                Account inuser = new Account(1, email, password);
                HttpSession session = request.getSession();
                if (findAccount(inuser)==true) {
                    session.setAttribute("auth", inuser);
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("Login.jsp");
                    out.println("user login failed");
                    log("sai roi ma");
                }

            }catch (Exception e){
                e.printStackTrace();
            }
            out.println(email+password);




        }
    }
}
