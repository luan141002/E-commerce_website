<%@ page import="com.example.demo3.business.*" %>
<%@ page import="com.example.demo3.data.ProductDAO" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/17/2023
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //Authentication access - session
    Account auth = (Account) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);// set for using in each page for navbar check and showing button
    }
    ProductDAO pd = new ProductDAO();
    List<Product> lproducts = pd.selectProducts(); // Load product from database into this list product
%>
<html>
<head>
    <title>Shopping Page</title>
    <%@ include file="include/head.jsp" %>
    <link rel="stylesheet" href="style/main.css">
</head>
<body>
<%@ include file="include/navbar.jsp" %>
<section id="page-header">
    <h2>#stayhome</h2>
    <p>Save more with coupons & up to 1% off !</p>
</section>
<section id="product1" class="section-p1">
    <div class="pro-container">
        <%
            if (!lproducts.isEmpty()) {
                for (Product item : lproducts) {
        %>
        <div class="pro" onclick="window.location.href='Product.jsp?id=<%=item.getId()%>';">
            <img src="image/img/products/<%=item.getProImage()%>" alt="">
            <div class="des">
                <span><%=item.getProDes()%></span>
                <h5><%=item.getProName()%></h5>
                <div class="star">
                    <% for (int i = 0 ; i<item.getProRank();i++) {%>
                    <i class="fas fa-star"></i>
                    <%}%>
                </div>
                <h4><%=item.getProPrice()%></h4>
            </div>
            <a href="Product.jsp"><i class="fal fa-shopping-cart cart"></i></a>
        </div>
        <%}} else {
        }
        %>
    </div>
</section>
<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>
