<%@page import="dao.*"%>
<%@page import="entity.*"%>
<%@page import="java.util.*"%>

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

        <link rel="stylesheet" href="fonts/icomoon/style.css" />

        <link rel="stylesheet" href="css/owl.carousel.min.css" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />

        <!-- Style -->
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">


        <title>Detail Bill</title>

        <style>
            .circle {
                width: 70px;
                height: 70px;
                line-height: 50px;
                border-radius: 50%;
                color: #fff;
                text-align: center;
                background: #000;
                padding: 10px 3px 0 3px;
                display: inline-block;
            }

            hr.solid {
                border-top: 3px solid #bbb;
            }
        </style>

        <style>
            input.form-control:read-only {
                background-color: #fff;
            }
        </style>
    </head>

    <body>
        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('images/image1.jpg')"></div>
            <div class="contents order-2 order-md-1">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7">
                            <h3>Detail bill <strong>${bill.billID}</strong></h3>
                            <hr class="solid" />
                            <h4 class="">Your route</h4>

                            <div class="my-3 text-center">
                                <c:forEach items="${detail}" var="bd">
                                    <c:if test="${bd.getOrderOfRoute() == 1}">
                                        <div class="circle">${bd.routeID}</div>
                                    </c:if>
                                    <c:if test="${bd.getOrderOfRoute() > 1 && bd.getOrderOfRoute() <= (detail.size())}">
                                        <div style="display: inline-block">
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </div>

                                        <div class="circle">${bd.routeID}</div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <hr class="solid" />
                            <form action="#" method="post">
                                <div class="form-group first">
                                    <label for="name">Customer</label>
                                    <c:forEach items="${cus}" var="c">
                                        <c:if test="${c.cusID == bill.cusID}">
                                            <input type="text" class="form-control" id="name" name="customer" value="${c.cusName}" readonly>
                                        </c:if>
                                    </c:forEach>

                                </div>

                                <div class="form-group first my-3">
                                    <label for="driver">Driver</label>
                                    <c:forEach items="${driver}" var="d">
                                        <c:if test="${d.driverID == bill.driverID}">
                                            <input type="text" class="form-control" id="driver" name="driver" value="${d.driverName}" readonly>
                                        </c:if>
                                    </c:forEach>

                                </div>

                                <div class="form-group first mb-3">
                                    <label for="price">Total</label>
                                    <input type="number" class="form-control" id="price" name="total" value="${bill.getTotal()}" readonly>
                                </div>

                                <div class="form-group first mb-3">
                                    <label for="date">Date</label>
                                    <input type="text" class="form-control" id="date" name="date" value="${bill.getDate()}" readonly>
                                </div>
                            </form>
                            <button class="btn btn-outline-dark">
                                <a href="http://localhost:8080/SWP_PROJECT/AdminServlet" class=" text-decoration-none">
                                    <i class="fa-solid fa-house "></i>
                                    <i class="fa-solid fa-arrow-left "></i>
                                    Return to Home Screen
                                </a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

    </body>

</html>
