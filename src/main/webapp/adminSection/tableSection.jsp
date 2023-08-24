<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4 ">
    <div class="card-header py-3 ">
      <h5 class="m-0 font-weight-bold" style="color: #088178;">Manage Tables</h5>
    </div>
<c:choose>
  <c:when test="${indexSection == 1}">
    <button class="btn normal mt-3 " style="width: 20px!important; margin-left: 1050px; color: white; background:#088178;text-align: center;"  data-target="#myModal1" data-toggle="modal" type="button"  ><i class="fa-solid fa-file-circle-plus" style="color: #fff;"></i></button>
  </c:when>
  <c:when test="${indexSection == 2}">

  </c:when>
  <c:when test="${indexSection == 3}">
    <button class="btn normal mt-3 " style="width: 20px!important; margin-left: 1050px; color: white; background:#088178;text-align: center;"  data-target="#myModal" data-toggle="modal" type="button"  ><i class="fa-solid fa-file-circle-plus" style="color: #fff;"></i></button>
  </c:when>
</c:choose>

    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <c:choose>
            <c:when test="${indexSection == 1}">
            <thead>
              <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Budget</th>
                <th>Status</th>
                <th>Manage</th>
              </tr>
            </thead>
              <tfoot>
                <tr>
                  <th>User ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Address</th>
                  <th>Budget</th>
                  <th>Status</th>
                  <th>Manage</th>
                </tr>
              </tfoot>
              <tbody>
              <c:forEach var="item" items="${lPage}">
                <tr ondblclick="window.location.href='/Page/applyFilter?category=3&cIndex=5';">
                  <td>${item.getUserID()}</td>
                  <td>${item.getFirstName()}</td>
                  <td>${item.getEmail()}</td>
                  <td>${item.getUserPhone()}</td>
                  <td>${item.getUserAddress()}</td>
                  <td>${item.getUserCredit()}</td>
                  <td>${item.getUserStatus()}</td>
                  <td>
                    <button class="btn normal" style="background: #088178;color: white;margin-left: 50px; text-align: center;"   onclick="window.location.href='/Admin/loadUser?userNo=${item.getUserID()}';" type="button"><i class="fa-solid fa-pen-to-square" style="color: #fff;"></i></button>
                    <button type="button" class="btn normal" style="background: #088178;color: white; margin-left: 5px; text-align: center;" onclick="<c:set var="userID" value="${item.getUserID()}" scope="session" />" data-toggle="modal" data-target="#exampleModalCenter2">
                      <i class="fa-sharp fa-solid fa-trash" style="color: #fff;"></i>
                    </button>
                    <%--<button class="btn normal" style="background: #088178;color: white; margin-left: 5px; text-align: center;"   onclick="window.location.href='/Admin/deleteUser?userNo=${item.getUserID()}';"><i class="fa-sharp fa-solid fa-trash" style="color: #fff;"></i></button>--%>

                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </c:when>
            <c:when test="${indexSection == 2}">
              <thead>
              <tr>
                <th>Order ID</th>
                <th>User Name</th>
                <th>Number of Product</th>
                <th>Date</th>
                <th>Shipping Cost</th>
                <th>Status</th>
              </tr>

              </thead>
              <tfoot>
              <tr>
                <th>Order ID</th>
                <th>User Name</th>
                <th>Number of Product</th>
                <th>Date</th>
                <th>Shipping Cost</th>
                <th>Status</th>
              </tr>
              </tfoot>
              <tbody>
              <c:forEach var="item" items="${lPage}">
                <tr>
                  <td>${item.getId()}</td>
                  <td>${item.getUser().getFirstName()}</td>
                  <td>${item.getOrderDetail().getCount()}</td>
                  <td>${item.getDateCreated().toString()}</td>
                  <td>${item.getShipInfo().getShippingCost()}</td>
                  <td>
                    <button class="btn normal" style="background: #088178;color: white; margin-left: 30px; text-align: center;"   onclick="window.location.href='/Admin/changeState?orID=${item.getId()}';">${item.getStatusMessage()}</button>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </c:when>
            <c:otherwise>
              <thead>
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Status</th>
                <th>Quantity</th>
                <th>Manage</th>
              </tr>

              </thead>
              <tfoot>
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Status</th>
                <th>Quantity</th>
                <th>Manage</th>
              </tr>
              </tfoot>
              <tbody>
              <c:forEach var="item" items="${lPage}">
                  <tr ondblclick="window.location.href='/Page/applyFilter?category=3&cIndex=5';">
                    <td>${item.getId()}</td>
                    <td>${item.getProName()}</td>
                    <td>${item.getProCategory()}</td>
                    <td>$ ${item.getProPrice()}</td>
                    <td>${item.getProStatus()}</td>
                    <td>${item.getProquan()}</td>
                    <td>
                      <button class="btn normal" style="background: #088178;color: white;margin-left: 50px; text-align: center;"   onclick="window.location.href='/Admin/loadProduct?proNo=${item.getId()}';" type="button"><i class="fa-solid fa-pen-to-square" style="color: #fff;"></i></button>
                      <button type="button" class="btn normal" style="background: #088178;color: white; margin-left: 5px; text-align: center;" onclick="<c:set var="proID" value="${item.getId()}" scope="session" />" data-toggle="modal" data-target="#exampleModalCenter2">
                        <i class="fa-sharp fa-solid fa-trash" style="color: #fff;"></i>
                      </button>
                    </td>
                  </tr>
              </c:forEach>
              </tbody>
            </c:otherwise>
          </c:choose>
        </table>

      </div>
    </div>
  </div>
  <%@ include file="/adminSection/Login.jsp" %>
  <%@ include file="/adminSection/userSection.jsp" %>
  <%@ include file="/adminSection/DeleteConfirm.jsp" %>


</div>
<!-- /.container-fluid -->
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
  var modal = document.getElementById("my-modal");
  var btn = document.getElementById("open-modal");

  // Lấy phần tử span đóng modal
  var span = document.getElementsByClassName("close")[0];

  // Khi người dùng nhấn vào nút mở modal, hiển thị modal và cập nhật nội dung
  btn.onclick = function() {
    modal.style.display = "block";
    var userInfo = '<%= request.getAttribute("user") %>';
    var modalContent = document.querySelector(".modal-content");
    modalContent.innerHTML = userInfo;
  }

  // Khi người dùng nhấn vào phần tử span đóng modal, ẩn modal
  span.onclick = function() {
    modal.style.display = "none";
  }

  // Khi người dùng nhấn bất kỳ đâu ngoài modal, ẩn modal
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
</script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>



