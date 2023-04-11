<%@page import="java.util.ArrayList"%>
<%@page import="entity.Driver"%>
<%@page import="dao.DriverDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet" />

        <link rel="stylesheet" href="Admin/DriverUpdate/fonts/icomoon/style.css" />

        <link rel="stylesheet" href="Admin/DriverUpdate/css/owl.carousel.min.css" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="Admin/DriverUpdate/css/bootstrap.min.css" />

        <!-- Style -->
        <link rel="stylesheet" href="Admin/DriverUpdate/css/style.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

        <title>Update Driver</title>
    </head>

    <body>
        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('Admin/DriverUpdate/images/image1.jpg')"></div>
            <div class="contents order-2 order-md-1">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7">
                            <form action="AdminUpdateDriver" method="post">
                                <div class="form-group first">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" value="${driver.driverName}"/>
                                </div>

                                <div class="form-group last mb-3">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" placeholder="your-email@gmail.com " id="email" name="email" value="${driver.driverIMail}">
                                </div>

                                <div class="form-group last mb-3">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" placeholder="09x-xxxxxxx " id="phone" name="phone" value="${driver.driverIPhone}">
                                </div>

                                <div class="form-group last mb-3">
                                    <label for="CCCD">Identification</label>
                                    <input type="text" class="form-control" id="CCCD" name="CCCD" value="${driver.driverCCCD}">
                                </div>

                                <div class="form-group last my-3">
                                    <label>Gender</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="true" ${driver.driverGender == 1? "checked" : ''}>
                                        <label class="form-check-label" for="inlineRadio1">Male</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="false" ${driver.driverGender == 0? "checked" : ''}>
                                        <label class="form-check-label" for="inlineRadio2">Female</label>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-block btn-primary">
                                    Update
                                </button>
                            </form>
                            <button class="btn btn-block mt-3">

                                <a href="http://localhost:8080/SWP_PROJECT/AdminDriverAccount" class=" text-decoration-none">
                                    <i class="fa-solid fa-arrow-left "></i>
                                    Return
                                </a>
                            </button>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="Admin/DriverUpdate/js/jquery-3.3.1.min.js "></script>
        <script src="Admin/DriverUpdate/js/popper.min.js "></script>
        <script src="Admin/DriverUpdate/js/bootstrap.min.js "></script>
        <script src="Admin/DriverUpdate/js/main.js "></script>
    </body>
</html>
