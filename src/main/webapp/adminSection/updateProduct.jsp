<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/16/2023
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Add Product - Dashboard HTML Template</title>
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:400,700"
  />
  <!-- https://fonts.google.com/specimen/Roboto -->
  <link rel="stylesheet" href="css/fontawesome.min.css" />
  <!-- https://fontawesome.com/ -->
  <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
  <!-- http://api.jqueryui.com/datepicker/ -->
  <link rel="stylesheet" href="css/bootstrap.min.css" />
  <!-- https://getbootstrap.com/ -->
  <link rel="stylesheet" href="css/templatemo-style.css">
  <%@ include file="/include/head.jsp" %>
  <link rel="stylesheet" href="style/main.css">
  <!--
  Product Admin CSS Template
  https://templatemo.com/tm-524-product-admin
  -->
</head>

<body>
<jsp:include page="/include/navbar.jsp" />
<div class="container tm-mt-big tm-mb-big">
  <div class="row">
    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
      <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
        <div class="row">
          <div class="col-12">
            <h2 class="tm-block-title d-inline-block">Add Product</h2>
          </div>
        </div>
        <div class="row tm-edit-product-row">
          <div class="col-xl-6 col-lg-6 col-md-12">
            <form action="<c:url value='/Admin/operateProduct'/>" class="tm-edit-product-form">
              <div class="form-group mb-3">
                <label
                        for="name"
                >Product Name
                </label>
                <input
                        id="name"
                        name="name"
                        type="text"
                        class="form-control validate"
                        value="${iProduct.getProName()}"
                        required
                />
              </div>
              <div class="form-group mb-3">
                <label
                        for="description"
                >Description</label
                >
                <textarea
                        class="form-control validate"
                        rows="3"
                        id="description"

                        required
                >${iProduct.getProDes()}</textarea>
              </div>
              <div class="form-group mb-3">
                <label
                        for="category"
                >Category</label
                >
                <select
                        class="custom-select tm-select-accounts"
                        id="category"
                >
                  <option selected>${iProduct.getProCategory()}</option>
                  <option value="TOP">TOP</option>
                  <option value="BOTTOM">BOTTOM</option>
                  <option value="BAG">BAG</option>
                  <option value="SNEAKER">SNEAKER</option>
                </select>
              </div>
              <div class="form-group mb-3">
                <label
                        for="size"
                >Size</label
                >
                <select
                        class="custom-select tm-select-accounts"
                        name="size"
                        id="size"
                >
                  <option>${iProduct.getProSize().get(iSize).getSize()}</option>
                  <option value="M">M</option>
                  <option value="L">L</option>
                  <option value="XL">XL</option>
                  <option value="XXL">XXL</option>
                </select>
              </div>
              <div class="row">
                <div class="form-group mb-3 col-xs-12 col-sm-6">
                  <label
                          for="expire_date"
                  >Price
                  </label>
                  <input
                          id="expire_date"
                          name="price"
                          type="text"
                          value="${iProduct.getProPrice()}"
                          class="form-control validate"
                          data-large-mode="true"
                  />
                </div>
                <div class="form-group mb-3 col-xs-12 col-sm-6">
                  <label
                          for="stock"
                  >Units In Stock
                  </label>
                  <input
                          id="stock"
                          name="stock"
                          type="text"
                          class="form-control validate"
                          value="${iProduct.getProSize().get(iSize).getStock()}"
                          required
                  />
                </div>
              </div>

          </div>
          <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
            <img class="tm-product-img-dummy mx-auto" src="/style/image/img/products/${iProduct.getProImage()}" alt="">
            <%--<div class="tm-product-img-dummy mx-auto">
              <i
                      class="fas fa-cloud-upload-alt tm-upload-icon"
                      onclick="document.getElementById('fileInput').click();"
              ></i>
            </div>--%>
            <div class="custom-file mt-3 mb-3">
              <input id="fileInput" type="file" style="display:none;" />
              <input
                      type="button"
                      class="btn btn-primary btn-block mx-auto"
                      value="UPLOAD PRODUCT IMAGE"
                      onclick="document.getElementById('fileInput').click();"
              />
            </div>
          </div>
          <input type="hidden" name="inSec" value="updPro"/>
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="tm-footer row tm-mt-small">
  <div class="col-12 font-weight-light">
    <p class="text-center text-white mb-0 px-4 small">
      Copyright &copy; <b>2018</b> All rights reserved.

      Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
    </p>
  </div>
</footer>

<script src="js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
<!-- https://jqueryui.com/download/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
  $(function() {
    $("#expire_date").datepicker();
  });
</script>
</body>
</html>
