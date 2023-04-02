
<%@ page import="com.example.demo3.business.Account" %>
<%@ page import="com.example.demo3.business.Product" %>
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
    int id = Integer.parseInt(request.getParameter("id"));

    ProductDAO pd = new ProductDAO();
    Product product = pd.selectProduct(id);

    List<Product> lproducts = pd.selectProductsindex(4); // Load product from database into this list product
%>
<html>
<head>
    <title>Shopping Page</title>
    <%@ include file="include/head.jsp" %>
    <link rel="stylesheet" href="style/main.css">
</head>
<body>
<%@ include file="include/navbar.jsp" %>

<section id="prodetails" class="section-p1">
    <div class="single-pro-image">
        <img src="image/img/products/<%=product.getProImage()%>" width="100%" id="MainImg" style="margin-bottom: 10px;">

        <div class="small-img-group">
            <div class="small-img-col">
                <img src="image/img/products/<%=product.getProImage()%>" width="100%" class="small-img">
            </div>
            <div class="small-img-col">
                <img src="image/img/products/<%=product.getProImage()%>" width="100%" class="small-img">
            </div>
            <div class="small-img-col">
                <img src="image/img/products/<%=product.getProImage()%>" width="100%" class="small-img">
            </div>
            <div class="small-img-col">
                <img src="image/img/products/<%=product.getProImage()%>" width="100%" class="small-img">
            </div>
        </div>
    </div>
        <div class="single-pro-details">
            <h6>Home / <%=product.getProCategory()%></h6>
            <h4><%=product.getProName()%></h4>
            <h2>$<%=product.getProPrice()%></h2>
            <select>
                <option>Select Size</option>
                <option>XL</option>
                <option>XXL</option>
                <option>Small</option>
                <option>Large</option>
            </select>
            <input type="number" value="1">
            <button class="normal">Add To Cart</button>
            <h4>Product Details</h4>
            <span><%=product.getProDes()%></span>
        </div>
</section>

<section id="product1" class="section-p1">
    <h2>Featured Products</h2>
    <p>Summer Collection New Modern Design</p>
    <div class="pro-container">
            <%
                if (!lproducts.isEmpty()) {
                    for (Product item : lproducts) {
            %>
            <div class="pro">
                <img src="image/img/products/<%=item.getProImage()%>" alt="" >
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
                <a href="#"><i class="fal fa-shopping-cart cart"></i></a>
            </div>
            <%}} else {
            }
            %>
    </div>
</section>

<script>
    var MainImg = document.getElementById("MainImg");
    var smalling = document.getElementsByClassName("small-img");

    smalling[0].onclick = function (){
        MainImg.src= smalling[0].src;
    }
    smalling[1].onclick = function (){
        MainImg.src= smalling[1].src;
    }
    smalling[2].onclick = function (){
        MainImg.src= smalling[2].src;
    }
    smalling[3].onclick = function (){
        MainImg.src= smalling[3].src;
    }
</script>
<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>
