

<%@page import="entity.Admin"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Driver"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.html" class="logo">
                        <img src="assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="Home">Home</a></li>
                        <li><a href="BookingRouteServlet">Booking Trip</a></li>
                        <li><a href="reservation.html">About Us</a></li>
                        <li>
                            <form class="d-flex" role="search" id="searchBtn" method="post" action="SearchPlaceServlet">
                                <input class="form-control me-2" name="searchPlace" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-white" type="submit">Search</button>
                            </form>
                        </li>
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
                                         <p class= "text-secondary">Hello ${User.getDriverName()}</p>
                                <%    }

                                        if(id.contains("KH")){ 
                                        Customer customer = new Customer();
                                        customer = (Customer)session.getAttribute("User");
                                %>
                                         <p class= "text-secondary">Hello ${User.getCusName()}</p>
                                 <%    }

                                        if(id.contains("AD")){ 
                                        Admin admin = new Admin();
                                        admin = (Admin)session.getAttribute("User");
                                %>
                                         <p class= "text-secondary">Hello ${User.getAdName()}</p>
                                    <%    }%>

                            </div>
                        <c:if test="${not empty User}">
                            <a href="Login.jsp"><i class=""></i> Log out</ <aa>
                                    </c:if>
                            </div>
                        </li>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->
