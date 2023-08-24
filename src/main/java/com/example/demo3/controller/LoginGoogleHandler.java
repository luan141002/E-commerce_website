package com.example.demo3.controller;

import com.example.demo3.business.Account;
import com.example.demo3.business.Constants;
import com.example.demo3.business.GoogleUser;
import com.example.demo3.business.User;
import com.example.demo3.data.AccountDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import java.io.PrintWriter;

import java.io.IOException;

@WebServlet(name = "LoginGoogleHandler", value = "/LoginGoogleHandler")
public class LoginGoogleHandler extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        GoogleUser user = getUserInfo(accessToken);
        System.out.println(user.toString());
        AccountDAO ad = new AccountDAO();


        Account inUser = ad.findAccountByUsername(user.getEmail().toString());
        HttpSession session = request.getSession();
        if (inUser != null)
        {
            session.setAttribute("auth", inUser);
            response.sendRedirect("index.jsp");
        }
        else{
            response.sendRedirect("Login.jsp");
            log("sai roi ma");
        }
        System.out.println(user);
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleUser getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        GoogleUser googlePojo = new Gson().fromJson(response, GoogleUser.class);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
