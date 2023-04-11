<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Tables</title>

        <!-- Custom fonts for this template -->
        <!--        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" integrity="sha512-HHsOC+h3najWR7OKiGZtfhFIEzg5VRIPde0kB0bG2QRidTQqf+sbfcxCTB16AcFB93xMjnBIKE29/MjdzXE+qw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="./css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="./vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
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
                            <h1 class="h3 mb-2 text-gray-800">CREATE DRIVER ACCOUNT</h1>

                            <div class="card shadow">
                                <div class="card-header">Add New Driver ${AUTOINCREMENT_DRIVER}</div>   
                                <div class="card-body">
                                    <form action="../AdminAddNewDriver" method="post" enctype="multipart/form-data">
                                        <p class="text-danger">${error}</p>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon1"><i class="fa-regular fa-user"></i></span>
                                            <input type="text" class="form-control" placeholder="Full Name" aria-label="name" aria-describedby="Name Driver" name="name">
                                        </div>

                                        <div class="input-group mb-3">
                                            <input type="email" class="form-control" placeholder="abc@example.com" aria-label="email" aria-describedby="Email of Driver" name="mail">
                                            <span class="input-group-text" id="basic-addon2"><i class="fa-solid fa-at"></i></span>
                                        </div>

                                        <label for="basic-url" class="form-label">Phone Number</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon3"><i class="fa-solid fa-phone"></i></span>
                                            <input type="tel" class="form-control" id="basic-url" aria-describedby="Phone Number" pattern="^09+[0-9]{2}[0-9]{6}" name="phone">
                                        </div>

                                        <label for="basic-url" class="form-label">Identification</label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon3"><i class="fa-regular fa-id-card"></i></span>
                                            <input type="text" class="form-control" id="basic-url" aria-describedby="CCCD" name="cccd">
                                        </div>

                                        <div class="input-group mb-3">
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="inputGroupFile01"><i class="fa-solid fa-image-portrait"></i></label>
                                                <input type="file" class="form-control" id="inputGroupFile01" name="file">
                                            </div>
                                        </div>

                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" name="user">
                                            <span class="input-group-text"><i class="fa-solid fa-user"></i></span>

                                            <input type="password" class="form-control" placeholder="Password" aria-label="Password" name="pass">
                                            <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text"><i class="fa-solid fa-venus-mars"></i></span>
                                            <select class="form-select" aria-label="Gender" name="gender">
                                                <option selected>Select Gender of Driver</option>
                                                <option value="true">Male</option>
                                                <option value="false">Female</option>
                                            </select>
                                        </div>
                                        
                                        <button class="btn btn-outline-primary" type="submit">Save Driver ${AUTOINCREMENT_DRIVER}</button>
                                    </form>
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
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

        <!-- Bootstrap core JavaScript-->
        <script src="./vendor/jquery/jquery.min.js"></script>
        <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="./vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="./js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="./vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="./vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="./js/demo/datatables-demo.js"></script>

    </body>

</html>