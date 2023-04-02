<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/17/2023
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<nav id="header">
    <a id="logo-header" href="#"><img src="image/img/logo.png" class="logo"></a>
    <div >
        <ul id="navbar">
            <li><a class="active" href="index.jsp">Home </a></li>
            <li><a href="Shopping.jsp">Shop</a></li>
            <li><a href="blog.jsp">Blog</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="hihi.jsp">Contact</a></li>
            <%
                if (auth != null) { %>
            <li><a href="logout">Logout</a></li>
            <li><a href="Cart.jsp"><i class="far fa-shopping-bag"></i><span class="badge badge-danger px-2">${cart_list.size()}</span></a></li>
            <% } else {%>
            <li><a href="Login1.jsp">Login</a></li>
            <% }%>
        </ul>
    </div>
</nav>

