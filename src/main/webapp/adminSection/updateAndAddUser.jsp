<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/16/2023
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/adminSection/css/usersection.css">

  <%@ include file="/include/head.jsp" %>
  <link rel="stylesheet" href="style/main.css">
</head>
<body>
<jsp:include page="/include/navbar.jsp" />
<div class="container" style="margin-top:30px;">
  <div class="row gutters ">
    <div class=" col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12" style="color: #088178;">
      <div class="card h-100">
        <div class="card-body">
          <div class="account-settings">
            <div class="user-profile">
              <div class="user-avatar">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
              </div>
              <h5 class="user-name">Yuki Hayashi</h5>
              <h6 class="user-email">yuki@Maxwell.com</h6>
            </div>
            <div class="about">
              <h5>About</h5>
              <p>I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
      <form action="<c:url value='/Admin/operateUser'/>" method="post">
        <div class="card h-100">
          <div class="card-body">
            <div class="row gutters">
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <label class="mb-3 text-primary" style="color: #088178!important;">Personal Details</label>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
                  <label for="fullName" style="color: #088178;">User Name</label>
                  <input type="email" name="userName" value="${iUser.getAccount().getUsername()}" class="form-control" id="fullName" placeholder="Enter full name"/>
                </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
                  <label for="eMail" style="color: #088178;">Email</label>
                  <input type="email" name="email" value="${iUser.getEmail()}" class="form-control" id="eMail" placeholder="Enter email ID"/>
                </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
                  <label for="phone" style="color: #088178;">Password</label>
                  <input type="password" name="password" value="${iUser.getAccount().getPassword()}" class="form-control" id="phone" placeholder="Enter phone number"/>
                </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
                  <label for="website" style="color: #088178;">Role</label>
                  <input type="text" name="role" class="form-control" id="website" placeholder="Website url"/>
                </div>
              </div>
            </div>
            <div class="row gutters">
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <h6 class="mt-3 mb-2 text-primary" style="color: #088178;">Address</h6>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
                  <label for="Street" style="color: #088178;">Street</label>
                  <input type="name" value="${iUser.getUserAddress()}" name="addStreet" class="form-control" id="Street" placeholder="Enter Street"/>
                </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
                  <label for="ciTy" style="color: #088178;">City</label>
                  <input type="name" name="addCity" class="form-control" id="ciTy" placeholder="Enter City"/>
                </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
                  <label for="sTate" style="color: #088178;">State</label>
                  <input type="text" name="addState" class="form-control" id="sTate" placeholder="Enter State"/>
                </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="form-group">
                  <label for="zIp" style="color: #088178;">Zip Code</label>
                  <input type="text" class="form-control" id="zIp" placeholder="Zip Code"/>
                </div>
              </div>
            </div>
            <input type="hidden" name="inSec" value="uptUser"/>
            <div class="row gutters">
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="text-right">
                  <button type="button" id="submit" tname="submit" class="btn normal btn-secondary">Cancel</button>
                  <button type="submit"  name="submit" class="btn normal" style="color: white; background:#088178;text-align: center;">Update User Now</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
