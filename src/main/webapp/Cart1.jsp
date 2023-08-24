<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.demo3.business.*" %>
<%@ page import="com.example.demo3.data.ProductDAO" %>
<%@ page import="com.example.demo3.data.CartDAO" %>
<%@ page import="static com.example.demo3.data.CartDAO.getTotalCurrencyFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  //Authentication access - session
  Account auth = (Account) request.getSession().getAttribute("auth");
  if (auth != null) {
    request.setAttribute("auth", auth);// set for using in each page for navbar check and showing button
  }
  Cart cart_list = (Cart) session.getAttribute("cart-list");
  ShippingInfo ship = new ShippingInfo();
  double total =0 ;
  int index = 0;
  if (cart_list != null) {
    index =CartDAO.getCount(cart_list.getListCart());
    total = CartDAO.getTotalCurrencyFormat(cart_list.getListCart());
  }
%>
<html>
<head>
  <title>Shopping Page</title>
  <%@ include file="include/head.jsp" %>
  <link rel="stylesheet" href="style/main3.css">
</head>

<body>

<%@ include file="include/navbar.jsp" %>

<section id="page-header" class="about-header">
  <h2>#let's_talk</h2>
  <p>LEAVE A MESSAGE, We love to hear from you!</p>
</section>

<section id="cart" class="section-p1">
  <table width="100%">
    <thead>
      <tr>
        <td>Remove</td>
        <td>Image</td>
        <td>Product</td>
        <td>Price</td>
        <td>Quantity</td>
        <td>Subtotal</td>
      </tr>
    </thead>
    <tbody>
    <%
      if (cart_list!=null) {
        for (CartItem item : cart_list.getListCart()) {
    %>
      <tr>
        <td><a href="Cart/removeItem?productCode=<%=item.getProduct().getId()%>"><i class="far fa-times-circle"></i></a></td>
        <td><img src="image/img/products/<%=item.getProduct().getProImage()%>"></td>
        <td><%=item.getProduct().getProName()%></td>
        <td><%=item.getProduct().getProPrice()%></td>
        <td>
          <form action="/Cart/updateItem?productCode=<%=item.getProduct().getId()%>" method="POST" class="d-flex flex-row px-5" >
            <button class="btn btn-link px-2"
                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
              <i class="fa-sharp fa-solid fa-minus" style="color: #088178;"></i>
            </button>
            <input type="number" min="0" name="quantity" class="form-control form-control-sm "
                   style=width:50px; value="<%=item.getQuantity()%>" id="quantity" />
           <%-- <button type="submit" value="Update" class="btn btn-outline-dark mr-2"><i class="fa fa-refresh"></i></button>--%>
            <button class="btn btn-link px-2"
                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
              <i class="fa-sharp fa-solid fa-plus" style="color: #088178;"></i>
            </button>
          </form>

        </td>
        <td><%=item.getProduct().getProPrice()*item.getQuantity()%></td>
      </tr>
    <%}
        }else {
    }
    %>
    </tbody>
  </table>
</section>

<section id="cart-add" class="section-p1">
  <div id="coupon">
    <h3>Apply Coupon</h3>
    <div>
      <input type="text" placeholder="Enter Your Coupon">
      <button class="normal">Apply</button>
    </div>
  </div>
  <div id="subtotal">
    <h3>Cart Totals</h3>
    <table>
      <tr>
        <td>Cart Subtotal</td>
        <td>$ <%=total%></td>
      </tr>
      <tr>
        <td>Shipping</td>
        <td>$ <%=ship.Shippingfee("plan",5)%></td>
      </tr>
      <tr>
        <td><strong>Total</strong></td>
        <td><strong>$ <%=total+ship.Shippingfee("plan",5)%></strong></td>
      </tr>
    </table>
    <a href="Order/inCheck"><button class="normal">Process to checkout</button></a>
  </div>
</section>


<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>
