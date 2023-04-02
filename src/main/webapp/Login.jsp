<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/17/2023
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/16/2023
  Time: 1:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.demo3.business.*" %>
<%
  User auth = (User) request.getSession().getAttribute("auth");// set for using in each page for navbar check and showing button
  if (auth!=null)
  {
    response.sendRedirect("index.jsp");// if there are an available account , get back to the home page
  }
%>
<html>
<head>
  <title>Login Page</title>
  <%@ include file="include/head.jsp" %>
</head>
<body>
<%@ include file="include/navbar.jsp" %>
<div class="container">
  <div class="card w-50 mx-auto my-5">
    <!--name : card , width : 50 % , mx(margin-x) : auto , my(margin y) : 5px  -->
    <div class="card-header text-center">User Login</div>
    <div class="card-body">
      <form action="userLogin" method="POST"> <!--when click submit button it will transmit the infor and get to this path-->
        <div class="form-group">
          <label>Email Address</label>
          <input type="email" class="form-control" name="login-email" placeholder="Enter your email" required>
        </div>
        <div class="form-group">
          <label>Password</label>
          <input type="password" class="form-control" name="login-password" placeholder="Enter your password"
                 required>
        </div>
        <div class="text-center">
          <button type="submit" class="btn btn-primary">Login</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>

