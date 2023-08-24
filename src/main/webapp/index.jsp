

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page import="com.example.demo3.business.*" %>
<%@ page import="com.example.demo3.data.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.sun.activation.registries.LogSupport.log" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    //Authentication access - session
   Account auth = (Account)request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);// set for using in each page for navbar check and showing button
    }

    ProductDAO pd = new ProductDAO();
    List<Product> lproducts = pd.selectProductsindex(8); // Load product from database into this list product

    Cart cart_list = (Cart) session.getAttribute("cart-list");
    int index = 0;
    if (cart_list != null) {
        index =CartDAO.getCount(cart_list.getListCart());
    }
    else{
        log("đưuọc r hihi");
    }

%>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <%@ include file="include/head.jsp" %>
    <link rel="stylesheet" href="/style/main.css">
</head>
<body>
<%@ include file="include/navbar.jsp" %>

<section id="hero">
    <h4>Trade-in-offer</h4>
    <h2>Super value deals</h2>
    <h1>On all products</h1>
    <p>Save more with coupons & up to 1% off !</p>
    <form method="GET" action="Shopping.jsp">
        <button> Shop Now</button>
    </form>


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

<section id="product1" class="section-p1">
    <h2>New Arrivals</h2>
    <p>Summer Collection New Modern Design</p>


    <div class="pro-container" id="pro">
        <%
            if (!lproducts.isEmpty()) {
                for (Product item : lproducts) {
        %>
        <div class="pro" onclick="window.location.href='Product.jsp?id=<%=item.getId()%>';">
            <img src="image/img/products/<%=item.getProImage()%>" alt="" >
            <div class="des">
                <span><%=item.getProDes()%></span>
                <h5><%=item.getProName()%></h5>
                <div class="star">
                    <% for (int i = 0 ; i<item.getProRank();i++) {%>
                    <i class="fas fa-star"></i>
                    <%}%>
                </div>
                <h4>$<%=item.getProPrice()%></h4>
            </div>
            <form method="POST" action="/Cart/addItem">
                <input type="hidden" name="productCode" value="<%=item.getId()%>">
                <button type="submit"> <i class="fal fa-shopping-cart cart"></i></button>
            </form>
        </div>
        <%}} else {
            }
        %>
    </div>
</section>

<section id = "banner" class="section-m1">
    <h4>Repair Services</h4>
    <h2>Up to <span>70% Off</span> - All T-shirts & Accessories</h2>
    <button class="normal">Explore More</button>
</section>

<section id="sm-banner" class="section-p1">
    <div class="banner-box">
        <h4>crazy deals</h4>
        <h2>buy 1 get 1 free</h2>
        <span>The best classic dress is on sale at cart</span>
        <button class="white">Learn more</button>
    </div>
    <div class="banner-box banner-box2" >
        <h4>spring/summer</h4>
        <h2>upcoming season</h2>
        <span>The best classic dress is on sale at cart</span>
        <button class="white">Collection</button>
    </div>


</section>

<section id="banner3">
    <div class="banner-box" >
        <h2>SEASONAL SALE</h2>
        <h3>Winter Collection -50% OFF</h3>
    </div>
    <div class="banner-box banner-box2" >
        <h2>NEW FOOTWEAR COLLECTION</h2>
        <h3>Spring/Summer 2022</h3>
    </div>
    <div class="banner-box banner-box23" >
        <h2>T_SHIRTS</h2>
        <h3>New Trendy Prints</h3>
    </div>
</section>



<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>
