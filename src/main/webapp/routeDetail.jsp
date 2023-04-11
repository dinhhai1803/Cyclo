<%-- 
    Document   : routeDetail
    Created on : Oct 2, 2022, 7:52:24 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <title>Detail Route</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/detail.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
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

  <!-- ***** Header Area Start ***** -->
  <jsp:include page="HeaderNFooter/header.jsp"></jsp:include>
  <!-- ***** Header Area End ***** -->

  <!-- ***** Main Banner Area Start ***** -->
  <div class="about-main-content">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="content" style="padding-top: 190px;">

            <!-- Image of route here -->
            <div class="blur-bg" style="      width: 100%;
      height: 100%;
      background: url(./image/MapImages/${ROUTE.routeImage})  !important;
      background-size: contain;
      background-size: cover !important;
      filter: blur(.5px) brightness(90%);
      position: absolute;
      left: 0;
      top: 0;
      z-index: 1;"></div>
            <h4></h4>
            <div class="line-dec"></div>
            <h2>Welcome To Hoi An</h2>
            <p></p>

          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- ***** Main Banner Area End ***** -->
  
  <div class="cities-town">
    <div class="container">
      <div class="row">
        <div class="slider-content">
          <div class="row"> 
            <div class="col-lg-12">
              <h2>Route ID &nbsp;&nbsp;<em>${ROUTE.routeID}</em></h2>
            </div>
            <div class="p-left col-lg-6">
              <div class="route__begin">
                Start Station <p>${ROUTE.beginNumber}</p>
              </div>
              <div class="route__begin_location">
                <i class="fa-solid fa-location-dot"></i>
                ${ROUTE.beginLocation}
              </div>
              <div class="route__end">
                End Station <p>${ROUTE.endNumber}</p>
              </div>
              <div class="route__end_location">
                <i class="fa-solid fa-location-dot"></i>
                ${ROUTE.endLocation}
              </div>
            </div>
            <div class="p-left col-lg-6">
              <div class="route__distance">
                <i class="fa-solid fa-route"></i>
                Distance <p>${ROUTE.distance} metters</p>
              </div>
              <div class="route__time">
                <i class="fa-solid fa-clock"></i>
                Time <p>${ROUTE.esTime} minutes</p>
              </div>
              <div class="route__price">
                <i class="fa-solid fa-dollar-sign"></i>
                Price <p>${ROUTE.routePrice / 100} VND</p>
              </div>
            </div>
          </div> -->

          <!-- Route info here -->
        </div>
      </div>
    </div>
  </div>

  <div class="weekly-offers">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 offset-lg-3">
          <div class="section-heading text-center">
            <h2>Famous places located along the route</h2>
            <p>Here is a list of famous places you will encounter when traveling on the route R12.</p>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-12">
          <div class="owl-weekly-offers owl-carousel">

            <!-- Place list here -->
            <c:forEach items="${LISTPLACE}" var="place">
                <div class="item">
                  <div class="thumb">
                      <img src="assets/images/offers-01.jpg" alt=""> <!<!-- Place image here -->
                    <div class="text">
                      <h4>${place.placeName}<br><span><i class="fa fa-users"></i> 234 Check Ins</span></h4>
                      <h6>$420<br><span>/person</span></h6>
                      <div class="line-dec"></div>
                      <ul>
                        <li>Details</li>
                        <li><i class="fa-solid fa-shop"></i> &nbsp;${place.placeType}</li>
                        <li><i class="fa-solid fa-location-dot"></i>  &nbsp; ${place.placeLocation}</li>
                        <li><i class="fa-regular fa-face-smile-beam"></i> &nbsp;  Welcome to Hoi An with cyclo service</li>
                      </ul>
                      <div class="main-button">
                        <a href="reservation.html">Make a Reservation</a>
                      </div>
                    </div>
                  </div>
                </div>
            </c:forEach>

          </div>
        </div>
      </div>
                         <div class="col-lg-12">
                             <div class="main-button  loadMoreBtn">
                        <a href="BookingRouteServlet" onclick="loadMoreDriver()" style="font-size: 28px;
                                                                                            margin-left: 36%;
                                                                                            margin-top: 6%;">Make a Reservation</a>
                     </div>
                </div>
    </div>

  </div>
<!-- 
  <div class="more-about">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="left-image">
            <img src="assets/images/about-left-image.jpg" alt="">
          </div>
        </div>
        <div class="col-lg-6">
          <div class="section-heading">
            <h2>Discover More About Our Country</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <div class="info-item">
                <h4>150.640 +</h4>
                <span>Total Guests Yearly</span>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="info-item">
                <h4>175.000+</h4>
                <span>Amazing Accomoditations</span>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="info-item">
                <div class="row">
                  <div class="col-lg-6">
                    <h4>12.560+</h4>
                    <span>Amazing Places</span>
                  </div>
                  <div class="col-lg-6">
                    <h4>240.580+</h4>
                    <span>Different Check-ins Yearly</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
          <div class="main-button">
            <a href="reservation.html">Discover More</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  comment
  <div class="best-locations">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 offset-lg-3">
          <div class="section-heading text-center">
            <h2>Best Locations In Caribbeans</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
          </div>
        </div>
        <div class="col-lg-8 offset-lg-2">
          <div class="options">
            <div class="option active" style="--optionBackground:url(https://buttoncreatives.com/html/woox/assets/images/best-01.jpg);">
               <div class="shadow"></div>
               <div class="label">
                  <div class="icon">
                     <i class="fas fa-expand"></i>
                  </div>
                  <div class="info">
                     <div class="main">Havana</div>
                     <div class="sub">Population: 2M</div>
                  </div>
               </div>
            </div>
            <div class="option" style="--optionBackground:url(https://buttoncreatives.com/html/woox/assets/images/best-02.jpg);">
               <div class="shadow"></div>
               <div class="label">
                  <div class="icon">
                    <i class="fas fa-expand"></i>
                  </div>
                  <div class="info">
                     <div class="main">Kingston</div>
                     <div class="sub">Population: 3.5M</div>
                  </div>
               </div>
            </div>
            <div class="option" style="--optionBackground:url(https://buttoncreatives.com/html/woox/assets/images/best-03.jpg);">
               <div class="shadow"></div>
               <div class="label">
                  <div class="icon">
                    <i class="fas fa-expand"></i>
                  </div>
                  <div class="info">
                     <div class="main">London</div>
                     <div class="sub">Population: 4.1M</div>
                  </div>
               </div>
            </div>
            <div class="option" style="--optionBackground:url(https://buttoncreatives.com/html/woox/assets/images/best-04.jpg);">
               <div class="shadow"></div>
               <div class="label">
                  <div class="icon">
                    <i class="fas fa-expand"></i>
                  </div>
                  <div class="info">
                     <div class="main">Pristina</div>
                     <div class="sub">Population: 520K</div>
                  </div>
               </div>
            </div>
            <div class="option" style="--optionBackground:url(https://buttoncreatives.com/html/woox/assets/images/best-05.jpg);">
               <div class="shadow"></div>
               <div class="label">
                  <div class="icon">
                    <i class="fas fa-expand"></i>
                  </div>
                  <div class="info">
                     <div class="main">Paris</div>
                     <div class="sub">Population: 3M</div>
                  </div>
               </div>
            </div>
         </div>
        </div>
        <div class="col-lg-12">
          <div class="main-button text-center">
            <a href="deals.html">Discover All Places</a>
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
  </div>  -->

<jsp:include page="HeaderNFooter/footer.jsp"></jsp:include>


  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/wow.js"></script>
  <script src="assets/js/tabs.js"></script>
  <script src="assets/js/popup.js"></script>
  <script src="assets/js/custom.js"></script>

  <script>
    $(".option").click(function(){
      $(".option").removeClass("active");
      $(this).addClass("active"); 
    });
  </script>

  </body>

</html>

