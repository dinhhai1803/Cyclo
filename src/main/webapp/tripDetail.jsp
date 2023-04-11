<%-- 
    Document   : TripDetail
    Created on : Oct 14, 2022, 10:39:48 PM
    Author     : win
--%>

<%@page import="entity.Admin"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <title>Trip Page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/booking.css">
     <link rel="stylesheet" href="assets/css/detail.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->
<style>
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

  <div class="second-page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h4>See Trip Information Here</h4>
          <h2 >Preview Your Trip</h2>
          <p>Here allows you to provide information about your current location, destination and the stations you want to go through. You can then choose a cyclo to help you enjoy your ride.</p>
          <!-- <div class="main-button"><a href="about.html">Discover More</a></div> -->
        </div>
      </div>
    </div>
  </div>

  <div class="reservation-form">
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
                    <!-- <i class="fa-solid fa-street-view"></i> -->
                  </div>
                </div>
                
                <div class="station station_2">
                  <div class="station_bound">
                    <div class="station__number">Station 2</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> -->
                  </div>
                </div>

                <div class="station station_3">
                    <div class="station_bound">
                      <div class="station__number">Station 3</div>
                      <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                      <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                      <!-- <i class="fa-solid fa-street-view"></i> -->
                    </div>
                </div>

                <div class="station station_4">
                  <div class="station_bound">
                    <div class="station__number">Station 4</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> -->
                  </div>
                </div>

                <div class="station station_5">
                  <div class="station_bound">
                    <div class="station__number">Station 5</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> -->
                  </div>
                </div>

                <div class="station station_6">
                  <div class="station_bound">
                    <div class="station__number">Station 6</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> -->
                  </div>
                </div>

                <div class="station station_7">
                  <div class="station_bound">
                    <div class="station__number">Station 7</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
                    <!-- <i class="fa-solid fa-street-view"></i> -->
                  </div>
                </div>

                <div class="station station_8">
                  <div class="station_bound">
                    <div class="station__number">Station 8</div>
                    <i class="fa-solid fa-location-pin station_address" style="z-index: 10;"></i>
                    <i class="fa-solid fa-house-user station_icon" style="z-index: 11;"></i>
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
            <form id="reservation-form" action="ResponseOfDriverServlet" method="post">
            <div class="row">
              <div class="col-lg-12">
                <h4>Confirm Your <em>Reservation</em> Through This <em>Form</em></h4>
              </div>
                <div class=" col-lg-6" id="comfirmArea" style="margin-bottom: 4%; margin-left: 8%">
                </div>
                
                <div class=" col-lg-6" id="routeInfo" style="margin-bottom: 4%; margin-left: -8%">
                    <div class="route__distance">
                    <i class="fa-solid fa-route"></i>
                    Distance <p>${DISTANCE} metters</p>
                  </div>
                  <div class="route__time">
                    <i class="fa-solid fa-clock"></i>
                    Time <p>${TIME} minutes</p>
                  </div>
                  <div class="route__price">
                    <i class="fa-solid fa-dollar-sign"></i>
                    Price <p>${PRICE} VND</p>
                  </div>
                  
                    <div class="route__price user__detail" style="    display: flex;
                                                                                                    border: none;
                                                                                                    background: bisque;
                                                                                                    border-radius: 8%;
                                                                                                    margin-top: 14%">
                        
                        
                        <%
                                    String id = "";
                                    if(session.getAttribute("ID") != null){
                                        id = session.getAttribute("ID").toString();
                                    }
                                        if(id.contains("D")){ 
                                        Driver driver = new Driver();
                                        driver = (Driver)session.getAttribute("User");
                                %>
                                                   <% if (application.getAttribute("userBookingID") != null) {%>
                                                   <input hidden id="userBookingID" name="userBookingID" value="<%=application.getAttribute("userBookingID")%>"/>
                                                    <% }%>
                                <!--Show for driver page-->
                                <input hidden id="typeOfUser" value="Driver"/>
                                         <div class="user__Image">
                                        <img src="image/avatar.png" style="width: 75%;
                                                                                                border-radius: 50%;
                                                                                            }"/>
                                    </div>
                                    <div class="user__Info" style="padding-top: 10%;">

                                        <div class="user__info-name">
                                            <i class="fa-solid fa-user" style="margin-left: -40%;"></i>
                                            <p>${USERINFO.getCusName() }</p>
                                        </div>

                                        <div class="user_info-phone">
                                            <i class="fa-solid fa-phone" style="margin-left: -40%;"></i><!-- comment -->
                                            <p>${USERINFO.getCusPhone()}</p>
                                        </div>
                                        </div>
                                <%    }

                                        if(id.contains("KH")){ 
                                        Customer customer = new Customer();
                                        customer = (Customer)session.getAttribute("User");
                                %>

                                        <!--Show for customer page-->
                                        <input hidden id="typeOfUser" value="Customer"/>
<!--                                         <div class="user__Image">
                                                <img src="image/avatar.png" style="width: 75%;
                                                                                                border-radius: 50%;
                                                                                            }"/>
                                        </div>-->
                                        <% if ( application.getAttribute("driverResponse") == null) {%>
                                           <div class="user__Image">
                                                <img src="image/avatar.png" style="width: 75%;
                                                                                                border-radius: 50%;
                                                                                            }"/>
                                            </div>
                                                <div class="user__info-name">
                                                    <p>Waiting for Driver</p>
                                                </div>

<!--                                                <div class="user_info-phone">
                                                    <i class="fa-solid fa-phone" style="margin-left: -40%;"></i> comment 
                                                    <p>${USERINFO.getCusPhone()}</p>
                                                </div>-->
                                        <% }%>
                                         <% if ( application.getAttribute("driverResponse") != null   ){%>
                                          <%= application.getAttribute("driverResponse")%>
                                           <% }%>
                                 <%    } %>
                        
                        
                      </div>
                </div>
                 

             
                <div class="col-lg-12" id="nullStation" style="display: none;">
                    <fieldset style="display: none;">
                      <label for="chooseDestination" class="form-label">Please choose your Trip first</label>
                  </fieldset>
                                           <% if ( application.getAttribute("driverResponse") != null   ){%>
                                           <input style="display: none;" hidden name="driverResponseMessage" id="driverResponseMessage" value="DriverResponsed" >
                                           <% }%>
              </div>
                                           <% if(id.contains("D") && (session.getAttribute("ISDRIVERACCEPT") == null)){ %>
               <div class="col-lg-6">                        
                  <fieldset>
                      <button type="submit" class="main-button" style="background-color: #dd5656">Decline this trip</button>
                  </fieldset>
              </div>
               <form method="post" action="ResponseOfDriverServlet" class="col-lg-6">           
                   <input hidden class="userIdDriver" name="UserID" value="<%=id%>" />
                   <input hidden class="ListOfSelectedRoutesDriver" name="ListOfSelectedRoutes" value="" />
                     <% if (application.getAttribute("userBookingID") != null) {%>
                      <input hidden class="UBID" name="userBookingIDDriver" value="<%=application.getAttribute("userBookingID")%>"/>
                       <% }%>
                       <fieldset style="margin-top: -4.5%">

                      <button type="submit" class="main-button" onclick="postResponseDriver()"  style="font-size: 14px;
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
                                                                                                            cursor: pointer;
                                                                                                            width: 49%;
                                                                                                            float: right;">Accept this trip</button>
                  </fieldset>
              </form>
               <%}%>
            </div>
          </form>
        </div>
      </div>



    </div>
  </div>
  
    <div class="amazing-deals" style="display: none;">
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
           <div class="col-lg-12" style="display: none;">
                 <div class="main-button  loadMoreBtn" >
                     <a href=#" onclick="postMessageDriver()"
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
                                    overflow: hidden;">Make your reservation now</a>
                  </div>
        </div>
    </div>
        
                           <%   String iD = "";
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
    var body = document.querySelector('body');
    var stations = document.querySelectorAll('.station_address');
    var comfirmArea = document.querySelector('#comfirmArea');
    var loadMoreBtn = document.querySelector('.loadMoreBtn');
    var selectedStationColor = "rgb(9, 95, 199)";
    var matchedStation = "rgb(9, 95, 100)";
    var normalStation = "rgb(219, 224, 230)";
    var routes = new Array();
    var userSelectedStation = new Array();
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
                
      <c:if test="${empty LISTOFSELECTEDROUTES}">
            userSelectedStation.push("No routes found");
    </c:if>
           <c:forEach items="${LISTOFSELECTEDROUTES}" var="route">
                    userSelectedStation.push("${route}");
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
            comfirmArea.innerHTML += createRoute(station.parentNode.childNodes[1].innerText.split(' ')[1], 'Start Station', location);
        else {
            if(numberOfSelectedRoute == userSelectedStation.length )
                 comfirmArea.innerHTML += createRoute(station.parentNode.childNodes[1].innerText.split(' ')[1], 'End Station', location);
             else
                  comfirmArea.innerHTML += createRoute(station.parentNode.childNodes[1].innerText.split(' ')[1], 'Middle Station', location);
        }
           
        
        if(numberOfSelectedRoute > 1){
                matchStations(listOfSelectedRoutes[numberOfSelectedRoute - 1], listOfSelectedRoutes[numberOfSelectedRoute - 2])
                var endStation = document.querySelectorAll('.isEndStation');
                        if(numberOfSelectedRoute >= 3){
                          for(var i = 1; i <= endStation.length - 2; i++){
                              endStation[i].innerText = "";
                        }
           }
           endStation[numberOfSelectedRoute - 1].innerText = "End Station";
        }

        document.querySelector('.ListOfSelectedRoutesDriver') = listOfSelectedRoutes.toString();
      });
    });
    
    userSelectedStation.forEach(uSelected => {
        stations.forEach(station => {
            var number = station.parentNode.childNodes[1].innerText.split(' ')[1];
            if(number == uSelected){
                console.log("User Selected ne : " + uSelected);
                station.click();
            }
        })
    })
    
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
        return `
              <div class="route__begin">
                `+startStation+` <p> `+routeStation+`</p>
              </div>
              <div class="route__begin_location">
                <i class="fa-solid fa-location-dot"></i>
                 `+ location +`
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
                url: "/CIKLO/DisplayDriverServlet",
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
                url: "/CIKLO/DisplayDriverServlet",
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
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("POST", "CallDriverServlet?t="+new Date(), false);
                xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xmlhttp.send("UserID="+userId+"&ListOfSelectedRoutes="+listOfSelectedRoutes);
         }
         
             // Response of driver
         function postResponseDriver() {
                const userId = document.querySelector(".UserID").value;
                const userBookID = document.getElementById('userBookingID').value
                document.querySelector('.userIdDriver').value = userId;
                document.querySelector('.ListOfSelectedRoutesDriver').value = listOfSelectedRoutes;
                document.querySelector('.userBookingIDDriver').value = userBookID;
                console.log('DinhHai');
 //               var xmlhttp = new XMLHttpRequest();
//                xmlhttp.open("POST", "ResponseOfDriverServlet?t="+new Date(), false);
//                xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//                xmlhttp.send("UserID="+userId+"&ListOfSelectedRoutes="+listOfSelectedRoutes+"&userBookingID=" + userBookID);
         }
         
         var isDriverResponsed = document.getElementById('driverResponseMessage');
         var typeOfUser = document.getElementById('typeOfUser')
         function loadResponsedPage(){
             if(isDriverResponsed == null && (typeOfUser.value == 'Customer'))
                document.location.reload();
         }
         
         setInterval(loadResponsedPage, 10000);
         
         var userBookingIDDriver = document.querySelector('.UBID')
         
  </script>

  </body>

</html>
