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
  <h2>#let's_talk</h2>
  <p>LEAVE A MESSAGE, We love to hear from you!</p>
</section>

<section id="contact-details" class="section-p1">
  <div class="details">
    <span>GET IN TOUCH</span>
    <h2>Visit one of our agency locations or contact us today</h2>
    <h3>Head Office</h3>
    <div>
      <li>
        <i class="fal fa-map"></i>
        <p> 1 Vo Van Ngan Street, Thu Duc city</p>
      </li>
      <li>
        <i class="far fa-envelope"></i>
        <p> contact@example.com</p>
      </li>
      <li>
        <i class="fas fa-phone-alt"></i>
        <p> ontact@example.com</p>
      </li>
      <li>
        <i class="far fa-clock"></i>
        <p> Monday to Saturday: 8.00am to 16.pm</p>
      </li>
    </div>
  </div>
  <div class="map">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.485398611108!2d106.7693381752895!3d10.850637657819997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752763f23816ab%3A0x282f711441b6916f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgcGjhuqFtIEvhu7kgdGh14bqtdCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2sus!4v1682590664628!5m2!1svi!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
  </div>
</section>

<section id="form-details">
  <form action="">
    <span>LEAVE A MESSAGE</span>
    <h2>We love to hear from you</h2>
    <input type="text" placeholder="Your Name">
    <input type="text" placeholder="E-mail">
    <input type="text" placeholder="Subject">
    <textarea name="" id="" cols="30" rows="10" placeholder="Your Messagek" ></textarea>
    <button class="normal">Submit</button>
  </form>

  <div class="people">
    <div>
      <img src="image/img/people/1.png">
      <p><span>Phan Thanh Luan</span> Developer <br> Phone: +090 111 1111 <br> Email: contact@example.com</p>
    </div>
    <div>
      <img src="image/img/people/2.png">
      <p><span>Huynh Dang Khoa</span> Developer <br> Phone: +090 222 222 <br> Email: contact@example.com</p>
    </div>
    <div>
      <img src="image/img/people/3.png">
      <p><span>Vo Minh Hung</span> Developer <br> Phone: +090 3333 333 <br> Email: contact@example.com</p>
    </div>

  </div>

</section>


<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>
