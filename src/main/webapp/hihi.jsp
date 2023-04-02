
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.demo3.business.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //Authentication access - session
    Account auth = (Account) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);// set for using in each page for navbar check and showing button
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
                <div class="col-4">
                    <h6 class="mt-2">Format</h6>
                </div>
                <div class="col-4">
                    <h6 class="mt-2">Quantity</h6>
                </div>
                <div class="col-4">
                    <h6 class="mt-2">Price</h6>
                </div>
            </div>
        </div>
    </div>

    <div class="row d-flex justify-content-center border-top">
        <div class="col-5">
            <th scope="row">
                <div class="d-flex align-items-center">
                    <img src="https://i.imgur.com/2DsA49b.webp" class="img-fluid rounded-3"
                         style="width: 120px;" alt="Book">
                    <div class="flex-column ms-4">
                        <h4 class="mb-2">Thinking, Fast and Slow</h4>
                        <p class="mb-0">Daniel Kahneman</p>
                    </div>
                </div>
            </th>
        </div>
        <div class="my-auto col-7">
            <div class="row text-right">
                <div class="col-4">
                    <p class="mob-text">Digital</p>
                </div>
                <div class="col-4">
                    <div class="row d-flex justify-content-end px-3">

                        <div class="d-flex flex-row">
                            <button class="btn btn-link px-2"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                <i class="fas fa-minus"></i>
                            </button>

                            <input id="form1" min="0" name="quantity" value="1" type="number"
                                   class="form-control form-control-sm" style="width: 50px;" />

                            <button class="btn btn-link px-2"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <h6 class="mob-text">$9.99</h6>
                </div>
            </div>
        </div>
    </div>

    <div class="row d-flex justify-content-center border-top">
        <div class="col-5">
            <th scope="row" class="border-bottom-0">
                <div class="d-flex align-items-center">
                    <img src="https://i.imgur.com/Oj1iQUX.webp" class="img-fluid rounded-3"
                         style="width: 120px;" alt="Book">
                    <div class="flex-column ms-4">
                        <h4 class="mb-2">Homo Deus: A Brief History of Tomorrow</h4>
                        <p class="mb-0">Yuval Noah Harari</p>
                    </div>
                </div>
            </th>
        </div>
        <div class="my-auto col-7">
            <div class="row text-right">
                <div class="col-4">
                    <p class="mob-text">Paperback</p>
                </div>
                <div class="col-4">
                    <div class="row d-flex justify-content-end px-3">

                        <div class="d-flex flex-row">
                            <button class="btn btn-link px-2"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                <i class="fas fa-minus"></i>
                            </button>

                            <input id="form2" min="0" name="quantity" value="1" type="number"
                                   class="form-control form-control-sm" style="width: 50px;" />

                            <button class="btn btn-link px-2"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <h6 class="mob-text">$13.50</h6>
                </div>
            </div>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card">
                <div class="row">
                    <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
                        <form>
                            <div class="d-flex flex-row pb-3">
                                <div class="d-flex align-items-center pe-2">
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
                            <h6 class="mb-1 text-right">$23.49</h6>
                        </div>
                        <div class="row d-flex justify-content-between px-4">
                            <p class="mb-1 text-left">Shipping</p>
                            <h6 class="mb-1 text-right">$2.99</h6>
                        </div>
                        <div class="row d-flex justify-content-between px-4" id="tax">
                            <p class="mb-1 text-left">Total (tax included)</p>
                            <h6 class="mb-1 text-right">$26.48</h6>
                        </div>
                        <button class="btn-block btn-blue">
                            <span>
                                <span id="checkout">Checkout</span>
                                <span id="check-amt">$26.48</span>
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