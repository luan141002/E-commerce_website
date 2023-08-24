package com.example.demo3.controller;

import com.example.demo3.business.*;
import com.example.demo3.data.*;

import com.example.demo3.util.CSRFTokenUtil;
import com.example.demo3.util.CookieUtil;



import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import javax.servlet.http.Cookie;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import static com.example.demo3.data.UserDAO.*;
import static java.lang.System.in;
import static java.lang.System.out;



@WebServlet(name = "AccountServlet",urlPatterns={"/Account/*"})
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 102831973239L;
    String defaultURL = "/Login1.jsp";
    /* #############################################################
    # Nhân quả không nợ chúng ta thứ gì, cho nên xin đừng oán giận #
    #                            _                                 #
    #                         _ooOoo_                              #
    #                        o8888888o                             #
    #                        88" . "88                             #
    #                        (| -_- |)                             #
    #                        O\  =  /O                             #
    #                    ____ /'---'\____                          #
    #                   '  \\|       |// '                         #
    #                  '                  '                        #
    #                 /   \\|||  :  |||//  \                       #
    #                /   _||||| -:- |||||_  \                      #
    #                |    | \\\  -  /// |   |                      #
    #                |  \_| '\' --- '/' |   |                      #
    #                \   .-\_ '- . -' _/-.  /                      #
    #               ___'. .' / --.--\  ', ,'___                    #
    #            .""/ <  '.___\_<|>_/___.' _> \"".                 #
    #           | | :  '- \'. ;'. _/; .'/ /  .' ; |                #
    #           \  \ '-.   \_\_'. _.'_/_/  -' _.' /                #
    #============'-.'.__'-. \ \___   /__.-'_.'_.-'=================#
                               '-=--'
    Đức Phật nơi đây phù hộ code con chạy không Bug. Nam mô a di đà phật
                            _.-/`)
                           // / / )
                        .=// / / / )
                       // / / / / /
                      ||         /
                       \\       /
                        ))    .'
                       //    /
                            / */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String url = defaultURL;
        if (requestURI.endsWith("/signInWithCookie")) {
            url = signInWithCookie(request, response);
        }

        log("RequestURI: " + url);
        /*getServletContext()
                .getRequestDispatcher(url)
                .forward(request,response);*/
        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter())
        {
            //Lấy dữ liệu và xử lý dữ liệu
            String url = defaultURL;
            String message = "";
            String requestURI = request.getRequestURI();//Chỉ lấy 1 2 phần cuối của path
            String email = request.getParameter("login-email"); // get email from the login page
            String password = request.getParameter("login-password");
            String action = request.getParameter("action");
            String remember = request.getParameter("rememberme"); //for cookie
            log("Remember: " + remember);
            //phải xử lý như vầy chứ ko xử lý remember.Equals("on") được vì có thể remember sẽ bị null
            if (remember == null) {
                remember = "No";
            } else {
                remember = "Yes";
            }
            log("Remember: " + remember);


            try {
                if(requestURI.endsWith("/signUp")){
                    //nếu 2 pass trùng nhau mới tạo account và user
                    if (CheckEmail(request, response)) {
                        message = "Email Existed!";
                    } else if (Checkpass(request, response)) {
                        url = SignUp(request, response);
                        message = "Account Create Successfully!";
                    } else {//load lại trang đăng nhập sử dụng EL và yêu cầu nhập lại pass
                        url = ReInputPass(request, response);
                        message = "Password Not Persistence! Please Try Again!";
                    }
                } else if (requestURI.endsWith("/signIn")) {
                    if (CheckAccount(request, response)) {
                        if (remember == "Yes") {
                            //tạo cookie lưu  thông tin đăng nhập
                            addCookie(request, response);
                        }
                        message = "Welcome " + request.getParameter("username");
                        url = "/index.jsp";
                    } else {
                        message = "password or username incorrect!";
                        url = "/Login1.jsp";
                    }
                }else if (requestURI.endsWith("/signInForCheckOut")) {
                    if (CheckAccount(request, response)) {
                        if (remember == "Yes") {
                            //tạo cookie lưu  thông tin đăng nhập va email
                            addCookie(request, response);
                        }
                        message = "Welcome " + request.getParameter("username");
                        url = inCheckCookie(request, response);
                    } else {
                        message = "password or username incorrect!";
                        url = "/checkoutvalidation.jsp";
                    }
                } else if (requestURI.endsWith("/signUpForCheckOut")) {
                    //nếu 2 pass trùng nhau mới tạo account và user
                    if (CheckEmail(request, response)) {
                        message = "Email Existed!";
                    } else if (Checkpass(request, response)) {
                        url = SignUpForCheckOut(request, response);
                        message = "Account Create Successfully!";
                    } else {//load lại trang đăng nhập sử dụng EL và yêu cầu nhập lại pass
                        url = ReInputPassForCheckOut(request, response);
                        message = "Password Not Persistence! Please Try Again!";
                    }
                } else if (requestURI.endsWith("/forgotPass")) {
                        url ="EnterOtp.jsp";
                        url=ForgotPassword(request,response);
                        message = "Password Not Persistence! Please Try Again!";
                }else if (requestURI.endsWith("/retypePass")) {
                    url=RetypePassword(request,response);
                    message = "Password Not Persistence! Please Try Again!";
                }
            }catch (Exception e){
                e.printStackTrace();
            }
            out.println(email+password);
           /*getServletContext()
                    .getRequestDispatcher(url)
                    .forward(request, response);*/
            response.sendRedirect(url);
        }

    }


    //Checkout cart


    private String SignUpForCheckOut(HttpServletRequest request,
                                     HttpServletResponse response) throws IOException {
        // get parameters from the request
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        // store data in User object and save User and Account object in database
        Account account = new Account(username, pass);
        DAOFactory.getInstance().addAccount(account);
        //User user = new User();
        //user.setAccount(account);
        //user.setUserName(email);
        //UserDAO.insert(user);

        // set account object in request object and set URL
        HttpSession session = request.getSession();
        //session.setAttribute("user", user);

        return "/nav/checkoutvalidation.jsp";
    }

    private String SignUp(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        String url = defaultURL;
        int type =1;
        String username = request.getParameter("regist-name");
        String email = request.getParameter("regist-email");
        String password = request.getParameter("regist-password");
        String secondpassword = request.getParameter("regist-secondpassword");
        User user = new User() ;
        try {
            if (email!= null && password!= null) {
                if (Checkpass(request, response)) {
                    Account inuser = new Account(email, password);
                    DAOFactory.getInstance().addAccount(inuser); // singleton
                    user.setAccount(inuser);
                    user.setEmail(email);
                    user.setFirstName(username);
                    DAOFactory.getInstance().addUser(user);

                    url ="Login1.jsp";
                } else {
                    url ="Register.jsp";
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        out.println(email + password);

        return url;
    }

    private String ReInputPassForCheckOut(HttpServletRequest request,
                                          HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("email", email);
        return "/checkoutvalidation.jsp";
    }
    private String ReInputPass(HttpServletRequest request,
                               HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("email", email);
        return defaultURL;
    }
    //account ton tai => set email va user len session
    private Boolean CheckAccount(HttpServletRequest request,
                                 HttpServletResponse response) throws IOException {
        // get parameters from the request
        String username = request.getParameter("login-email");
        String pass = request.getParameter("login-password");
        Account account = new Account(username, pass);
        //kiểm tra tài khoản tồn tại
        if (AccountDAO.findAccount(account)) {
            HttpSession session = request.getSession();
            account = AccountDAO.findAccountByUsername(username.trim());
            session.setAttribute("auth",account);
            User user = null;
            user = UserDAO.selectUser(username.trim());
            int index = 0;


            CSRFTokenUtil.getCSRFTokens().generateCSRFToken(session);
            //get mail de phuc vu cho cookie va checkout
            session.setAttribute("useremail",account.getUsername());
            session.setAttribute("username",account.getUsername());
            session.setAttribute("password",account.getPassword());
            session.setAttribute("user", user);
            return true;
        }
        return false;
    }
    // Add cookie to the user storage
    private void addCookie(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        // set biến cookie
        //Cookie emailCookie = new Cookie("emailCookie", session.getAttribute("username").toString());
        Cookie usernameCookie = new Cookie("username", request.getParameter("login-email").toString());
        Cookie passCookie = new Cookie("password", request.getParameter("login-password").toString());
        //Set thời gian tồn tại của cookie
        passCookie.setMaxAge(60 * 24 * 365 * 2 * 60);
        passCookie.setPath("/");
        usernameCookie.setMaxAge(60 * 24 * 365 * 2 * 60);
        usernameCookie.setPath("/");

        response.addCookie(usernameCookie);
        response.addCookie(passCookie);
    }
    // đảng nhập với cookie đã đăng nhập lần trước
    private String signInWithCookie(HttpServletRequest request, HttpServletResponse response) {
        String url = defaultURL;
        List<Product> allPro = ProductDAO.selectProducts();

        Cookie[] cookies = request.getCookies();
        String username = CookieUtil.getCookieValue(cookies, "username");
        String password = CookieUtil.getCookieValue(cookies, "password");

        request.getSession().setAttribute("username", username);
        request.getSession().setAttribute("password", password);

        return url;
    }
    // Double check password for create account
    private boolean Checkpass(HttpServletRequest request,
                              HttpServletResponse response) throws IOException {
        String pass = request.getParameter("regist-password");
        String repass = request.getParameter("regist-secondpassword");
        return pass.trim().equals(repass.trim());
    }
    private Boolean CheckEmail(HttpServletRequest request,
                               HttpServletResponse response) throws IOException {
        // get parameters from the request

        String email = request.getParameter("email");
        //kiểm tra email tồn tại chưa để chp phép tạo tk
        //findemail(email)
        /*if (findemail(email)) {
            return false;
        }
        return true;*/
        return false;
    }
    private String inCheckCookie(HttpServletRequest request,
                                 HttpServletResponse response) {
        String url = "/checkout.jsp";
        Cookie[] cookies = request.getCookies();

        String firstname = CookieUtil.getCookieValue(cookies, "firstname");
        String lastname = CookieUtil.getCookieValue(cookies, "lastname");
        String address = CookieUtil.getCookieValue(cookies, "address");
        String phonenum = CookieUtil.getCookieValue(cookies, "phonenum");

        request.setAttribute("firstname", firstname);
        request.setAttribute("lastname", lastname);
        request.setAttribute("address", address);
        request.setAttribute("phonenum", phonenum);

        return url;

    }
    private String ForgotPassword(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException {
        String url = null;
        String email = request.getParameter("email-check");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        String link = "<html><body><p>Click the button below to visit our website:</p><p><a href=\"http://localhost:8080/newPassword.jsp?email="+email+"\"><button style=\"background-color:#008CBA; border-radius:4px; color:#ffffff; padding:12px 18px; text-align:center; text-decoration:none; display:inline-block;\">Visit website</button></a></p></body></html>";
        HttpSession mySession = request.getSession();

        if(email!=null || !email.equals("")) {
            // sending otp
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);
            // Assuming you are sending email from through gmails smtp
            String host = "smtp.gmail.com";

            String to = email;// change accordingly
            // Get the session object
            Properties properties = System.getProperties();
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", "465");
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.auth", "true");
            Session session = Session.getInstance(properties, new Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("phanthanhluan553@gmail.com", "djcmbbcsyrarewwo");
                        }
                    });
                    // compose message

            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("phanthanhluan553@gmail.com"));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                message.setContent(link,"text/html");
                /*message.setSubject("Hello");
                message.setText("your OTP is: " + otpvalue);*/
                // send message
                Transport.send(message);
                System.out.println("message sent successfully"+email);
            }

            catch (MessagingException e) {
                e.printStackTrace();
            }
            url ="EnterOtp.jsp";
            request.setAttribute("message","OTP is sent to your email id");
            //request.setAttribute("connection", con);
            mySession.setAttribute("otp","otpvalue");
            mySession.setAttribute("email-check",email);

            //request.setAttribute("status", "success");
        }

        return "/EnterOtp.jsp";
    }
    private String RetypePassword(HttpServletRequest request,
                               HttpServletResponse response) throws IOException
    {
        String url = defaultURL;
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute ("email-check");
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword != null && confPassword != null && newPassword.trim().equals(confPassword.trim())) {

            try {
                Account oldAccount = AccountDAO.findAccountByUsername(email.trim());
                Account newAccount = new Account(oldAccount.getId(),email.trim(),newPassword);
                AccountDAO.update(newAccount);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return url;
    }
}
