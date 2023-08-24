<%@ page import="com.example.demo3.business.*" %>
<%@ page import="com.example.demo3.business.ShippingInfo" %>
<%@ page import="com.example.demo3.data.CartDAO" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/2/2023
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //Authentication access - session
    Account auth = (Account) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);// set for using in each page for navbar check and showing button
    }
    Cart cart_list = (Cart) session.getAttribute("cart-list");

    double total = 0;
    int index = 0;
    if (cart_list != null) {
        index = CartDAO.getCount(cart_list.getListCart());
        total = CartDAO.getTotalCurrencyFormat(cart_list.getListCart());
    }
%>
<html>
<head>
    <title>Title</title>
    <%@ include file="include/head.jsp" %>
    <style rel="stylesheet">
        body {
            background: #f5f5f5
        }

        .rounded {
            border-radius: 1rem
        }

        .nav-pills .nav-link {
            color: #555
        }

        .nav-pills .nav-link.active {
            color: white
        }

        input[type="radio"] {
            margin-right: 5px
        }

        .bold {
            font-weight: bold
        }
    </style>
</head>
<body>
<%@ include file="include/navbar.jsp" %>
<div class="container">
    <div class="py-5 text-center">

        <h2>Checkout form</h2>
        <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group
            has a validation state that can be triggered by attempting to submit the form without completing it.</p>
    </div>

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your cart</span>
                <span class="badge badge-secondary badge-pill">3</span>
            </h4>
            <ul class="list-group mb-3">
                <%
                    for (CartItem item : cart_list.getListCart()) {%>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0"><%=item.getProduct().getProName()%>
                        </h6>
                        <small class="text-muted"><%=item.getQuantity()%>
                        </small>
                    </div>
                    <span class="text-muted">$<%=item.getProduct().getProPrice() * item.getQuantity()%></span>
                </li>
                <%}%>
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                        <h6 class="my-0">Promo code</h6>
                        <small>EXAMPLECODE</small>
                    </div>
                    <span class="text-success">-$5</span>
                </li>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (USD)</span>
                    <strong><%=total%>
                    </strong>
                </li>
            </ul>

            <form class="card p-2">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Promo code">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">Redeem</button>
                    </div>
                </div>
            </form>
        </div>


        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing address</h4>
            <form class="needs-validation" action="/Order/getOrder" method="POST">
                <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">First name</label>
                        <input name="checkout-firstname" type="text" class="form-control" id="firstName" placeholder=""
                               value="phan" required>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Last name</label>
                        <input name="checkout-lastname" type="text" class="form-control" id="lastName" placeholder=""
                               value="Thanh luan" required>
                        <div class="invalid-feedback">
                            Valid last name is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label >Email</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input name="checkout-email" type="text" class="form-control"
                               placeholder="Username" value="phanthanhluan553@gmail.com" required>
                        <div class="invalid-feedback" style="width: 100%;">
                            Your username is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email">Phone</label>
                    <input name="checkout-phone" type="number" class="form-control" id="email"
                           value="phanthanhluan553@gmail.com" placeholder="you@example.com">
                    <div class="invalid-feedback">
                        Please enter a valid email address for shipping updates.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="address">Address</label>
                    <input name="checkout-address" type="text" class="form-control" id="address"
                           value="phanthanhluan553@gmail.com" placeholder="1234 Main St" required>
                    <div class="invalid-feedback">
                        Please enter your shipping address.
                    </div>
                </div>

                <hr class="mb-4">

                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="same-address">
                    <label class="custom-control-label" for="same-address">Shipping address is the same as my billing
                        address</label>
                </div>

                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="save-info">
                    <label class="custom-control-label" for="save-info">Save this information for next time</label>
                </div>

                <hr class="mb-4">

                <h4 class="mb-3">Payment</h4>

               <%-- <div class="row mb-3">

                    <div class="col-lg-6 ml-2 mb-3">
                        <div class="card " style="width: 700px;">
                            <div class="card-header">
                                <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                                    <!-- Credit card form tabs -->
                                    <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                                        <li class="nav-item"><a data-toggle="pill" href="#credit-card"
                                                                class="nav-link active "> <i
                                                class="fas fa-credit-card mr-2"></i> Credit Card </a></li>
                                        <li class="nav-item"><a data-toggle="pill" href="#paypal" class="nav-link "> <i
                                                class="fab fa-paypal mr-2"></i> Paypal </a></li>
                                        <li class="nav-item"><a data-toggle="pill" href="#net-banking"
                                                                class="nav-link "> <i
                                                class="fas fa-mobile-alt mr-2"></i> Net Banking </a></li>
                                    </ul>
                                </div>

                                <!-- End -->
                                <!-- Credit card form content -->
                                <div class="tab-content">
                                    <!-- credit card info-->
                                    <div id="credit-card" class="tab-pane fade show active pt-3">
                                        <form role="form" onsubmit="event.preventDefault()">
                                            <div class="form-group"><label for="username">
                                                <h6>Card Owner</h6>
                                            </label> <input type="text" name="username" placeholder="Card Owner Name"
                                                            required class="form-control "></div>
                                            <div class="form-group"><label >
                                                <h6>Card number</h6>
                                            </label>
                                                <div class="input-group"><input type="text" name="cardNumber"
                                                                                placeholder="Valid card number"
                                                                                class="form-control " required>
                                                    <div class="input-group-append"><span
                                                            class="input-group-text text-muted"> <i
                                                            class="fab fa-cc-visa mx-1"></i> <i
                                                            class="fab fa-cc-mastercard mx-1"></i> <i
                                                            class="fab fa-cc-amex mx-1"></i> </span></div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-8">
                                                    <div class="form-group"><label><span class="hidden-xs">
                                                    <h6>Expiration Date</h6>
                                                </span></label>
                                                        <div class="input-group"><input type="number" placeholder="MM"
                                                                                        name="" class="form-control"
                                                                                        required> <input type="number"
                                                                                                         placeholder="YY"
                                                                                                         name=""
                                                                                                         class="form-control"
                                                                                                         required></div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group mb-4"><label data-toggle="tooltip"
                                                                                        title="Three digit CV code on the back of your card">
                                                        <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                                    </label> <input type="text" required class="form-control"></div>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                            <button type="button"
                                                    class="subscribe btn btn-primary btn-block shadow-sm"> Confirm
                                                Payment
                                            </button>
                                            </div>
                                        </form>
                                </div> <!-- End -->
                                <!-- Paypal info -->
                                <div id="paypal" class="tab-pane fade pt-3">
                                    <h6 class="pb-2">Select your paypal account type</h6>
                                    <div class="form-group "><label class="radio-inline"> <input type="radio"
                                                                                                 name="optradio"
                                                                                                 checked> Domestic
                                    </label> <label class="radio-inline"> <input type="radio" name="optradio"
                                                                                 class="ml-5">International </label>
                                    </div>
                                    <p>
                                        <button type="button" class="btn btn-primary "><i
                                                class="fab fa-paypal mr-2"></i> Log into my Paypal
                                        </button>
                                    </p>
                                    <p class="text-muted"> Note: After clicking on the button, you will be directed to a
                                        secure gateway for payment. After completing the payment process, you will be
                                        redirected back to the website to view details of your order. </p>
                                </div> <!-- End -->
                                <!-- bank transfer info -->
                                <div id="net-banking" class="tab-pane fade pt-3">
                                    <div class="form-group "><label >
                                        <h6>Select your Bank</h6>
                                    </label> <select class="form-control" id="ccmonth">
                                        <option value="" selected disabled>--Please select your Bank--</option>
                                        <option>Bank 1</option>
                                        <option>Bank 2</option>
                                        <option>Bank 3</option>
                                    </select></div>
                                    <div class="form-group">
                                        <p>
                                            <button type="button" class="btn btn-primary "><i
                                                    class="fas fa-mobile-alt mr-2"></i> Proceed Payment
                                            </button>
                                        </p>
                                    </div>
                                    <p class="text-muted">Note: After clicking on the button, you will be directed to a
                                        secure gateway for payment. After completing the payment process, you will be
                                        redirected back to the website to view details of your order. </p>
                                </div> --%>
                                    <!-- End -->
                                <!-- End -->
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <hr class="mb-4">

                <button class="btn btn-lg btn-block" style="background: #088178; color: #fff2e5;" type="submit">Continue to checkout</button>
            </form>
        </div>
    </div>

</div>

<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>

</body>
</html>
