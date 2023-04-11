

<%@page import="entity.Admin"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Driver"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    :root {
    --white-color: #fff;
    --black-color: #000;
    --text-color: #333;
    --primary-color: #EE4D2D;
    --border-color: #dbdbdb;
    --star-gold-color: #FFCE3E;
    --growth-from: 0.7s;
    --growth-to: 1s;
    
    --header-height: 120px;
    --navbar-height: 34px;
    --header-with-search: calc(var(--header-height) - var(--navbar-height));
    --header-sort-bar-height: 46px;
} 

/** {
    box-sizing: inherit;
}*/

/*html {
    font-size: 62.5%;
    line-height: 1.6rem;
    font-family: 'Roboto', sans-serif;
    box-sizing: border-box;
}*/
    /* header notificaiton */
.header__notify {
    position: absolute;
    z-index: 1;
    top: 45%;
    right: 30%;
    width: 404px;
    background-color: var(--white-color);
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 2px;
    transform-origin: calc(100% - 32px) top;
    animation: headerNotifyGrowth ease-in 0.2s;
    will-change: opacity, transform;
    display: none; 
}

.header__navbar-item--has-notify:hover .header__notify {
    display: block;
}

.header__notify::before {
    content: "";
    border-width: 20px 27px;
    border-style: solid;
    border-color: transparent transparent var(--white-color) transparent;
    position: absolute;
    right: 0;
    top: -30px;
}

.header__notify::after {
    content: "";
    display: block;
    position: absolute;
    right: 0;
    top: -16px;
    width: 90px;
    height: 20px;
}

@keyframes headerNotifyGrowth {
    from {
        opacity: 0;
        transform : scale(0);
    }
    to {
        opacity: 1;
        transform : scale(1);
    }
}

.header__notify-header {
    height: 40px;
    color: var(--white-color);
    cursor: default;
}

.header__notify-header h3 {
    color: #999;
    margin: 0;
    font-weight: 400;
    font-size: 1.4rem;
    line-height: 40px;
    margin: 0 0 0 12px;
    user-select: none;
    font-size: 18px;
}

.header__notify-list {
    padding-left: 0;
}

.header__notify-item {
    display: flex;
    border-bottom: 1px solid #cabebe;
}

.header__notify-item:hover {
    background-color: #f7f7f7;
}

.header__notify-item--viewed {
    background-color: rgba(238, 75, 43, 0.08);
}

.header__notify-link {
    display: flex;
    padding: 12px;
    text-decoration: none;
    width: 100%;
}

.header__notify-img {
    width: 48px;
    object-fit: contain;
}

.header__notify-info {
    margin-left: 12px;
}

.header__notify-name {
    display: block;
    font-size: 16px;
    color: var(--black-color);
    font-weight: 400;
    line-height: 1.8rem;
}

.header__notify-description {
    display: block;
    font-size: 12px;
    color: #756F6E;
    line-height: 1.6rem;
    margin-top: 4px;
}

.header__notify-footer {
    display: flex;
    padding: 0;
}

.header__notify-footer-btn {
    text-decoration: none;
    color: var(--black-color);
    padding: 8px 48px;
    text-align: center;
    width: 100%;
    font-size: 1.4rem;
    font-weight: 400;
}
 .nut_dropdown {
        background-color: rgba(255,255,255,0);
        background-color: Transparent;
        background-repeat:no-repeat;
        border: none;
        color: #FFF;
        padding: 16px;
        font-size: 13px;
        border: none;
    }

    .nut_dropdown:hover {
        background-color: rgba(255,255,255,0);
        background-color: Transparent;
        background-repeat:no-repeat;
        border: none;
        color: #D10024;
        padding: 16px;
        font-size: 13px;
        border: none;
    }
    /* Thiết lập vị trí cho thẻ div với class dropdown*/
    .dropdown {
        position: relative;
        display: inline-block;
    }
    /* Nội dung Dropdown */
    .noidung_dropdown {
        /*Ẩn nội dụng các đường dẫn*/
        margin-top:30px;
        border-radius: 8px;
        display: none;
        position: absolute;
        background: rgb(34,179,193);
        background: linear-gradient(0deg, rgba(34,179,193,0.6982143199076505) 0%, rgba(0,0,0,0.40129555240064774) 100%);
        min-width: 166px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    /* Thiết kế style cho các đường dẫn tronng Dropdown */
    .noidung_dropdown a {
        color: #D10024;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .hienThi{
        display:block;
    }
</style>
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky" onload="getMessages();">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/Home" class="logo">
                         <img src="assets/images/logoPic_white.png" alt="" style="        width: 62px;
                                                                                                                                margin-top: -10px;">
                        <img src="assets/images/logoName_white.png" alt="" style="        width: 126px;
                                                                                                                                margin-top: -12px;
                                                                                                                                margin-left: -20px;">

                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                                  <%   String iD = "";
                                    if(session.getAttribute("ID") != null){
                                        iD = session.getAttribute("ID").toString();
                                    }
                                        if(iD.contains("KH")){ 
                                %>
                                    <li><a href="Home" class="active">Home</a></li>
                                    <li><a href="BookingRouteServlet">Booking Trip</a></li>

                                  <%  if(session.getAttribute("LISTOFSELECTEDROUTES") != null){%>
                                        <li><a href="tripDetail.jsp">Your  Trip</a></li>
                               <% }else { %>
                                    <li><a href="errorNoTrip.jsp">Your  Trip</a></li>
                                <%}%>
                                    
                                 <%    } 
                                      if(iD.contains("D")){ 
                                   %>
                                   <li><a href="Home">Home</a></li>
                                    <li><a href="DriverPage">Dashboard</a></li>
                                    
                                 <%  if(session.getAttribute("LISTOFSELECTEDROUTES") != null){%>
                                       <li><a href="tripDetail.jsp">Current Trip</a></li>
                               <% }else { %>
                                    <li><a href="errorNoTrip.jsp">Current Trip</a></li>
                                <%}%>
                                    
                                    
                          <li class="header__navbar-item header__navbar-item--has-notify">
                            <a href="" class="header-navbar-item-link">
                                <i class="header__navbar-icon far fa-bell"></i>
                                Thông báo
                            </a>
                            <div class="header__notify">
                                <header class="header__notify-header">
                                    <h3>Thông báo mới nhận</h3>
                                </header>
                                <ul class="header__notify-list"  id="content">

                                                    <% if (application.getAttribute("messages") != null) {%>
                                                    <%= application.getAttribute("messages")%>
                                                    <% }%>
                                </ul>

                                <footer class="header__notify-footer">
                                    <a href="" class="header__notify-footer-btn">
                                        Xem tất cả
                                    </a>
                                </footer>
                            </div>
                        </li>
                                 <%    } %>
                                   <%if(!iD.contains("D")){ 
                                   %>      
                       <li>
                            <form class="d-flex" role="search" id="searchBtn" method="post" action="SearchPlaceServlet">
                                <input class="form-control me-2" name="searchPlace" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-white" type="submit">Search</button>
                            </form>
                        </li>
                        <%}%>
                        <li>    
                            <div class="d-flex">                            
                                <img src="image/avatar.png"  alt="thumbnail img" style="width: 30px; height: 30px">
                                <c:set var = "Id" value = "${ID}"></c:set>
                                
                                <%
                                    String id = "";
                                    if(session.getAttribute("ID") != null){
                                        id = session.getAttribute("ID").toString();
                                    }
                                        if(id.contains("D")){ 
                                        Driver driver = new Driver();
                                        driver = (Driver)session.getAttribute("User");
                                %>
                                <p class= "text-secondary" style="cursor: pointer">Hello ${User.getDriverName()}</p>
                                <%    }

                                        if(id.contains("KH")){ 
                                        Customer customer = new Customer();
                                        customer = (Customer)session.getAttribute("User");
                                %>
                                         <p class= "text-secondary" style="cursor: pointer">Hello ${User.getCusName()}</p>
                                 <%    }

                                        if(id.equals("AD")){ 
                                        Admin admin = new Admin();
                                        admin = (Admin)session.getAttribute("User");
                                %>
                                         <p class= "text-secondary" style="cursor: pointer">Hello ${User.getAdName()}</p>
                                    <%    }%>

                                    <%if(id.contains("D")){ 
                                        Driver driver = new Driver();
                                        driver = (Driver)session.getAttribute("User");
                                %>
                                         <div class="noidung_dropdown">
                                            <a id="dropItem" href="UpdateAccountServlet?id=${User.driverID}" style="font-size: 14px" >Manager Account</a>
                                            <hr class="solid" style="border-top: 1px solid #D9D9D9;">
                                            <a id="dropItem" href="LogoutServlet" style="margin-top: -20px; font-size: 14px">Logout</a>
                                        </div>
                                <%    }

                                        if(id.contains("KH")){ 
                                        Customer customer = new Customer();
                                        customer = (Customer)session.getAttribute("User");
                                %>
                                        <div class="noidung_dropdown">
                                            <a id="dropItem" href="UpdateAccountServlet?id=${User.cusID}" style="font-size: 14px" >Manager Account</a>
                                            <a id="dropItem" href="" style="margin-bottom:-20px;font-size: 14px">View Bill</a>
                                            <hr class="solid" style="border-top: 1px solid #D9D9D9;">
                                            <a id="dropItem" href="LogoutServlet" style="margin-top: -20px; font-size: 14px">Logout</a>
                                        </div>
                                 <%    }

                                        if(id.equals("AD")){ 
                                        Admin admin = new Admin();
                                        admin = (Admin)session.getAttribute("User");
                                %>
                                       <div class="noidung_dropdown">
                                            <a id="dropItem" href="UpdateAccountServlet?id=${User.cusID}" style="font-size: 14px" >Manager Account</a>
                                            <hr class="solid" style="border-top: 1px solid #D9D9D9;">
                                            <a id="dropItem" href="LogoutServlet" style="margin-top: -20px; font-size: 14px">Logout</a>
                                        </div>
                                    <%    }%>
                       </div>
                          
                            </div>
                        </li>
                    </ul>   

                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
       <script>
           
           document.querySelectorAll('.nav li a').forEach((item) => {
                item.addEventListener("click", function(){
                   item.classList.add("active");
               })
           })
                                
             var messagesWaiting = false;
            function getMessages(){
                if(!messagesWaiting){
                    messagesWaiting = true;
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange=function(){
                        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                            messagesWaiting = false;
                            var contentElement = document.getElementById("content");
                            contentElement.innerHTML = xmlhttp.responseText + contentElement.innerHTML;
                        }
                    }
                    xmlhttp.open("GET", "CallDriverServlet?t="+new Date(), true);
                    xmlhttp.send();
                }
            }
            setInterval(getMessages, 1000);
            
            function testDuplicatedNoti(){
                var array = document.querySelectorAll('#content li')
                for(var i = 0; i < array.length - 1; i++){
                    for(var j = i +1; j < array.length ; j++){
                        if((array[i].querySelector('a').href == array[j].querySelector('a').href)){
                            array[j].display = 'none';
                        }
                    }
                }
            }
            
                                     function hamDropdown() {
                                            document.querySelector(".noidung_dropdown").classList.toggle("hienThi");
                                        }
            
            setInterval(testDuplicatedNoti, 500)
            

            var count = 0;
            document.querySelector('.text-secondary').addEventListener("click", function(){
               count++;
                if(count % 2 !=0)
                    document.querySelector('.noidung_dropdown').style.display = "block"
                else
                    document.querySelector('.noidung_dropdown').style.display = "none"
            })

            
            

                            </script>
<!-- ***** Header Area End ***** -->
