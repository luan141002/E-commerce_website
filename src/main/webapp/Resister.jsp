<%@ page import="com.example.demo3.business.Account" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/31/2023
  Time: 12:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    //Authentication access - session
    Account auth = (Account) request.getSession().getAttribute("auth");
    if (auth != null) {
        response.sendRedirect("index.jsp");// set for using in each page for navbar check and showing button
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Sign Up </title>
      <%@ include file="include/head.jsp" %>
  </head>
  <body>
  <%@ include file="include/navbar.jsp" %>
  <section class="vh-100" style="background-color: #eee;">
      <div class="container h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
              <div class="col-lg-12 col-xl-11">
                  <div class="card text-black" style="border-radius: 25px;">
                      <div class="card-body p-md-5">
                          <div class="row justify-content-center">
                              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                  <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                  <form class="mx-1 mx-md-4" action="signup" method="POST">

                                      <div class="d-flex flex-row align-items-center mb-4">
                                          <i class="fas fa-user fa-lg me-3 fa-fw mb-4 mr-2"></i>
                                          <div class="form-outline flex-fill mb-0">
                                              <input type="text" id="form3Example1c" class="form-control" name="regist-name"/>
                                              <label class="form-label" for="form3Example1c">Your Name</label>
                                          </div>
                                      </div>

                                      <div class="d-flex flex-row align-items-center mb-4">
                                          <i class="fas fa-envelope fa-lg me-3 fa-fw mb-4 mr-2"></i>
                                          <div class="form-outline flex-fill mb-0">
                                              <input type="email" id="form3Example3c" class="form-control" name="regist-email" required/>
                                              <label class="form-label" for="form3Example3c">Your Email</label>
                                          </div>
                                      </div>

                                      <div class="d-flex flex-row align-items-center mb-4">
                                          <i class="fas fa-lock fa-lg me-3 fa-fw mb-4 mr-2 "></i>
                                          <div class="form-outline flex-fill mb-0">
                                              <input type="password" id="form3Example4c" class="form-control" name="regist-password" required/>
                                              <label class="form-label" for="form3Example4c">Password</label>
                                          </div>
                                      </div>

                                      <div class="d-flex flex-row align-items-center mb-4">
                                          <i class="fas fa-key fa-lg me-3 fa-fw mb-4 mr-2"></i>
                                          <div class="form-outline flex-fill mb-0">
                                              <input type="password" id="form3Example4cd" class="form-control" name="regist-secondpassword" required/>
                                              <label class="form-label" for="form3Example4cd">Repeat your password</label>
                                          </div>
                                      </div>

                                      <div class="form-check d-flex justify-content-start mb-4 pb-3">
                                          <input class="form-check-input me-3" type="checkbox" value="" id="form2Example3c" />
                                          <label class="form-check-label " for="form2Example3c">
                                              I do accept the <a href="#!" class="text-body"><u>Terms and Conditions</u></a> of your
                                              site.
                                          </label>
                                      </div>

                                      <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                          <button type="submit" class="btn btn-primary btn-lg" >Register</button>
                                      </div>

                                  </form>

                              </div>
                              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                       class="img-fluid" alt="Sample image">

                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <%@ include file="include/foot.jsp" %>
  <%@ include file="include/footer.jsp" %>
  </body>
</html>
