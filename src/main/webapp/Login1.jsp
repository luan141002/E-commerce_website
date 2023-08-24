<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/31/2023
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.demo3.business.*" %>
<%@ page import="static com.sun.activation.registries.LogSupport.log" %>
<%
 Account auth = (Account) request.getSession().getAttribute("auth");// set for using in each page for navbar check and showing button
  if (auth!=null)
  {
    response.sendRedirect("index.jsp");// if there are an available account , get back to the home page
  }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login Page</title>
  <%@ include file="include/head.jsp" %>
</head>
<body>
<section class="vh-100" >
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
             class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form action="Account/signIn" method="POST">
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
            <p class="lead fw-normal mb-0 me-3">Sign in with </p>
            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1" >
             <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/LoginGoogleHandler&response_type=code
		   &client_id=1083869313429-bqpl8o1nns8vumhm4u53l5lt9033qgg1.apps.googleusercontent.com&approval_prompt=force"><i class="fab fa-google-plus"></i></a>
            </button>
          </div>

          <div class="divider d-flex align-items-center my-2">
            <p class="text-center fw-bold mx-3 mb-0">Or</p>
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="email" id="form3Example3" class="form-control form-control-lg"
                   name="login-email"      placeholder="Enter a valid email address" value="${username}" />
            <label class="form-label" for="form3Example3">Email address</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <input type="password" id="form3Example4" class="form-control form-control-lg"
                   name="login-password"  placeholder="Enter password"  value="${password}"/>
            <label class="form-label" for="form3Example4">Password</label>
          </div>

          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox"  id="form2Example3" name="rememberme"/>
              <label class="form-check-label" for="form2Example3">
                Remember me
              </label>
            </div>
            <div class="forgot float-right" >
              <a href="forgotPass.jsp" >Forgot Password?</a>
            </div>
            <!-- Forgot Password Form Start -->

            <!-- Forgot Password Form End -->
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-primary btn-lg"
                    style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="Resister.jsp"
                                                                              class="link-danger">Register</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>

</section>
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        <a class="btn btn-primary" href="login.html">Logout</a>
      </div>
    </div>
  </div>
</div>

<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>
