<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Search -->
    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="" method="post">
        <div class="input-group">                                
            <select class="form-control small" name="station" id="station">
                <c:forEach items="${stations}" var="s">
                    <option value="${s.stationID}" ${s.stationID == User.driverID ? 'selected':''}> Station ${s.stationName}</option>
                </c:forEach>
            </select>

            <input class="form-control small" name="status" value="${User.driverStatus == 1 ? 'Free' : 'Busy'}" readonly>
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#saveModal" id="change">
                    <i class="fas fa-check fa-sm"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Topbar Navbar -->
   <ul class="navbar-nav ml-auto">
        <!-- Nav Item - Alerts -->
        <li class="nav-item dropdown no-arrow mx-1">
            <a id="current" class="nav-link text-dark">Station Current: Station : ${User.currentStation}</a>

        </li>

        <div class="topbar-divider d-no ne d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a
                class="nav-link dropdown-toggle"
                href="#"
                id="userDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
                >
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                      >${User.driverName}</span
                >
                <img
                    class="img-profile rounded-circle"
                    src="./img/${User.getDriverAvatar()}"
                    >
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="http://localhost:8080/SWP_PROJECT/UpdateAccountServlet?id=${User.driverID}">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
                </a>
            </div>
        </li>
    </ul>
</nav>


<!-- Jquery Ajax -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script>
    $(document).ready(function () {
        $("#change").click(function ()
        {
            var id = $("#station").val();
            console.log(id);
            $.ajax({
                url: "../DriverChangeStation",
                type: "GET",
                data: {"sID": id},
                error: function ()
                {
                    console.log("error");
                },
                success: function (data)
                {

                }
            });
            $("#current").text("Station Current: Station" + id);
        });
    });
</script>



