
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.demo3.business.*" %>
<%@ page import="com.example.demo3.data.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.sun.activation.registries.LogSupport.log" %>


<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <%@ include file="/include/head.jsp" %>
  <title>Admin Section</title>


  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <!-- https://fonts.google.com/specimen/Roboto -->

  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- https://fonts.google.com/specimen/Roboto -->
  <link href="css/fontawesome.min.css" rel="stylesheet"/>
  <!-- https://fontawesome.com/ -->
  <link href="jquery-ui-datepicker/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
  <!-- http://api.jqueryui.com/datepicker/ -->
  <link rel="stylesheet" href="/adminSection/css/usersection.css">
  <link href="css/bootstrap.min.css" rel="stylesheet"/>
  <!-- https://getbootstrap.com/ -->
  <link href="css/templatemo-style.css" rel="stylesheet">
  <link rel="stylesheet" href="style/main.css">
</head>

<body id="page-top">
<jsp:include page="/include/navbar.jsp" />
<!-- Page Wrapper -->
<div id="wrapper">
  <%--Side Bar--%>

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content" >

      <!-- Begin Page Content -->
      <div class="container-fluid" style="width: 85%;margin-top: 20px;">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
          <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                  class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
        </div>

        <!-- Content Row -->
        <div class="row">

          <!-- Earnings (Monthly) Card Example -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                      Earnings (Monthly)</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Earnings (Monthly) Card Example -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                      Earnings (Annual)</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Earnings (Monthly) Card Example -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                    </div>
                    <div class="row no-gutters align-items-center">
                      <div class="col-auto">
                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                      </div>
                      <div class="col">
                        <div class="progress progress-sm mr-2">
                          <div class="progress-bar bg-info" role="progressbar"
                               style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                               aria-valuemax="100"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Pending Requests Card Example -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                      Pending Requests</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Content Row -->

        <div class="row">

          <!-- Area Chart -->
          <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
              <!-- Card Header - Dropdown -->
              <div
                      class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                <div class="dropdown no-arrow">
                  <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                       aria-labelledby="dropdownMenuLink">
                    <div class="dropdown-header">Dropdown Header:</div>
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>
                </div>
              </div>
              <!-- Card Body -->
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="myAreaChart"></canvas>
                </div>
              </div>
            </div>
          </div>

          <!-- Pie Chart -->
          <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
              <!-- Card Header - Dropdown -->
              <div
                      class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                <div class="dropdown no-arrow">
                  <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                       aria-labelledby="dropdownMenuLink">
                    <div class="dropdown-header">Dropdown Header:</div>
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>
                </div>
              </div>
              <!-- Card Body -->
              <div class="card-body">
                <div class="chart-pie pt-4 pb-2">
                  <canvas id="myPieChart"></canvas>
                </div>
                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
                  <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
                  <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <header class="border-bottom mb-4 pb-1">
          <div class="form-inline">
              <div class="btn-group">
                <button type="button" class="btn normal dropdown-toggle" style="background: #088178;color: white;" data-toggle="dropdown" style="background: #088178;" aria-haspopup="true" aria-expanded="false">
                  Select Management
                </button>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="/Admin/Default?iIndex=1&csrfToken=${sessionScope.csrfToken}">User Management</a>
                  <a class="dropdown-item" href="/Admin/Default?iIndex=2&csrfToken=${sessionScope.csrfToken}">Order Management</a>
                  <a class="dropdown-item" href="/Admin/Default?iIndex=3&csrfToken=${sessionScope.csrfToken}">Product Management</a>
                </div>
              </div>
          </div>
        </header><!-- sect-heading -->
        <!-- Content Row -->
        <%@ include file="tableSection.jsp" %>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <<%--footer class="sticky-footer bg-white" style="width: 100%">--%>
          <%--<%@ include file="/include/footer.jsp" %>--%>
      <%--</footer>--%>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
       aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
    <%@ include file="/include/foot.jsp" %>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

  <%--the javascipt for datatable--%>
  <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>
</body>

</html>