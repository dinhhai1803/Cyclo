<%-- 
    Document   : index
    Created on : Oct 27, 2022, 8:54:42 PM
    Author     : Mang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> Admin - Dashboard</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <link href="./vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="SidebarNTopbar/sidebar.jsp"></jsp:include>
                <!-- End of Sidebar -->
                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                    <jsp:include page="SidebarNTopbar/topbar.jsp"></jsp:include>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->
                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                                <!--                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>-->
                            </div>

                            <!-- Content Row -->
                            <div class="row">

                                <!-- Earnings (Daily) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                        Earnings (Daily)</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${TotalDay} VND</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Weekly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Earnings (Weekly)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${TotalWeek} VND</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar-week fa-2x text-gray-300"></i>
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
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                    Earnings (Monthly)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${TotalMonth} VND</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Annual) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Earnings (Annual)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${TotalYear} VND</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
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
                                    <!--                                    <div
                                                                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                                            <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                                                            <div class="dropdown no-arrow">
                                                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                                                </a>
                                                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                                                     aria-labelledby="dropdownMenuLink">
                                                                                    <div class="dropdown-header">Enter target</div>
                                                                                    <input class="dropdown-item" value="" id="target">
                                                                                </div>
                                                                            </div>
                                                                        </div>-->
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
                                        <h6 class="m-0 font-weight-bold text-primary">Target</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                 aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Target set:</div>
                                                <div class="dropdown-header">
                                                    <div class="">
                                                        <input class="" type="number" value="" id="target1" placeholder="Week" min="1000000">
                                                    </div>
                                                    <div class=" my-3">
                                                        <input class="" type="number" value="" id="target2" placeholder="Month"  min="1000000">
                                                    </div>
                                                    <div class="">
                                                        <input class="" type="number" value="" id="target3" placeholder="Year"  min="1000000">
                                                    </div>
                                                </div>
                                                <div class="dropdown-divider"></div>
                                                <div class="dropdown-header text-center">
                                                    <button class="btn btn-outline-primary btn-sm" type="button" id="saveTarget">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <h4 class="small font-weight-bold">Weekly <span
                                                class="float-right" id="percentWeek">0%</span></h4>
                                        <div class="progress mb-4">
                                            <div class="progress-bar bg-danger" id="barWeek" role="progressbar" style="width: 0%"
                                                 aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <h4 class="small font-weight-bold">Monthly <span
                                                class="float-right" id="percentMonth">0%</span></h4>
                                        <div class="progress mb-4">
                                            <div class="progress-bar bg-warning" id="barMonth" role="progressbar" style="width: 0%"
                                                 aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <h4 class="small font-weight-bold">Annual <span
                                                class="float-right" id="percentYear">0%</span></h4>
                                        <div class="progress mb-4">
                                            <div class="progress-bar" id="barYear" role="progressbar" style="width: 0%"
                                                 aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <!-- Content Column -->
                            <div class="col-lg-12 mb-4">
                                <!-- DataTales Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">BILL MANAGEMENT</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead class="text-center">
                                                    <tr>
                                                        <th>Bill ID</th>
                                                        <th>Customer ID</th>
                                                        <th>Driver ID</th>
                                                        <th>Price</th>
                                                        <th>Date</th>
                                                        <th>View</th>
                                                    </tr>
                                                </thead>
                                                <c:forEach var="bill" items="${sessionScope.BILLLIST}">
                                                    <tr>
                                                        <td>${bill.billID}</td>
                                                        <td>${bill.cusID}</td>
                                                        <td>${bill.driverID}</td>
                                                        <td>${bill.getTotal()}</td>
                                                        <td>${bill.getDate()}</td>
                                                        <td class="text-center">
                                                            <a href="http://localhost:8080/SWP_PROJECT/AdminBillDetail?DetailID=${bill.detailID}"  class="text-decoration-none">
                                                                <i class="fa-solid fa-circle-info"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <jsp:include page="SidebarNTopbar/footer.jsp"></jsp:include>
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
                            <span aria-hidden="true">Ã—</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="http://localhost:8080/SWP_PROJECT/LogoutServlet">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="./vendor/jquery/jquery.min.js"></script>
        <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="./js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="./vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="./js/demo/chart-area-demo.js"></script>

        <!-- Page level plugins -->
        <!--        <script src="./Admin/vendor/datatables/jquery.dataTables.min.js"></script>-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

        <script src="./vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="./js/demo/datatables-demo.js"></script>
        <script>
            $(document).ready(function () {
                $("#saveTarget").click(function ()
                {
                    var week = $("#target1").val();
                    var month = $("#target2").val();
                    var year = $("#target3").val();
                    if (week >= 1000000 && month >= 1000000 && year >= 1000000)
                    {
                        $.ajax({
                            url: 'http://localhost:8080/SWP_PROJECT/ProgressTargetServlet',
                            type: 'GET',
                            data: {
                                "week": week,
                                "month": month,
                                "year": year
                            },
                            error: function (xhr, status, error) {
                                var err = eval("(" + xhr.responseText + ")");
                                alert(err.Message);
                            },
                            success: function (data)
                            {
                                console.log(data);
                                $('#barWeek').attr('aria-valuenow', data.week).css('width', data.week + '%');
                                $('#percentWeek').text(Math.round(data.week) + '%');
                                

                                $('#barMonth').attr('aria-valuenow', data.month).css('width', data.month + '%');
                                $('#percentMonth').text(Math.round(data.month) + '%');

                                $('#barYear').attr('aria-valuenow', data.year).css('width', data.year + '%');
                                $('#percentYear').text(Math.round(data.year) + '%');
                            }
                        });
                    } else
                    {
                        alert("The Target shoule be greater than 1.000.000");
                    }

                });
            });
        </script>

        <script>
//            $(document).ready(function () {
//                $.ajax({
//                    url: '../AdminChartBill',
//                    type: 'POST',
//                    error: function()
//                    {
//                        console.log("Error");
//                    },
//                    success: function(data)
//                    {
//                        console.log(data);
//                    }
//                });
//            });
        </script>

    </body>
</html>

