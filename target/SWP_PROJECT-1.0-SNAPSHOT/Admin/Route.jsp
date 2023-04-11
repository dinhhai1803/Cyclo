<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Route Admin Page</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="css/adminModal.css" rel="stylesheet" type="text/css">

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
                    <h1 class="h3 mb-2 text-gray-800">ROUTE</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Route Management</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Starting</th>
                                            <th>Destination</th>
                                            <th>Distance</th>
                                            <th>Price</th>
                                            <th>Function</th>
                                            <th>Admin ID</th>
                                        </tr>
                                    </thead>
                                    
                                <c:forEach items="${sessionScope.ROUTES}" var="route">
                                       <tr>
                                            <td>${route.routeID}</td>
                                            <td>${route.beginLocation}</td>
                                            <td>${route.endLocation}</td>
                                            <td>${route.distance} metters</td>
                                            <td>${route.routePrice} VND</td>
                                            <td style="width: 13%">

                                                    <details>
                                                    <summary>
                                                <div class="button" id="${route.routeID}"  href style="     background: #3cc4ff;
                                                                                padding: 5px;
                                                                                border-radius: 6px;
                                                                                color: aliceblue;
                                                                                margin-left: -20px;
                                                                                line-height: 29px;
                                                                                height: 34px;
                                                                                display: inline;  " name="Update">Update</div>
                                                <div  class="button" id="${route.routeID}"  href style="        background: #ff5555;
                                                                                padding: 5px;
                                                                                border-radius: 6px;
                                                                                color: aliceblue;
                                                                                margin-left: 4px;
                                                                                display: inline;" name="Delete">Delete</div>
                                                 <div class="details-modal-overlay"></div>
                                                    </summary>
                                                    <form action="../AdjustRouteServlet" method="post" class="details-modal" style="background: #e3f8fa;
                                                                                                                padding: 2%;
                                                                                                                top: 20%;
                                                                                                                pointer-events: auto;
                                                                                                                ">
                                                      
                                                      <div class="details-modal-title" style="padding-top: 14px">
                                                          <h1 class="title_route" style="display: inline">Update</h1><h1 style="display: inline"> Route ${route.routeID}</h1>
                                                      </div>
                                                      <div class="details-modal-content">
                                                        <div class="details_Starting" style="
                                                                    display: flex;
                                                                    justify-content: space-between;
                                                                    padding: 16px 0px;
                                                                ">
                                                                    <div class="details_Starting_title" style="
                                                                    font-size: 20px;
                                                                    font-weight: 500;
                                                                    padding: 8px 0;
                                                                ">Starting Location</div>
                                                                    <input class="details_Starting_value_${route.routeID}" value="${route.beginLocation}" style="
                                                                    border: none;
                                                                    border-bottom: 1px solid #ccc;
                                                                    background: transparent;
                                                                    padding: 0;
                                                                    font-size: 18px;
                                                                    height: 30px;
                                                                    margin-top: 8px;
                                                                    margin-right: 22px;
                                                                ">
                                                                </div>
                                                                <div class="details_End" style="
                                                                    display: flex;
                                                                    justify-content: space-between;
                                                                ">
                                                                    <div class="details_End_title" style="
                                                                    font-size: 20px;
                                                                    font-weight: 500;
                                                                    padding: 8px 0;
                                                                ">Destination Location</div>
                                                                    <input class="details_End_value_${route.routeID}" style="
                                                                    border: none;
                                                                    border-bottom: 1px solid #ccc;
                                                                    background: transparent;
                                                                    padding: 0;
                                                                    font-size: 18px;
                                                                    height: 30px;
                                                                    margin-top: 8px;
                                                                    margin-right: 22px;
                                                                " value="${route.endLocation}">
                                                                </div>
                                                                <div class="route_infor" style="
                                                                    padding: 20px 0;
                                                                    display: flex;
                                                                    justify-content: space-between;
                                                                ">
                                                                    <div class="details_distance" style="
                                                                    /* font-size: 20px; */
                                                                    margin-left: 8%;
                                                                ">
                                                                    <div class="details_distance_title" style="
                                                                    font-size: 20px;
                                                                    font-weight: 500;
                                                                ">Distance</div>
                                                                    <input class="details_distance_value_${route.routeID}" value="${route.distance} metters" style="
                                                                    border: none;
                                                                    border-bottom: 1px solid #ccc;
                                                                    background: transparent;
                                                                    padding: 0;
                                                                    font-size: 18px;
                                                                    height: 30px;
                                                                    /* margin-top: 8px; */
                                                                    /* margin-right: 22px; */
                                                                    width: 50%;
                                                                ">
                                                                </div>
                                                                <div class="details_price" style="
                                                                    margin-left: 2%;
                                                                ">
                                                                    <div class="details_price_title" style="
                                                                    font-size: 20px;
                                                                    font-weight: 500;
                                                                ">Price</div>
                                                                    <input class="details_price_value_${route.routeID}" value="${route.routePrice} VND" style="
                                                                    border: none;
                                                                    border-bottom: 1px solid #ccc;
                                                                    background: transparent;
                                                                    padding: 0;
                                                                    font-size: 18px;
                                                                    height: 30px;
                                                                    /* margin-top: 8px; */
                                                                    /* margin-right: 22px; */
                                                                    width: 50%;
                                                                ">
                                                                </div>
                                                                </div>
                                                                               <div class="button_list" style="
                                                                    /* margin-left: 17px; */
                                                                    /* padding-bottom: 0%; */
                                                                    /* float: right; */
                                                                    /* margin-right: -55px; */
                                                                    margin-left: 60%;
                                                                    padding-bottom: 0px;
                                                                    margin-bottom: 0%;
                                                                    padding-bottom: 0%;
                                                                ">
                                                                <button class="btn button_action" style="
                                                                    background: #58a3ef;
                                                                    color: aliceblue;
                                                                " name="action_button"  value="UPDATE">Update</button>
                                                               <button class="btn button_cancel" style="
                                                                     background: #9ca849;
                                                                    color: aliceblue;
                                                                ">Cancel</button>
                                                                    </div>                                           
                                                      </div>
                                                                    <input hidden name="Route_ID_hidden" value="${route.routeID}"> 
                                                                    <input hidden name="Route_BeginNumber_hidden" value="${route.beginNumber}"> 
                                                                    <input hidden class="Route_Begin_hidden_${route.routeID}" name="Route_Begin_hidden" value="${route.beginLocation}"> 
                                                                    <input hidden class="Route_End_hidden_${route.routeID}" name="Route_End_hidden" value="${route.endLocation}"> 
                                                                    <input hidden name="Route_EndNumber_hidden" value="${route.endNumber}"> 
                                                                    <input hidden class="Route_Distance_hidden_${route.routeID}" name="Route_Distance_hidden" value="${route.distance}"> 
                                                                    <input hidden class="Route_Price_hidden_${route.routeID}" name="Route_Price_hidden" value="${route.routePrice}"> 
                                                                    <input hidden name="Route_ADID_hidden" value="${route.adID}"> 
                                                    </form>
                                                  </details>
                                            </td>
                                    
                                            <td>${route.adID}</td>
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
                    <a class="btn btn-primary" href="../LogoutServlet">Logout</a>
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
    
    
    <script>
        var buttonId = 'R21';
        $('.button').click(function(){
        buttonId = $(this).attr('id');
        //console.log(buttonId)
        var action = $(this).attr('name');
        document.querySelectorAll('.title_route').forEach((title) => {
            title.innerText = action;
        })
         document.querySelectorAll('.button_action').forEach((btn) => {
            btn.innerText = action;
            btn.value = action;
            if(action == 'Delete')
                btn.style.background = "red";
        })
              console.log(document.querySelector('.details_Starting_value_'+buttonId.toString()).value)
             console.log(document.querySelector('.Route_Begin_hidden_'+buttonId.toString()).value)
        document.querySelector('.details_Starting_value_'+buttonId.toString()).onchange = function(){
             document.querySelector('.Route_Begin_hidden_'+buttonId.toString()).value = document.querySelector('.details_Starting_value_'+buttonId.toString()).value;
             console.log(document.querySelector('.details_Starting_value_'+buttonId.toString()).value)
             console.log(document.querySelector('.Route_Begin_hidden_'+buttonId.toString()).value)
        };
        
        document.querySelector('.details_End_value_'+buttonId.toString()).onchange = function(){
             document.querySelector('.Route_End_hidden_'+buttonId.toString()).value = document.querySelector('.details_End_value_'+buttonId.toString()).value;
        };
        
        document.querySelector('.details_distance_value_'+buttonId.toString()).onchange = function(){
             document.querySelector('.Route_Distance_hidden_'+buttonId.toString()).value = document.querySelector('.details_distance_value_'+buttonId.toString()).value;
        };
        
        document.querySelector('.details_price_value_'+buttonId.toString()).onchange = function(){
             document.querySelector('.Route_Price_hidden_'+buttonId.toString()).value = document.querySelector('.details_price_value_'+buttonId.toString()).value;
        };

      })

        
    </script>

</body>

</html>