
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
    String total = "0" ;
    int index = 0;
    if (cart_list != null) {
        index =CartDAO.getCount(cart_list.getListCart());
        total = CartDAO.getTotalCurrencyFormat(cart_list.getListCart());
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <%@ include file="include/head.jsp" %>

    <link rel="stylesheet" href="style/carrito.css">
    <script src="style/carito.js" defer></script>

</head>

<body>
<%@ include file="include/navbar.jsp" %>
<div class="container px-4 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-5">
            <h4 class="heading">Shopping Bag</h4>
        </div>
        <div class="col-7">
            <div class="row text-right">
                <div class="col-3">
                    <h6 class="mt-2">Format</h6>
                </div>
                <div class="col-3">
                    <h6 class="mt-2">Quantity</h6>
                </div>
                <div class="col-3">
                    <h6 class="mt-2">Price</h6>
                </div>
                <div class="col-3">
                    <h6 class="mt-2">Cancel</h6>
                </div>
            </div>
        </div>
    </div>
    <%
        if (cart_list!=null) {
            for (CartItem item : cart_list.getListCart()) {
    %>
    <div class="row d-flex justify-content-center border-top">
        <div class="col-5">
            <th scope="row">
                <div class="d-flex align-items-center">
                    <img src="image/img/products/<%=item.getProduct().getProImage()%>" class="img-fluid rounded-3"
                         style="width: 120px;" alt="Book">
                    <div class="flex-column ms-4">
                        <h4 class="mb-2"><%=item.getProduct().getProName()%></h4>
                        <p class="mb-0"><%=item.getProduct().getProDes()%></p>
                    </div>
                </div>
            </th>
        </div>
        <div class="my-auto col-7">
            <div class="row text-right">
                <div class="col-3">
                    <p class="mob-text"><%=item.getProduct().getProCategory()%></p>
                </div>
                <div class="col-3 ">
                    <div class="row d-flex justify-content-end ">
                            <form action="/Cart/updateItem?productCode=<%=item.getProduct().getId()%>" method="POST"class="d-flex flex-row">
                                <button class="btn btn-link px-2"
                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <input type="number" min="0" name="quantity" class="form-control form-control-sm "
                                       style=width:50px; value="<%=item.getQuantity()%>" id="quantity" />
                                <button type="submit" value="Update" class="btn btn-outline-dark mr-2"><i class="fa fa-refresh"></i></button>
                                <button class="btn btn-link px-2"
                                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                    <i class="fas fa-plus"></i>
                                </button>
                            </form>
                    </div>
                </div>
                <div class="col-3">
                    <h6 class="mob-text"><%=item.getProduct().getProPrice()*item.getQuantity()%></h6>
                </div>
                <div class="col-3">
                    <a href="Cart/removeItem?productCode=<%=item.getProduct().getId()%>" class="btn btn-sm btn-danger">Remove</a>
                </div>

            </div>
        </div>
    </div>
    <%}}else {
    }
    %>

    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card">
                <div class="row">
                    <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
                        <form>
                            <div class="d-flex flex-row pb-3">
                                <div class="d-flex align-items-center pe-2 ">
                                    <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel1v"
                                           value="" aria-label="..." checked />
                                </div>
                                <div class="rounded border w-100 p-3">
                                    <p class="d-flex align-items-center mb-0">
                                        <i class="fab fa-cc-mastercard fa-2x text-dark pe-2"></i>Credit
                                        Card
                                    </p>
                                </div>
                            </div>
                            <div class="d-flex flex-row pb-3">
                                <div class="d-flex align-items-center pe-2">
                                    <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel2v"
                                           value="" aria-label="..." />
                                </div>
                                <div class="rounded border w-100 p-3">
                                    <p class="d-flex align-items-center mb-0">
                                        <i class="fab fa-cc-visa fa-2x fa-lg text-dark pe-2"></i>Debit Card
                                    </p>
                                </div>
                            </div>
                            <div class="d-flex flex-row">
                                <div class="d-flex align-items-center pe-2">
                                    <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel3v"
                                           value="" aria-label="..." />
                                </div>
                                <div class="rounded border w-100 p-3">
                                    <p class="d-flex align-items-center mb-0">
                                        <i class="fab fa-cc-paypal fa-2x fa-lg text-dark pe-2"></i>PayPal
                                    </p>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-5">
                        <div class="row px-2">
                            <div class="form-group col-md-6">
                                <label class="form-control-label">Name on Card</label>
                                <input type="text" id="cname" name="cname" placeholder="Johnny Doe">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="form-control-label">Card Number</label>
                                <input type="text" id="cnum" name="cnum" placeholder="1111 2222 3333 4444">
                            </div>
                        </div>
                        <div class="row px-2">
                            <div class="form-group col-md-6">
                                <label class="form-control-label">Expiration Date</label>
                                <input type="text" id="exp" name="exp" placeholder="MM/YYYY">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="form-control-label">CVV</label>
                                <input type="text" id="cvv" name="cvv" placeholder="***">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mt-2">
                        <div class="row d-flex justify-content-between px-4">
                            <p class="mb-1 text-left">Subtotal</p>
                            <h6 class="mb-1 text-right"><%=total%></h6>

                        </div>
                        <div class="row d-flex justify-content-between px-4">
                            <p class="mb-1 text-left">Shipping</p>
                            <h6 class="mb-1 text-right">$<%=ship.Shippingfee("plan",5)%></h6>
                        </div>
                        <div class="row d-flex justify-content-between px-4" id="tax">
                            <p class="mb-1 text-left">Total (tax included)</p>
                            <h6 class="mb-1 text-right">$<%=total+ship.Shippingfee("plan",5)%></h6>
                        </div>
                        <button  class="btn-block btn-blue">
                            <span>
                                <span id="checkout"><a href="Order/inCheck">Checkout</a></span>
                                <span id="check-amt">$<%=total+ship.Shippingfee("plan",5)%></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>