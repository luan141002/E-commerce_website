
<%@ page import="com.example.demo3.business.Account" %>
<%@ page import="com.example.demo3.business.Cart" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/17/2023
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Shopping Page</title>
  <%@ include file="include/head.jsp" %>
  <link rel="stylesheet" href="style/main1.css">
</head>

<body>
<%@ include file="include/navbar.jsp" %>
<section id="page-header" class="about-header">
  <h2>#KnowUs</h2>
  <p>Read all the case studies about our products! </p>
</section>

<section id="about-head" class="section-p1">
  <img src="image/img/about/a6.jpg">
  <div>
    <h2>Who We Are?</h2>
    <p>textttttttttttttttttttttttttttttttdawawd</p>
    <abbr tittle="">Create stunning images with as much or as little control as you Ike
      Thanks to a choice of Basic and Creative modes.</abbr>

    <br><br>
    <marquee bgcolor="#ccc" loop="-1" scrollamount="5" width="100%">Create stunning images with as
      much or as like thanks to a choice of Basic and Creative modes</marquee>


  </div>
</section>

<section id="about-app" class="section-p1">
  <h1>Download Our <a href="#">App</a> </h1>
  <div class="video">
      <video autoplay muted loop src="image/img/about/1.mp4"></video>
  </div>
</section>

<section id="feature" class="section-p1">
  <div class="fe-box">
    <img src="image/img/features/f1.png" alt="">
    <h6>Free Shipping</h6>
  </div>
  <div class="fe-box">
    <img src="image/img/features/f2.png" alt="">
    <h6>Online Order</h6>
  </div>
  <div class="fe-box">
    <img src="image/img/features/f3.png" alt="">
    <h6>Save Money</h6>
  </div>
  <div class="fe-box">
    <img src="image/img/features/f4.png" alt="">
    <h6>Promotions</h6>
  </div>
  <div class="fe-box">
    <img src="image/img/features/f5.png" alt="">
    <h6>Happy Sell</h6>
  </div>
  <div class="fe-box">
    <img src="image/img/features/f6.png" alt="">
    <h6>24/7 Support</h6>
  </div>
</section>

<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>
