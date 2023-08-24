<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/28/2023
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="include/head.jsp" %>
    <style rel="stylesheet">
        @import url('https://fonts.googleapis.com/css?family=Assistant');

        body {
            background: #eee;
            font-family: Assistant, sans-serif;
        }

        .cell-1 {
            border-collapse: separate;
            border-spacing: 0 4em;
            background: #fff;
            border-bottom: 5px solid transparent;
            /*background-color: gold;*/
            background-clip: padding-box;
        }

        thead {
            background: #dddcdc;
        }

        .toggle-btn {
            width: 40px;
            height: 21px;
            background: grey;
            border-radius: 50px;
            padding: 3px;
            cursor: pointer;
            -webkit-transition: all 0.3s 0.1s ease-in-out;
            -moz-transition: all 0.3s 0.1s ease-in-out;
            -o-transition: all 0.3s 0.1s ease-in-out;
            transition: all 0.3s 0.1s ease-in-out;
        }

        .toggle-btn > .inner-circle {
            width: 15px;
            height: 15px;
            background: #fff;
            border-radius: 50%;
            -webkit-transition: all 0.3s 0.1s ease-in-out;
            -moz-transition: all 0.3s 0.1s ease-in-out;
            -o-transition: all 0.3s 0.1s ease-in-out;
            transition: all 0.3s 0.1s ease-in-out;
        }

        .toggle-btn.active {
            background: blue !important;
        }

        .toggle-btn.active > .inner-circle {
            margin-left: 19px;
        }
    </style>

</head>
<body>
<%@ include file="include/navbar.jsp" %>
<div class="container mt-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-10">
            <div class="rounded">
                <div class="table-responsive table-borderless">
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="text-center">
                                <div class="toggle-btn">
                                    <div class="inner-circle"></div>
                                </div>
                            </th>
                            <th>Order ID</th>
                            <th>Company name</th>
                            <th>Status</th>
                            <th>Total</th>
                            <th>Created</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody class="table-body">
                        <c:forEach var="order" items="${orderlist}">
                            <tr class="cell-1">
                                <td class="text-center">
                                    <div class="toggle-btn">
                                        <div class="inner-circle"></div>
                                    </div>
                                </td>
                                <td>${order.getId()}</td>
                                <td>${order.getOrderDetail().getCount()}</td>
                                <td><span class="badge badge-success">${order.getStatusMessage()}</span></td>
                                <td>$ ${order.getOrderDetail().getTotalCost()+ order.getShipInfo().getShippingCost()}</td>
                                <td>${order.getDateCreated().toString() }</td>
                                <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="include/foot.jsp" %>
<%@ include file="include/footer.jsp" %>
<script>
    $(document).ready(function () {

        $('.toggle-btn').click(function () {
            $(this).toggleClass('active').siblings().removeClass('active');
        });

    });
</script>
</body>
</html>
