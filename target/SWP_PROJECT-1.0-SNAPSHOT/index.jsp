
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <title>Ciklo Home</title>

        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-woox-travel.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <!--
        
        TemplateMo 580 Woox Travel
        
        https://templatemo.com/tm-580-woox-travel
        
        -->

    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <jsp:include page="HeaderNFooter/header.jsp"></jsp:include>

            <!-- ***** Main Banner Area Start ***** -->
            <section id="section-1">
                <div class="content-slider">
                    <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
                    <input type="radio" id="banner2" class="sec-1-input" name="banner">
                    <input type="radio" id="banner3" class="sec-1-input" name="banner">
                    <input type="radio" id="banner4" class="sec-1-input" name="banner">
                    <div class="slider">

                                                    <!<!-- Route list Banner here --> 
                    <%int count = 0;%>
                    <c:forEach items="${AllRoute}" var="ROUTE">
                        <% count++;%>
                        <div id="top-banner-<%=count%>" class="banner" style="  background: url('./image/Background/HoiAnBackground_<%=count%>.jpg') no-repeat center center !important;
                                                                                                                    background-size: cover  !important;">
                            <div class="banner-inner-wrapper header-text">
                                <div class="main-caption">
                                    <h2>Route</h2>
                                    <h1>${ROUTE.routeID}</h1>
                                    <div class="border-button"><a href="BookingRouteServlet">Book Now</a></div>
                                </div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="more-info">
                                                <div class="row">
                                                    <div class="col-lg-3 col-sm-6 col-6">
                                                        <i class="fa-solid fa-clock"></i>
                                                        <h4><span>Time:</span><br>${ROUTE.esTime}  Minutes</h4>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-6 col-6">
                                                        <i class="fa-solid fa-route"></i>
                                                        <h4><span>Distance</span><br>${ROUTE.distance} metters</h4>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-6 col-6">
                                                        <i class="fa-solid fa-dollar-sign"></i>
                                                        <h4><span>Price:</span><br>${ROUTE.routePrice / 100} VND</h4>
                                                    </div>
                                                    <div class="col-lg-3 col-sm-6 col-6">
                                                        <div class="main-button">
                                                            <a href="#routeListPaging">Explore More</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    </div>
                    <nav>
                        <div class="controls">
                            <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">1</span></label>
                            <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">2</span></label>
                            <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">3</span></label>
                            <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span><span class="text">4</span></label>
                        </div>
                    </nav>
                </div>
            </section>
            <!-- ***** Main Banner Area End ***** -->

            <div class="visit-country">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="section-heading">
                                <h2 class="text-info">Visit One Of Our Routes Now</h2>
                                <p>These are the routes that you can refer to. Select one of them to see detailed information about that route..</p>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="routeListPaging">
                        <div class="col-lg-8">
                            <div class="items">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <!--List  Route here -->
                                    <c:forEach items="${RouteList}" var="Route">
                                        <% int countImg = 0;%>
                                        <%Random rand = new Random();%>
                                        <div class="item">
                                            <div class="row">
                                                <div class="col-lg-4 col-sm-5">
                                                    
                                                        <img src="./image/Background/HoiAnBackground_<%=rand.nextInt(5)+1%>.jpg" alt="">
                                                    
                                                </div>
                                                <div class="col-lg-8 col-sm-7">
                                                    <div class="right-content">
                                                        <h4 class="text-info">${Route.routeID}</h4>
                                                        <span>${Route.beginLocation}</span>
                                                        <div class="main-button">
                                                            <a href="RouteDetailServlet?routeID=${Route.routeID}">Explore More</a>
                                                        </div>
                                                        <p>Short Description.</p>
                                                        <ul class="info">
                                                            <li><i class="fa-solid fa-route"></i> ${Route.distance} metters</li>
                                                            <li><i class="fa-solid fa-timeline-arrow"></i> ${Route.esTime} minutes</li>
                                                            <li><i class="fa-solid fa-money-check-dollar"></i> ${Route.routePrice / 100} VND</li>
                                                        </ul>
                                                        <div class="text-button">
                                                            <a href="RouteDetailServlet?routeID=${Route.routeID}">Need Directions ? <i class="fa fa-arrow-right"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </div>

                                    <div class="col-lg-12">
                                        <form method ="post" action="Home">
                                             <ul class="page-numbers">
                                            <li><a href="#"><i class="fa fa-arrow-left"></i></a></li>
                                                <c:forEach begin="${indexGroup}" end="${indexGroup + 3}" var="page">
                                                    <li>
                                                        <a  href="Home?indexPage=${page}&indexGroup=${indexGroup}">${page}</a>
                                                    </li>
                                                </c:forEach>
                                                    <li>
                                                        ... 
                                                    </li>
                                                     <li>
                                                        <a  href="Home?indexPage=${nOPages}&indexGroup=${indexGroup}">${nOPages}</a>
                                                    </li>
                                                    <c:if test="${indexGroup < (nOPages - 5)}">
                                                          <li><a href="Home?indexPage=${indexGroup + 3}&indexGroup=${indexGroup + 3}"><i class="fa fa-arrow-right"></i></a></li>
                                                     </c:if>

                                        </ul>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="side-bar-map">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div id="map">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12469.776493332698!2d-80.14036379941481!3d25.907788681148624!2m3!1f357.26927939317244!2f20.870722720054623!3f0!3m2!1i1024!2i768!4f35!3m3!1m2!1s0x88d9add4b4ac788f%3A0xe77469d09480fcdb!2sSunny%20Isles%20Beach!5e1!3m2!1sen!2sth!4v1642869952544!5m2!1sen!2sth" width="100%" height="550px" frameborder="0" style="border:0; border-radius: 23px; " allowfullscreen=""></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="call-to-action">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <h2>Are You Looking To Travel ?</h2>
                            <h4>Make A Reservation By Clicking The Button</h4>
                        </div>
                        <div class="col-lg-4">
                            <div class="border-button">
                                <a href="reservation.html">Book Yours Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Footer-->
        <jsp:include page="HeaderNFooter/footer.jsp"></jsp:include>


        <!-- Scripts -->
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/wow.js"></script>
        <script src="assets/js/tabs.js"></script>
        <script src="assets/js/popup.js"></script>
        <script src="assets/js/custom.js"></script>

        <script>
            function bannerSwitcher() {
                next = $('.sec-1-input').filter(':checked').next('.sec-1-input');
                if (next.length)
                    next.prop('checked', true);
                else
                    $('.sec-1-input').first().prop('checked', true);
            }

            var bannerTimer = setInterval(bannerSwitcher, 5000);

            $('nav .controls label').click(function () {
                clearInterval(bannerTimer);
                bannerTimer = setInterval(bannerSwitcher, 5000);
            });
        </script>

    </body>

</html>

