<%-- 
    Document   : errorNoTrip
    Created on : Oct 30, 2022, 5:39:21 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <title>Error Page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/booking.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    </head>
    <body>
        <jsp:include page="HeaderNFooter/header.jsp"></jsp:include>
            <div class="second-page-heading">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
                
Choose your ride first and enjoy it. Have a nice day
              <h4>Oops you have a little problem</h4>
              <h2>No Trips Have Been Selected Yet</h2>
              <p>Choose your ride first and enjoy it. Have a nice day.</p>
              <!-- <div class="main-button"><a href="about.html">Discover More</a></div> -->
            </div>
          </div>
        </div>
      </div>
    <jsp:include page="HeaderNFooter/footer.jsp"></jsp:include>
    </body>
</html>
