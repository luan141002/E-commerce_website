<%@ page import="com.example.demo3.business.*" %>
<%@ page import="com.example.demo3.data.ProductDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo3.data.CartDAO" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/2/2023
  Time: 3:09 PM
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
    ShippingInfo ship = new ShippingInfo();
    int index = 0;
    if (cart_list != null) {
        index = CartDAO.getCount(cart_list.getListCart());
    }
%>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link  rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <%@ include file="include/head.jsp" %>

</head>
<body>
<%@ include file="include/navbar.jsp" %>
<!-- User Form Modal -->
<div class="container mt-5">
    <div class="row flex-lg-nowrap">
        <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
            <div class="card p-3">
                <div class="e-navlist e-navlist--active-bg">
                    <ul class="nav">
                        <li class="nav-item"><a class="nav-link px-2 active" href="#"><i
                                class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
                        <li class="nav-item"><a class="nav-link px-2"
                                                href="https://www.bootdey.com/snippets/view/bs4-crud-users"
                                                target="__blank"><i
                                class="fa fa-fw fa-th mr-1"></i><span>CRUD</span></a></li>
                        <li class="nav-item"><a class="nav-link px-2"
                                                href="https://www.bootdey.com/snippets/view/bs4-edit-profile-page"
                                                target="__blank"><i
                                class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="row">
                <div class="col mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="e-profile">
                                <div class="row">
                                    <div class="col-12 col-sm-auto mb-3">
                                        <div class="mx-auto" style="width: 140px;">
                                            <div class="d-flex justify-content-center align-items-center rounded"
                                                 style="height: 140px; background-color: rgb(233, 236, 239);">
                                                <img src="/adminSection/img/undraw_profile.svg">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                        <div class="text-center text-sm-left mb-2 mb-sm-0">
                                            <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${user.getFirstName()} ${user.getLastName()}</h4>
                                            <p class="mb-0">${user.getEmail()}</p>
                                            <div class="text-muted"><small>Last seen 2 hours ago</small></div>
                                            <div class="mt-2">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fa fa-fw fa-camera"></i>
                                                    <span>Change Photo</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="text-center text-sm-right">
                                            <span class="badge badge-secondary bg-success">Customer</span>
                                            <div class="text-muted"><small>Joined 09 Dec 2017</small></div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="nav nav-tabs">
                                    <li class="nav-item"><a href="" class="active nav-link">Setting</a></li>
                                </ul>
                                <div class="tab-content pt-3">
                                    <div class="tab-pane active">
                                        <form class="form" method="post" action="Page/updateUser">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>First Name</label>
                                                                <input class="form-control" type="text" name="firstname"
                                                                       placeholder="John Smith"
                                                                       value="${user.getFirstName()}">
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Last Name</label>
                                                                <input class="form-control" type="text" name="lastname"
                                                                       placeholder="johnny.s"
                                                                       value="${user.getLastName()}">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input class="form-control" type="text"
                                                                       name = "email"
                                                                       placeholder="user@example.com"
                                                                       disabled
                                                                       value="${user.getAccount().getUsername()}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Phone</label>
                                                                <input class="form-control" name="phone" type="text" placeholder="user@example.com" value="${user.getUserPhone()}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col mb-3">
                                                            <div class="form-group">
                                                                <label>Address</label>
                                                                <textarea class="form-control" rows="5" name="address"
                                                                          placeholder="My Bio">${user.getUserAddress()}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6 mb-3">
                                                    <div class="mb-2"><b>Change Password</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Current Password</label>
                                                                <input class="form-control" type="password" name="oldPassword" disabled
                                                                       placeholder="${user.getAccount().getPassword()}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>New Password</label>
                                                                <input class="form-control" type="password" name="newPassword"
                                                                       placeholder="••••••">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Confirm <span
                                                                        class="d-none d-xl-inline">Password</span></label>
                                                                <input class="form-control" type="password" name="newPassword2"
                                                                       placeholder="••••••"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                                                    <div class="mb-2"><b>Keeping in Touch</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <label>Email Notifications</label>
                                                            <div class="custom-controls-stacked px-2">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="notifications-blog" checked="">
                                                                    <label class="custom-control-label"
                                                                           for="notifications-blog">New Product</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="notifications-news" checked="">
                                                                    <label class="custom-control-label"
                                                                           for="notifications-news">Newsletter</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="notifications-offers" checked="">
                                                                    <label class="custom-control-label"
                                                                           for="notifications-offers">Personal
                                                                        Offers</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Save Changes</button>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-3 mb-3">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="px-xl-3">
                                <button class="btn btn-block btn-secondary">
                                    <i class="fa fa-sign-out"></i>
                                    <span>Logout</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title font-weight-bold">Support</h6>
                            <p class="card-text">Get fast, free help from our friendly assistants.</p>
                            <button type="button" class="btn btn-primary">Contact Us</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>
