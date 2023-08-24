
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
    <section id="page-header" class="blog-header">
        <h2>#readmore</h2>
        <p>Read all the case studies about our products! </p>
    </section>

    <section id="blog">
        <div class="blog-box">
            <div class="blog-img">
                <img src="image/img/blog/b1.jpg">
            </div>
            <div class="blog-details">
                <h4>The Cotton-Jersey Zip-Up Hoodie</h4>
                <p>Kickstarter man braid godard coloring book. Raclette waistcoat selfies yr
                    wolf chartreuse hexagon irony, godard…</p>
                <a href="#">CONTINUE READING</a>
            </div>
            <h1>13/01</h1>
        </div>
        <div class="blog-box">
            <div class="blog-img">
                <img src="image/img/blog/b2.jpg">
            </div>
            <div class="blog-details">
                <h4>The Cotton-Jersey Zip-Up Hoodie</h4>
                <p>Kickstarter man braid godard coloring book. Raclette waistcoat selfies yr
                    wolf chartreuse hexagon irony, godard…</p>
                <a href="#">CONTINUE READING</a>
            </div>
            <h1>13/01</h1>
        </div>
        <div class="blog-box">
            <div class="blog-img">
                <img src="image/img/blog/b3.jpg">
            </div>
            <div class="blog-details">
                <h4>The Cotton-Jersey Zip-Up Hoodie</h4>
                <p>Kickstarter man braid godard coloring book. Raclette waistcoat selfies yr
                    wolf chartreuse hexagon irony, godard…</p>
                <a href="#">CONTINUE READING</a>
            </div>
            <h1>13/01</h1>
        </div>
        <div class="blog-box">
            <div class="blog-img">
                <img src="image/img/blog/b4.jpg">
            </div>
            <div class="blog-details">
                <h4>The Cotton-Jersey Zip-Up Hoodie</h4>
                <p>Kickstarter man braid godard coloring book. Raclette waistcoat selfies yr
                    wolf chartreuse hexagon irony, godard…</p>
                <a href="#">CONTINUE READING</a>
            </div>
            <h1>13/01</h1>
        </div>
        <div class="blog-box">
            <div class="blog-img">
                <img src="image/img/blog/b5.jpg">
            </div>
            <div class="blog-details">
                <h4>The Cotton-Jersey Zip-Up Hoodie</h4>
                <p>Kickstarter man braid godard coloring book. Raclette waistcoat selfies yr
                    wolf chartreuse hexagon irony, godard…</p>
                <a href="#">CONTINUE READING</a>
            </div>
            <h1>13/01</h1>
        </div>
    </section>

    <section id="pagination" class="section-p1">
        <a href="#" >1</a>
        <a href="#" >2</a>
        <a href="#"><i class="fal fa-long-arrow-alt-right"></i></a>
    </section>

    <%@ include file="include/foot.jsp" %>
    <%@ include file="include/footer.jsp" %>
</body>
</html>
