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

    <title>SB Admin - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
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
                            <h1 class="h3 mb-2 text-gray-800">Tables</h1>

                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Driver List</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead class="text-center">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Phone NO</th>
                                                    <th>Identification</th>
                                                    <th>Gender</th>
                                                    <th>Active</th>
                                                    <th>Edit</th>
                                                    <th>
                                                        Function
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${list}" var="driver">
                                                <tr>
                                                    <td>${driver.driverID}</td>
                                                    <td>${driver.driverName}</td>
                                                    <td>${driver.driverIMail}</td>
                                                    <td>${driver.driverIPhone}</td>
                                                    <td>${driver.driverCCCD}</td>

                                                    <td> ${driver.driverGender == 1 ? "Male" : "Female"}</td>

                                                    <td class="text-center" id="${driver.driverID}">
                                                        ${driver.isActive == 1? "<i class=\"text-success fa-solid fa-check\"></i>" : "<i class=\"text-danger fa-solid fa-xmark\"></i>"}
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="http://localhost:8080/SWP_PROJECT/AdminUpdateDriver?id=${driver.driverID}" data-bs-toggle="tooltip" data-bs-title="Edit Driver ${driver.driverID}"><i class="text-info fa-solid fa-user-pen"></i></a>
                                                    </td>
                                                    <td class="text-center" id="recoverNremove${driver.driverID}">                                                           
                                                        <c:if test="${driver.isActive == 1}">
                                                            <a id="remove${driver.driverID}"><i class="text-danger fa-solid fa-user-xmark"></i></a>
                                                            </c:if>

                                                        <c:if test="${driver.isActive == 0}">
                                                            <a id="recover${driver.driverID}"><i class="text-success fa-solid fa-user-check"></i></i></a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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
                            <span aria-hidden="true">×</span>
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
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="js/demo/datatables-demo.js"></script>


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

            <script>
                const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
                const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
            </script>

            <!-- Delete Account -->
        <c:forEach items="${list}" var="driver">
            <script>
                $(document).ready(function ()
                {
                    $("#remove${driver.driverID}").click(function ()
                    {
                        console.log("remove ${driver.driverID}");

                        $.ajax({
                            url: 'http://localhost:8080/SWP_PROJECT/AdminRemoveAccount',
                            type: 'GET',
                            data: {"id": "${driver.driverID}"},
                            error: function ()
                            {
                                console.log("error");
                            },
                            success: function (data)
                            {
                                $('#${driver.driverID}').empty();
                                $('#${driver.driverID}').append("<i class=\"text-danger fa-solid fa-xmark\"></i>");
                                $('#recoverNremove${driver.driverID}').empty();
                                $('#recoverNremove${driver.driverID}').append("<a id=\"recover${driver.driverID}\"><i class=\"text-success fa-solid fa-user-check\"></i></a>");
                            }
                        });
                    });

                    $("td").on("click", "a#recover${driver.driverID}", function ()
                    {
                        console.log("recover ${driver.driverID}");

                        $.ajax({
                            url: 'http://localhost:8080/SWP_PROJECT/AdminDriverRecover',
                            type: 'GET',
                            data: {"id": "${driver.driverID}"},
                            error: function ()
                            {
                                console.log("error");
                            },
                            success: function (data)
                            {
                                $('#${driver.driverID}').empty();
                                $('#${driver.driverID}').append("<i class=\"text-success fa-solid fa-check\"></i>");
                                $('#recoverNremove${driver.driverID}').empty();
                                $('#recoverNremove${driver.driverID}').append("<a id=\"remove${driver.driverID}\"><i class=\"text-danger fa-solid fa-user-xmark\"></i></a>");

                            }
                        });
                    });
                });
            </script>
        </c:forEach>
        <!-- Recover Account -->
        <c:forEach items="${list}" var="driver">
            <script>
                $(document).ready(function ()
                {

                    $("#recover${driver.driverID}").click(function ()
                    {
                        console.log("recover ${driver.driverID}");

                        $.ajax({
                            url: 'http://localhost:8080/SWP_PROJECT/AdminDriverRecover',
                            type: 'GET',
                            data: {"id": "${driver.driverID}"},
                            error: function ()
                            {
                                console.log("error");
                            },
                            success: function (data)
                            {
                                $('#${driver.driverID}').empty();
                                $('#${driver.driverID}').append("<i class=\"text-success fa-solid fa-check\"></i>");
                                $('#recoverNremove${driver.driverID}').empty();
                                $('#recoverNremove${driver.driverID}').append("<a id=\"remove${driver.driverID}\"><i class=\"text-danger fa-solid fa-user-xmark\"></i></a>");

                            }
                        });
                    });

                    $("td").on("click", "a#remove${driver.driverID}", function ()
                    {
                        console.log("remove ${driver.driverID}");

                        $.ajax({
                            url: 'http://localhost:8080/SWP_PROJECT/AdminRemoveAccount',
                            type: 'GET',
                            data: {"id": "${driver.driverID}"},
                            error: function ()
                            {
                                console.log("error");
                            },
                            success: function (data)
                            {
                                $('#${driver.driverID}').empty();
                                $('#${driver.driverID}').append("<i class=\"text-danger fa-solid fa-xmark\"></i>");
                                $('#recoverNremove${driver.driverID}').empty();
                                $('#recoverNremove${driver.driverID}').append("<a id=\"recover${driver.driverID}\"><i class=\"text-success fa-solid fa-user-check\"></i></a>");
                            }
                        });
                    });

                });
            </script>
        </c:forEach>
    </body>

</html>
