<%-- 
    Document   : booking
    Created on : Oct 6, 2022, 10:00:46 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <title>Booking Page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/booking.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->
<style>
/*    body{
    padding:0;
    margin:0;
    width:100%;
    height:100vh;
    background:radial-gradient(#9b59b6, #8e44ad);
}*/
.wrapper{
    width:200px;
    height:60px;
    position: absolute;
    left:50%;
    top:50%;
    transform: translate(-50%, -50%);
}
.circle{
    width:20px;
    height:20px;
    position: absolute;
    border-radius: 50%;
    background-color: #fff;
    left:15%;
    transform-origin: 50%;
    animation: circle .5s alternate infinite ease;
}

@keyframes circle{
    0%{
        top:60px;
        height:5px;
        border-radius: 50px 50px 25px 25px;
        transform: scaleX(1.7);
    }
    40%{
        height:20px;
        border-radius: 50%;
        transform: scaleX(1);
    }
    100%{
        top:0%;
    }
}
.circle:nth-child(2){
    left:45%;
    animation-delay: .2s;
}
.circle:nth-child(3){
    left:auto;
    right:15%;
    animation-delay: .3s;
}
.shadow{
    width:20px;
    height:4px;
    border-radius: 50%;
    background-color: rgba(0,0,0,.5);
    position: absolute;
    top:62px;
    transform-origin: 50%;
    z-index: -1;
    left:15%;
    filter: blur(1px);
    animation: shadow .5s alternate infinite ease;
}

@keyframes shadow{
    0%{
        transform: scaleX(1.5);
    }
    40%{
        transform: scaleX(1);
        opacity: .7;
    }
    100%{
        transform: scaleX(.2);
        opacity: .4;
    }
}
.shadow:nth-child(4){
    left: 45%;
    animation-delay: .2s
}
.shadow:nth-child(5){
    left:auto;
    right:15%;
    animation-delay: .3s;
}
.wrapper span{
    position: absolute;
    top:75px;
    font-family: 'Lato';
    font-size: 20px;
    letter-spacing: 12px;
    color: #fff;
    left:15%;
}

.bell{
    margin: 1% !important;
  display:block;
  width: 40px;
  height: 40px;
  font-size: 40px;
  margin:50px auto 0;
  color: #9e9e9e;
  -webkit-animation: ring 4s .7s ease-in-out infinite;
  -webkit-transform-origin: 50% 4px;
  -moz-animation: ring 4s .7s ease-in-out infinite;
  -moz-transform-origin: 50% 4px;
  animation: ring 4s .7s ease-in-out infinite;
  transform-origin: 50% 4px;
}

@-webkit-keyframes ring {
  0% { -webkit-transform: rotateZ(0); }
  1% { -webkit-transform: rotateZ(30deg); }
  3% { -webkit-transform: rotateZ(-28deg); }
  5% { -webkit-transform: rotateZ(34deg); }
  7% { -webkit-transform: rotateZ(-32deg); }
  9% { -webkit-transform: rotateZ(30deg); }
  11% { -webkit-transform: rotateZ(-28deg); }
  13% { -webkit-transform: rotateZ(26deg); }
  15% { -webkit-transform: rotateZ(-24deg); }
  17% { -webkit-transform: rotateZ(22deg); }
  19% { -webkit-transform: rotateZ(-20deg); }
  21% { -webkit-transform: rotateZ(18deg); }
  23% { -webkit-transform: rotateZ(-16deg); }
  25% { -webkit-transform: rotateZ(14deg); }
  27% { -webkit-transform: rotateZ(-12deg); }
  29% { -webkit-transform: rotateZ(10deg); }
  31% { -webkit-transform: rotateZ(-8deg); }
  33% { -webkit-transform: rotateZ(6deg); }
  35% { -webkit-transform: rotateZ(-4deg); }
  37% { -webkit-transform: rotateZ(2deg); }
  39% { -webkit-transform: rotateZ(-1deg); }
  41% { -webkit-transform: rotateZ(1deg); }

  43% { -webkit-transform: rotateZ(0); }
  100% { -webkit-transform: rotateZ(0); }
}

@-moz-keyframes ring {
  0% { -moz-transform: rotate(0); }
  1% { -moz-transform: rotate(30deg); }
  3% { -moz-transform: rotate(-28deg); }
  5% { -moz-transform: rotate(34deg); }
  7% { -moz-transform: rotate(-32deg); }
  9% { -moz-transform: rotate(30deg); }
  11% { -moz-transform: rotate(-28deg); }
  13% { -moz-transform: rotate(26deg); }
  15% { -moz-transform: rotate(-24deg); }
  17% { -moz-transform: rotate(22deg); }
  19% { -moz-transform: rotate(-20deg); }
  21% { -moz-transform: rotate(18deg); }
  23% { -moz-transform: rotate(-16deg); }
  25% { -moz-transform: rotate(14deg); }
  27% { -moz-transform: rotate(-12deg); }
  29% { -moz-transform: rotate(10deg); }
  31% { -moz-transform: rotate(-8deg); }
  33% { -moz-transform: rotate(6deg); }
  35% { -moz-transform: rotate(-4deg); }
  37% { -moz-transform: rotate(2deg); }
  39% { -moz-transform: rotate(-1deg); }
  41% { -moz-transform: rotate(1deg); }

  43% { -moz-transform: rotate(0); }
  100% { -moz-transform: rotate(0); }
}

@keyframes ring {
  0% { transform: rotate(0); }
  1% { transform: rotate(30deg); }
  3% { transform: rotate(-28deg); }
  5% { transform: rotate(34deg); }
  7% { transform: rotate(-32deg); }
  9% { transform: rotate(30deg); }
  11% { transform: rotate(-28deg); }
  13% { transform: rotate(26deg); }
  15% { transform: rotate(-24deg); }
  17% { transform: rotate(22deg); }
  19% { transform: rotate(-20deg); }
  21% { transform: rotate(18deg); }
  23% { transform: rotate(-16deg); }
  25% { transform: rotate(14deg); }
  27% { transform: rotate(-12deg); }
  29% { transform: rotate(10deg); }
  31% { transform: rotate(-8deg); }
  33% { transform: rotate(6deg); }
  35% { transform: rotate(-4deg); }
  37% { transform: rotate(2deg); }
  39% { transform: rotate(-1deg); }
  41% { transform: rotate(1deg); }

  43% { transform: rotate(0); }
  100% { transform: rotate(0); }
}

    .comfirmInfor {
            width: 110%;
            height: 54px;
            background-color: transparent;
            border-radius: 23px;
            border: 1px solid #22b3c1;
            padding: 0px 20px;
            cursor: pointer;
            margin-bottom: 10px;
            color: black;
            line-height: 54px;
            font-size: 28px;
            margin-right: 2%;
    }
    
    fieldset{
        text-align: center;
    }
    
    .section-heading h2 {
        margin-top: 0px;
        margin-bottom: 20px;
        line-height: 36px;
        font-size: 30px;
        font-weight: 700;
        text-transform: capitalize;
        color:#e3dada;
    }
    .station__match_12{
    width: 45%;
    top: 15%;
    left: 7%;
    position: absolute;
    background: transparent;
    display: none;
}

.station__match_14{
    width: 14%;
    top: 21%;
    left: -3%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_15{
    width: 47%;
    top: 19%;
    left: 3%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_23{
    width: 38%;
    top: 16.5%;
    left: 51%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_25{
    width: 6%;
    top: 24.5%;
    left: 52%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_36{
    width: 8%;
    top: 18.5%;
    left: 88%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_47{
    width: 42%;
    top: 41%;
    left: 10%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_56{
    width: 41%;
    top: 36.5%;
    left: 52%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_57{
    width: 6%;
    top: 48.5%;
    left: 51.5%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_68{
    width: 8%;
    top: 35.5%;
    left: 91.5%;
    position: absolute;
    background: transparent;
        display: none;
}

.station__match_78{
    width: 43%;
    top: 64%;
    left: 52.5%;
    position: absolute;
    background: transparent;
        display: none;
}

</style>
  </head>
<body onload="getDriverResponseMessages();">

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

  <div class="second-page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h4>Book Cyclo Tickets Here</h4>
          <h2 >Make Your Reservation</h2>
          <p>Here allows you to provide information about your current location, destination and the stations you want to go through. You can then choose a cyclo to help you enjoy your ride.</p>
          <!-- <div class="main-button"><a href="about.html">Discover More</a></div> -->
        </div>
      </div>
    </div>
  </div>

  <div class="reservation-form" >
    <div class="container">
      <div class="row">
        <div class="col-lg-12 reservation_map">
          <div id="map">
            <image src="./assets/images/HoiAnSWP.png"></image>
                <!-- Begin Station icons -->
                <div class="station station_1">
                  <div class="station_bound">
                    <div class="station__number">Station 1</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> --><div class="station__location" style="
                                                                                                                            position: absolute;
                                                                                                                            top: -165%;
                                                                                                                            background: bisque;
                                                                                                                            border-radius: 9px;
                                                                                                                            padding: 3px;
                                                                                                                            color: black;"></div>
                    <div class="station__numberOfDriver" style="display: none;
                    position: absolute;
                    right: -120%;
                    background: #37378b;
                    padding: 0 4px;
                    border-radius: 4px;
                "><div class="numberOfDriver__Value" style="
                    display: inline-block;
                ">3</div> drivers around here</div>                                                                                                         
                  </div>
                </div>
                
                <div class="station station_2">
                  <div class="station_bound">
                    <div class="station__number">Station 2</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> --><div class="station__location" style="
                                                                                                                    position: absolute;
                                                                                                                    top: -165%;
                                                                                                                    background: bisque;
                                                                                                                    border-radius: 9px;
                                                                                                                    padding: 3px;
                                                                                                                    color: black;"></div>
                    <div class="station__numberOfDriver" style="display: none;
                    position: absolute;
                    right: -120%;
                    background: #37378b;
                    padding: 0 4px;
                    border-radius: 4px;
                "><div class="numberOfDriver__Value" style="
                    display: inline-block;
                ">3</div> drivers around here</div>  
                  </div>
                </div>

                <div class="station station_3">
                    <div class="station_bound">
                      <div class="station__number">Station 3</div>
                      <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                      <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                      <!-- <i class="fa-solid fa-street-view"></i> --><div class="station__location" style="
                                                                                                                    position: absolute;
                                                                                                                    top: -165%;
                                                                                                                    background: bisque;
                                                                                                                    border-radius: 9px;
                                                                                                                    padding: 3px;
                                                                                                                    color: black;"></div>
                                                                                                                                       <div class="station__numberOfDriver" style="display: none;
                    position: absolute;
                    right: -120%;
                    background: #37378b;
                    padding: 0 4px;
                    border-radius: 4px;
                "><div class="numberOfDriver__Value" style="
                    display: inline-block;
                ">3</div> drivers around here</div>  
                    </div>
                </div>

                <div class="station station_4">
                  <div class="station_bound">
                    <div class="station__number">Station 4</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> --><div class="station__location" style="
                                                                                                                    position: absolute;
                                                                                                                    top: -165%;
                                                                                                                    background: bisque;
                                                                                                                    border-radius: 9px;
                                                                                                                    padding: 3px;
                                                                                                                    color: black;"></div>
                                                                                                                                        <div class="station__numberOfDriver" style="display: none;
                    position: absolute;
                    right: -120%;
                    background: #37378b;
                    padding: 0 4px;
                    border-radius: 4px;
                "><div class="numberOfDriver__Value" style="
                    display: inline-block;
                ">3</div> drivers around here</div>  
                  </div>
                </div>

                <div class="station station_5">
                  <div class="station_bound">
                    <div class="station__number">Station 5</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> --><div class="station__location" style="
                                                                                                                    position: absolute;
                                                                                                                    top: -165%;
                                                                                                                    background: bisque;
                                                                                                                    border-radius: 9px;
                                                                                                                    padding: 3px;
                                                                                                                    color: black;"></div>
                                                                                                                                        <div class="station__numberOfDriver" style="display: none;
                    position: absolute;
                    right: -120%;
                    background: #37378b;
                    padding: 0 4px;
                    border-radius: 4px;
                "><div class="numberOfDriver__Value" style="
                    display: inline-block;
                ">3</div> drivers around here</div>  
                  </div>
                </div>

                <div class="station station_6">
                  <div class="station_bound">
                    <div class="station__number">Station 6</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> --><div class="station__location" style="
                                                                                                                position: absolute;
                                                                                                                top: -165%;
                                                                                                                background: bisque;
                                                                                                                border-radius: 9px;
                                                                                                                padding: 3px;
                                                                                                                color: black;"></div>
                                                                                                                                    <div class="station__numberOfDriver" style="display: none;
                    position: absolute;
                    right: -120%;
                    background: #37378b;
                    padding: 0 4px;
                    border-radius: 4px;
                "><div class="numberOfDriver__Value" style="
                    display: inline-block;
                ">3</div> drivers around here</div>  
                  </div>
                </div>

                <div class="station station_7">
                  <div class="station_bound">
                    <div class="station__number">Station 7</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> --><div class="station__location" style="
                                                                                                            position: absolute;
                                                                                                            top: -165%;
                                                                                                            background: bisque;
                                                                                                            border-radius: 9px;
                                                                                                            padding: 3px;
                                                                                                            color: black;"></div>
                                                                                                                                <div class="station__numberOfDriver" style="display: none;
                    position: absolute;
                    right: -120%;
                    background: #37378b;
                    padding: 0 4px;
                    border-radius: 4px;
                "><div class="numberOfDriver__Value" style="
                    display: inline-block;
                ">3</div> drivers around here</div>  
                  </div>
                    
                    
                </div>

                <div class="station station_8">
                  <div class="station_bound">
                    <div class="station__number">Station 8</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> --><div class="station__location" style="
                                                                                                                position: absolute;
                                                                                                                top: -165%;
                                                                                                                background: bisque;
                                                                                                                border-radius: 9px;
                                                                                                                padding: 3px;
                                                                                                                color: black;"></div>
                                                                                                                                    <div class="station__numberOfDriver" style="display: none;
                    position: absolute;
                    right: -120%;
                    background: #37378b;
                    padding: 0 4px;
                    border-radius: 4px;
                "><div class="numberOfDriver__Value" style="
                    display: inline;
                ">3</div> drivers around here</div>  
                  </div>
                </div>
                <!-- End Station icons -->
                
                <!-- Start Station route -->
                  <img src="assets/images/Route 1.png" class="station__match_12"/>
                <img src="assets/images/Route 3.png" class="station__match_14"/>
                <img src="assets/images/Route 6.png" class="station__match_15"/>
                <img src="assets/images/Route 2.png" class="station__match_23"/>
                <img src="assets/images/Route 4.png" class="station__match_25"/>
                <img src="assets/images/Route 5.png" class="station__match_36"/>
                <img src="assets/images/Route 10.png" class="station__match_47"/>
                <img src="assets/images/Route 7.png" class="station__match_56"/>
                <img src="assets/images/Route 8.png" class="station__match_57"/>
                <img src="assets/images/Route 9.png" class="station__match_68"/>
                <img src="assets/images/Route 11.png" class="station__match_78"/>
                <!-- End Station route -->
          </div>
        </div>
        <div class="col-lg-12">
          <form id="reservation-form" action="BookingRouteServlet">
            <div class="row">
              <div class="col-lg-12">
                <h4>Confirm Your <em>Reservation</em> Through This <em>Form</em></h4>
              </div>
                <div class="row" id="comfirmArea" style="margin-bottom: 4%;">
<!--                    <div class="col-lg-2" style="margin-right:4%;">
                      <fieldset>
                          <i class="fa-light fa-hand-point-right"></i>
                          <label for="Name" class="form-label">Your Start Station Your Start Station  Your Start Station Your Start Station</label>
                          <div class="comfirmInfor">Station 1</div>
                          <label for="Name" class="form-label">Address</label>
                      </fieldset>
                  </div>
                    <div class="col-lg-2" style="margin-right:4%;">
                    <fieldset>
                          <i class="fa-light fa-hand-point-right"></i>
                          <label for="Name" class="form-label">Your Destination</label>
                          <div class="comfirmInfor">Station 5</div>
                    </fieldset>
                  </div>-->
                </div>
             
                <div class="col-lg-12" id="nullStation" style="display: none;">
                  <fieldset>
                      <label for="chooseDestination" class="form-label">Please choose your Trip first</label>
                  </fieldset>
              </div>
                
                <div class="col-lg-12 route__infor-Show" style="
                                                background: bisque;
                                                display: flex;
                                                justify-content: space-between;
                                                padding: 3%;
                                                width: 80%;
                                                margin-left: 10%;
                                                margin-bottom: 4%;
                                                border-radius: 20px;
                                                color: black;
                                                display: none;
                                            ">
                        
                    </div>
                
               <div class="col-lg-6">                        
                  <fieldset>
                      <button type="submit" class="main-button" style="background-color: #dd5656">Reset Your Reservation </button>
                  </fieldset>
              </div>
              <div class="col-lg-6">                        
                  <fieldset>
                      <div class="main-button" onclick="loadDriver()" style="font-size: 14px;
                                                                                                            color: #fff;
                                                                                                            background-color: #22b3c1;
                                                                                                            border: 1px solid #22b3c1;
                                                                                                            padding: 12px 30px;
                                                                                                            width: 100%;
                                                                                                            text-align: center;
                                                                                                            display: inline-block;
                                                                                                            border-radius: 25px;
                                                                                                            font-weight: 500;
                                                                                                            text-transform: capitalize;
                                                                                                            letter-spacing: 0.5px;
                                                                                                            transition: all .3s;
                                                                                                            position: relative;
                                                                                                            overflow: hidden;
                                                                                                            cursor: pointer">See the cyclos around you</div>
                  </fieldset>
              </div>

            </div>
          </form>
        </div>
      </div>



    </div>
  </div>
  
    <div class="amazing-deals">
    <div class="container">
        <div class="row" id="DriverContent">
        <div class="col-lg-6 offset-lg-3">
          <div class="section-heading text-center">
            <h2>Choose your driver and Enjoy your trip</h2>
            <p>Here is a list of cyclists at your station, choose one of them and enjoy your cyclo tour of Hoi An.</p>
          </div>
                <div class="col-lg-12" id="nullStation_2">
                  <fieldset>
                      <label for="chooseDestination" class="form-label">Please choose your Trip first</label>
                  </fieldset>
              </div>
        </div>


      </div>
           <div class="col-lg-12">
                 <div class="main-button  loadMoreBtn" style="display: none;">
                     <a href=#" onclick="loadMoreDriver()">Load More</a>
                  </div>
        </div>
       
    </div>
        
      </div>
  <form class="col-lg-12" method="post" action="CallDriverServlet">
                 <div class="main-button  loadMoreBtn" >
                                 <%   String iD = "";
                                    if(session.getAttribute("ID") != null){
                                        iD = session.getAttribute("ID").toString();
                                %>
                                <input class="UserID" hidden name="UserID" value="<%=iD%>" />
                                <%}%>
                       <input hidden id="ListOfSelectedRoutesHidden" name="ListOfSelectedRoutes" value=""/>
                    
                     <button type="submit"  onclick="postMessageDriver()"
                        style="margin-left: 36%;
                                    font-size: 24px;
                                    color: #fff;
                                    background-color: #22b3c1;
                                    border: 1px solid #22b3c1;
                                    padding: 12px 30px;
                                    display: inline-block;
                                    border-radius: 25px;
                                    font-weight: 500;
                                    text-transform: capitalize;
                                    letter-spacing: 0.5px;
                                    transition: all .3s;
                                    position: relative;
                                    overflow: hidden;
                                    margin-bottom: 2%;">Find cyclo riders near you</button>
                  </div>
        </form>
  
  <div class="col-lg-12 waiting" style="position: relative;    margin-bottom: 12%;
                                                                        margin-top: 5%; display: none;">
    <div class="wrapper">
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="shadow"></div>
        <div class="shadow"></div>
        <div class="shadow"></div>
        <span>Waiting</span>
    </div>




  </div>
  
  

  
    </div>
        
                           <%   
                                    if(session.getAttribute("ID") != null){
                                        iD = session.getAttribute("ID").toString();
                                %>
                                <input class="UserID" hidden name="UserID" value="<%=iD%>" />
                                <%}%>

  </div>


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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
      var body = document.querySelector('body');
    var stations = document.querySelectorAll('.station_address');
    var comfirmArea = document.querySelector('#comfirmArea');
    var loadMoreBtn = document.querySelector('.loadMoreBtn');
    var selectedStationColor = "rgb(9, 95, 199)";
    var matchedStation = "rgb(9, 95, 100)";
    var normalStation = "rgb(219, 224, 230)";
    var routes = new Array();
    var numberOfSelectedRoute = 0;
    var listOfSelectedRoutes = new Array();
    var startStation;
    
    
    
    body.onload = () => {
        nullStation.style.display = 'block';
        
    }

    $(".option").click(function(){
      $(".option").removeClass("active");
      $(this).addClass("active"); 
    });
    
        <c:if test="${empty ROUTES}">
            routes.push("No routes found");
    </c:if>
           <c:forEach items="${ROUTES}" var="route">
                    routes.push("${route}");
            </c:forEach>

    stations.forEach((station) => {
      station.addEventListener("click", function(){
          nullStation.style.display = 'none';
          numberOfSelectedRoute ++;
          if(numberOfSelectedRoute == 1)
              startStation = station.parentNode.childNodes[1].innerText.split(' ')[1];
          //console.log('Number of Selected Routes : ' + numberOfSelectedRoute);
        station.style.color = selectedStationColor;
        listOfSelectedRoutes.push(station.parentNode.childNodes[1].innerText.split(' ')[1]);
        // Tim tram dau duoc chon

//          Loai bo lien ket cua Station cu
           listOfSelectedRoutes.forEach(route => {
               if(route != station.parentNode.childNodes[1].innerText.split(' ')[1]){                  
               console.log('Route in list of selected : ' + route);            
                   searchUnMatchedStation(route, station.parentNode.childNodes[1].innerText.split(' ')[1]);
               }
           })
        
        searchMatchedStation(station.parentNode.childNodes[1].innerText.split(' ')[1]);
        let location = seachLocaltion(station.parentNode.childNodes[1].innerText.split(' ')[1]);
        console.log('Get Location : ' + location);
        if(numberOfSelectedRoute == 1)           
            comfirmArea.innerHTML += createRoute(station.parentNode.childNodes[1].innerText, 'Start Station', location);
        else 
            comfirmArea.innerHTML += createRoute(station.parentNode.childNodes[1].innerText, '', location);
        
        if(numberOfSelectedRoute > 1){
                matchStations(listOfSelectedRoutes[numberOfSelectedRoute - 1], listOfSelectedRoutes[numberOfSelectedRoute - 2])
                var endStation = document.querySelectorAll('.isEndStation');
                        if(numberOfSelectedRoute >= 3){
                          for(var i = 1; i <= endStation.length - 2; i++){
                              endStation[i].innerText = "";
                            }
                        }
           endStation[numberOfSelectedRoute - 1].innerText = "End Station";
           
           loadRouteTotal();
           document.querySelector('.route__infor-Show').style.display = 'flex';
        }


      });
    });
    
    stations.forEach((station) => {
//        numberOfDriver__Value
        station.onmouseover = function(){
            var stationLocation = station.parentNode.childNodes[8]
            var stationNumber = station.parentNode.childNodes[1].innerText.split(' ')[1]
            var numberOfDriverHidden = station.parentNode.childNodes[10]
            var numberOfDriverValue = station.parentNode.childNodes[10].querySelector('.numberOfDriver__Value')
            numberOfDriverHidden.style.display = 'block';
            routes.forEach(route =>{
                if(route.includes('beginNumber=' + stationNumber)){ 
                    stationLocation.innerText = route.split(', ')[1].split('=')[1]
                }
            })
            
            loadNumberDriver(stationNumber, numberOfDriverValue);
        }
        
        station.onmouseout = function(){
             var stationLocation = station.parentNode.childNodes[8].innerText = "";
             station.parentNode.childNodes[10].style.display = "none";
        }
    });
    
         function loadNumberDriver(stationNumber, position){
            $.ajax({
                url: "/SWP_PROJECT/CalculateTotalDriverServlet",
                type: "get",
                data: {
                    station: stationNumber
                },
                success: function (data){
                    position.innerText = data;
                    position.style.display = "inline;";
                },
                error: function(xhr){
                    console.log(xhr);
                }
            })
        }
    
        function loadRouteTotal(){
            $.ajax({
                url: "/SWP_PROJECT/CalculateTotalRouteServlet",
                type: "get",
                data: {
                    listOfSelectedRoutes: listOfSelectedRoutes.toString()
                },
                success: function (data){
                    var total = document.querySelector('.route__infor-Show');
                    total.innerHTML = data;
                },
                error: function(xhr){
                    
                }
            })
        }
    
    //station__match_78
    function matchStations(station1, station2){
        console.log("Match : " + station1 + station2 )
        if(station1 < station2){
            document.querySelector('.station__match_' + station1.toString() + station2.toString()).style.display = "block";
        }
        else
             document.querySelector('.station__match_' + station2.toString() + station1.toString()).style.display = "block";
    }
    
    function createRoute(routeStation, startStation, location){
        return `<div class="col-lg-2" style="margin-right:3%;">
                      <fieldset>
                          <i class="fa-light fa-hand-point-right"></i>
                          <label for="Name" class="form-label" style="height: 70px;">` +location+`</label>
                          <div class="comfirmInfor">` + routeStation + `</div>
                          <label for="Name" class="form-label isEndStation">`+startStation+`</label>
                      </fieldset>
                  </div>`;
    }
    
    function seachLocaltion(stationNumber){
        console.log('Search : ' +stationNumber);
        var location;
       routes.forEach((route) => {
           if(route.includes('beginNumber=' + stationNumber)){ 
               console.log('Location : ' + route.split(', ')[1].split('=')[1])
                location =  (route.split(', ')[1].split('=')[1])
           }
       })
       return location;
    }
   
   // Lam nhung tram cuoi sang len tu 1 tram dau
   function searchMatchedStation(startStation){
       var listInString;
       listOfSelectedRoutes.forEach(route => {
           listInString += route;
       })
       console.log('Selected Station ' + startStation);
       routes.forEach((route) => {
           if(route.includes('beginNumber=' + startStation) && !(listInString.includes(route.split(', ')[4].split('=')[1]))){ 
               MatchStation(route.split(', ')[4].split('=')[1]);
           }
       })
   }
   
   // Tim dau cuoi theo Station
   function searchUnMatchedStation(startStation,currentStation){
       var listInString;
       listOfSelectedRoutes.forEach(route => {
           listInString += route;
       })
       routes.forEach((route) => {
           if(route.includes('beginNumber=' + startStation) && !(listInString.includes(route.split(', ')[4].split('=')[1]))){ 
               unMatchedStation(route.split(', ')[4].split('=')[1]);
           }
       })
   }

//    Thay doi mau tram cuoi
    function MatchStation(endStation){
        stations.forEach((station) => {
              if(station.parentNode.childNodes[1].innerText.split(' ')[1] == endStation){
                 station.style.color = matchedStation;
            }
        })
    }
    
  //    Thay doi mau tram cuoi  
    function unMatchedStation(endStation){
         stations.forEach((station) => {
              if(station.parentNode.childNodes[1].innerText.split(' ')[1] == endStation){
                 station.style.color = normalStation;
            }
        })
    }
    
    function loadMoreDriver(){
            var amount = document.getElementsByClassName("driver").length;
            $.ajax({
                url: "/SWP_PROJECT/DisplayDriverServlet",
                type: "get",
                data: {
                    exists: amount,
                    currentStation: "ST" + startStation
                },
                success: function (data){
                    var drivers = document.querySelector('#DriverContent');
                    drivers.innerHTML += data;
                },
                error: function(xhr){
                    
                }
            })
    }
    
    function loadDriver(){
        window.scrollTo(0, 3000)
        loadMoreBtn.style.display = "block";
        document.querySelector('#nullStation_2').style.display = "none";
            $.ajax({
                url: "/SWP_PROJECT/DisplayDriverServlet",
                type: "post",
                data: {
                    exists: 0,
                    currentStation: "ST" + startStation
                },
                success: function (data){
                    var drivers = document.querySelector('#DriverContent');
                    drivers.innerHTML += data;
                },
                error: function(xhr){
                    
                }
            })
            

    }
    
    
    // End of booking 
    
    // Start of Call driver
         function postMessageDriver() {
                const userId = document.querySelector(".UserID").value;
                document.querySelector(".waiting").style.display = "block";
                document.getElementById('ListOfSelectedRoutesHidden').value = listOfSelectedRoutes;
//                var xmlhttp = new XMLHttpRequest();
//                xmlhttp.open("POST", "CallDriverServlet?t="+new Date(), true);
//                xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//                xmlhttp.send("UserID="+userId+"&ListOfSelectedRoutes="+listOfSelectedRoutes);
         }
         
         // recieve driver response

         var messagesWaiting = false;
            function getDriverResponseMessages(){
                if(!messagesWaiting){
                    messagesWaiting = true;
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange=function(){
                        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                            messagesWaiting = false;
                            var contentElement = document.getElementById("driverResContent");
                            contentElement.innerHTML = xmlhttp.responseText + contentElement.innerHTML;
                        }
                    }
                    xmlhttp.open("GET", "ResponseOfDriverServlet?t="+new Date(), true);
                    xmlhttp.send();
                }
            }
            setInterval(getDriverResponseMessages, 1000);
            
  </script>

  </body>

</html>
