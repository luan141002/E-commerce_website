<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
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
    List<Product> lproducts = ProductDAO.selectProducts(); // Load product from database into this list product
    Cart cart_list = (Cart) session.getAttribute("cart-list");
    int totalPage = lproducts.size()/8 ;
    ShippingInfo ship = new ShippingInfo();
    int index = 0;
    if (cart_list != null) {
        index = CartDAO.getCount(cart_list.getListCart());
    }
    int indexPage = (Integer)session.getAttribute("indexPage");
%>
<html>
<head>
    <title>Shopping Page</title>
    <%@ include file="include/head.jsp" %>
    <link rel="stylesheet" href="style/main.css">

</head>
<body>
<%@ include file="include/navbar.jsp" %>
<section id="page-header" style="margin-bottom: 20px">
    <h2>#stayhome</h2>
    <p>Save more with coupons & up to 1% off !</p>
</section>
<div class="container-fluid ml-0">
    <div class="row">
        <aside class="col-md-2" >
            <div class="card filter-content">
                <article class="filter-group">
                    <header class="card-header">
                        <a href="#" data-toggle="collapse" data-target="#collapse_1" aria-expanded="true" class="">
                            <%--<i class="icon-control fa fa-chevron-down"></i>--%>
                            <h6 class="title" style="color: #088178;">Product type</h6>
                        </a>
                    </header>
                    <div class="filter-content collapse show" id="collapse_1" style="">
                        <div class="card-body">
                            <form class="pb-3" action="/Page/applyFilter" method="GET">
                                <div class="input-group">
                                        <input type="text" class="form-control" name="searchKey" placeholder="Search">
                                        <input type="hidden" name="category" value="3">
                                        <div class="input-group-append">
                                            <button class="btn btn-light" type="submit"><i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                </div>
                            </form>
                            <ul class="list-menu title" style="padding-left: 0;">
                                <li style="list-style: none;color: #088178!important; "><a href="/Page/applyFilter?category=1&cIndex=1" >TOP</a></li>
                                <li style="list-style: none;color: #088178!important;" ><a href="/Page/applyFilter?category=1&cIndex=3" >BAG</a></li>
                                <li style="list-style: none;color: #088178!important;"><a href="/Page/applyFilter?category=1&cIndex=2" >BOTTOM</a></li>
                                <li style="list-style: none;color: #088178!important;" ><a href="/Page/applyFilter?category=1&cIndex=4" >SNEAKER</a></li>
                            </ul>
                        </div> <!-- card-body.// -->
                    </div>
                </article> <!-- filter-group  .// -->
                <article class="filter-group">
                    <header class="card-header">
                        <a href="#" data-toggle="collapse" data-target="#collapse_2" aria-expanded="true" class="">
                            <%--<i class="icon-control fa fa-chevron-down"></i>--%>
                            <h6 class="title" style="color: #088178;">Brands </h6>
                        </a>
                    </header>
                    <div class="filter-content collapse show" data- id="collapse_2" style="">
                        <div class="card-body">
                            <label onclick="window.location.href='/Page/applyFilter?category=2&cIndex=5';" class="custom-control custom-checkbox"  >
                                <input type="checkbox" name="adidas" id="adidas" class="custom-control-input">
                                <div class="custom-control-label">Adidas
                                    <b class="badge badge-pill badge-light float-right">120</b></div>
                            </label>
                            <label onclick="window.location.href='/Page/applyFilter?category=2&cIndex=6';" class="custom-control custom-checkbox">
                                <input type="checkbox" name="nike" id="nike" class="custom-control-input">
                                <div class="custom-control-label">Nike
                                    <b class="badge badge-pill badge-light float-right">15</b></div>
                            </label>
                            <label onclick="window.location.href='/Page/applyFilter?category=3&cIndex=3';"class="custom-control custom-checkbox">
                                <input type="checkbox"  class="custom-control-input">
                                <div class="custom-control-label">Uniqlo
                                    <b class="badge badge-pill badge-light float-right">35</b></div>
                            </label>
                            <label onclick="window.location.href='/Page/applyFilter?category=3&cIndex=4';" class="custom-control custom-checkbox">
                                <input type="checkbox"  class="custom-control-input">
                                <div class="custom-control-label">Zara
                                    <b class="badge badge-pill badge-light float-right">89</b></div>
                            </label>
                            <label onclick="window.location.href='/Page/applyFilter?category=3&cIndex=5';" class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input">
                                <div class="custom-control-label">Reebok
                                    <b class="badge badge-pill badge-light float-right">30</b></div>
                            </label>
                        </div> <!-- card-body.// -->
                    </div>
                </article> <!-- filter-group .// -->
                <article class="filter-group">
                    <header class="card-header">
                        <a href="#" data-toggle="collapse" data-target="#collapse_3" aria-expanded="true" class="">
                            <%--<i class="icon-control fa fa-chevron-down"></i>--%>
                            <h6 class="title" style="color: #088178;">Price range </h6>
                        </a>
                    </header>
                    <div class="filter-content collapse show" id="collapse_3" style="">
                        <div class="card-body">
                            <input type="range" id="pi_input" style="tint-color: #088178!important;" class="custom-range" min="0" max="2000" step="any" name="">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Min</label>
                                    <input class="form-control" placeholder="$0" type="number">
                                </div>
                                <div class="form-group text-right col-md-6">
                                    <label>Max</label>
                                    <input class="form-control" id="value" placeholder="$1,0000" type="number">
                                </div>
                            </div> <!-- form-row.// -->
                            <button class="btn btn-block normal" style="background: #088178;color: white;">Apply</button>
                        </div><!-- card-body.// -->
                    </div>
                </article> <!-- filter-group .// -->
                <article class="filter-group">
                    <header class="card-header">
                        <a href="#" data-toggle="collapse" data-target="#collapse_4" aria-expanded="true" class="">
                           <%-- <i class="icon-control fa fa-chevron-down"></i>--%>
                            <h6 class="title" style="color: #088178;">Sizes </h6>
                        </a>
                    </header>
                    <div class="filter-content collapse show" id="collapse_4" style="">
                        <div class="card-body">
                            <label class="checkbox-btn">
                                <input type="checkbox">
                                <span class="btn btn-light"> XS </span>
                            </label>

                            <label class="checkbox-btn">
                                <input type="checkbox">
                                <span class="btn btn-light"> SM </span>
                            </label>

                            <label class="checkbox-btn">
                                <input type="checkbox">
                                <span class="btn btn-light"> LG </span>
                            </label>

                            <label class="checkbox-btn">
                                <input type="checkbox">
                                <span class="btn btn-light"> XXL </span>
                            </label>
                        </div><!-- card-body.// -->
                    </div>
                </article> <!-- filter-group .// -->
                <article class="filter-group">
                    <header class="card-header">
                        <a href="#" data-toggle="collapse" data-target="#collapse_5" aria-expanded="false" class="">
                            <%--<i class="icon-control fa fa-chevron-down"></i>--%>
                            <h6 class="title" style="color: #088178;">More filter </h6>
                        </a>
                    </header>
                    <div class="filter-content collapse in" id="collapse_5" style="">
                        <div class="card-body">
                            <label class="custom-control custom-radio">
                                <input type="radio" name="myfilter_radio" checked="" class="custom-control-input">
                                <div class="custom-control-label">Sale</div>
                            </label>

                            <label class="custom-control custom-radio">
                                <input type="radio" name="myfilter_radio" class="custom-control-input">
                                <div class="custom-control-label">Brand new</div>
                            </label>

                            <label class="custom-control custom-radio">
                                <input type="radio" name="myfilter_radio" class="custom-control-input">
                                <div class="custom-control-label">Used items</div>
                            </label>

                            <label class="custom-control custom-radio">
                                <input type="radio" name="myfilter_radio" class="custom-control-input">
                                <div class="custom-control-label">Very old</div>
                            </label>
                        </div><!-- card-body.// -->
                    </div>
                </article> <!-- filter-group .// -->
            </div> <!-- card.// -->

        </aside>
        <main class="col-md-10">
            <header class="border-bottom mb-4 pb-1">
                <div class="form-inline">
                    <span class="mr-md-auto">32 Items found </span>
                    <select class="mr-2 form-control">
                        <option>Latest items</option>
                        <option>Trending</option>
                        <option>Most Popular</option>
                        <option>Cheapest</option>
                    </select>
                    <div class="btn-group">
                        <a href="#" class="btn btn-outline-secondary" data-toggle="tooltip" title=""
                           data-original-title="List view">
                            <i class="fa fa-bars"></i></a>
                        <a href="#" class="btn  btn-outline-secondary active" data-toggle="tooltip" title=""
                           data-original-title="Grid view">
                            <i class="fa fa-th"></i></a>
                    </div>
                </div>
            </header><!-- sect-heading -->

            <section id="product1" class="section-p1">
                <div class="pro-container" id="pro">
                        <c:forEach var="item" items="${lPropage}">
                            <div class="pro" onclick="window.location.href='Product.jsp?id=${item.getId()}';">
                                <img src="image/img/products/${item.getProImage()}" alt="">
                                <div class="des">
                                    <span>${item.getProDes()}</span>
                                    <h5>${item.getProName()}</h5>
                                    <div class="star">
                                        <%--<% for (int i = 0; i < item.getProRank(); i++) {%>--%>
                                        <c:forEach var = "i" begin = "1" end = "${item.getProRank()}">
                                            <i class="fas fa-star"></i>
                                        </c:forEach>
                                        <%--<%}%>--%>
                                    </div>
                                    <h4>$ ${item.getProPrice()}</h4>
                                </div>
                                <form method="POST" action="/Cart/addItem">
                                    <input type="hidden" name="productCode" value="${item.getId()}">
                                    <button type="submit"><i class="fal fa-shopping-cart cart"></i></button>
                                </form>
                            </div>
                        </c:forEach>
                </div>

            </section>

            <section id="pagination" class="section-p1">
                <%
                    if (totalPage!=0) {
                        int in =0 ;
                        for(int i = 1;i < totalPage+1;i++)
                        {
                            %>
                                <a href="/Page/pageIndex?indexP=<%=i%>"><%=i%></a>
                            <%

                        }%>
                    <a href="/Page/pageIndex?indexP=<%=indexPage+1%>"><i class="fal fa-long-arrow-alt-right"></i></a>
                <%
                    }
                %>

            </section>
        </main>
    </div>
</div>
<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>--%>
<script>
    /*price range*/
    const value = document.querySelector("#value")
    const input = document.querySelector("#pi_input")
    value.textContent = input.value
    input.addEventListener("input", (event) => {
        value.value = event.target.value
    })
</script>

</body>
</html>
