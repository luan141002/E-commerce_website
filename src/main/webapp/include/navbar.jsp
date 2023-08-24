<%@ page import="com.example.demo3.data.CartDAO" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/17/2023
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="header">
    <a id="logo-header" href="/index.jsp"><img src="/style/image/img/logo.png" class="logo"></a>
    <form class="d-flex">
        <input class="form-control me-1" id="txtInputTable" style="width: 500px;" type="search" placeholder="Search"
               aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
            <i class="fa-solid fa-magnifying-glass"></i>
        </button>
    </form>
    <div>
        <ul id="navbar">

            <li><a class="menu-item " href="/index.jsp">Home </a></li>
            <li><a class="menu-item " href="/Page/pageIndex">Shop</a></li>
            <li><a class="menu-item " href="/Blog.jsp">Blog</a></li>
            <li><a class="menu-item " href="/About.jsp">About</a></li>
            <li><a class="menu-item " href="/Contact.jsp">Contact</a></li>
            <c:choose>
                <c:when test="${auth !=null}">
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-item dropdown-toggle" href="Profile.jsp" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline">${user.getFirstName()}</span>
                            <img class="" style="height:2rem;width:2rem;border-radius:50%!important;"
                                 src="/adminSection/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in py-2 mt-3"
                             aria-labelledby="userDropdown">
                            <c:choose>
                                <c:when test="${user.getAccount().getType()== 1}">
                                    <a class="dropdown-item small" href="/Admin/Default?iIndex=1&csrfToken=${sessionScope.csrfToken}">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Administration
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="dropdown-item small" href="Profile.jsp">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Personal Profile
                                    </a>
                                    <a class="dropdown-item small" href="/Page/checkOrder">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Order History
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item small" href="/logout">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                    <li><a class="menu-item " href="/Cart/showCart"><i class="far fa-shopping-bag position-relative">
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    <c:out value="${size}"/>
                    <span class="visually-hidden">unread messages</span></i></a></li>
                </c:when>
                <c:otherwise>
                    <%-- <%} else {%>--%>

                    <li><a href="/Account/signInWithCookie">Login</a></li>
                    <li><a class="menu-item " href="/Cart/showCart"><i class="far fa-shopping-bag position-relative">
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    <c:out value="${size}"/>
                    <span class="visually-hidden">unread messages</span></i></a></li>
                </c:otherwise>
            </c:choose>
            <%--       <% }%>--%>
        </ul>

    </div>
</nav>

