<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet" />

        <link rel="stylesheet" href="fonts/icomoon/style.css" />

        <link rel="stylesheet" href="css/UpdateCss/owl.carousel.min.css" />

        <!-- Bootstrap CSS -->
        <!--        <link rel="stylesheet" href="css/UpdateCss/bootstrap.min.css" />-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- Style -->
        <link rel="stylesheet" href="css/UpdateCss/style.css" />

        <title>Update</title>
    </head>

    <body>
        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('image/Background/image1.jpg')"></div>
            <div class="contents order-2 order-md-1">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7">
                            <form action="UpdateAccountServlet" method="post" enctype="multipart/form-data">

                                <div class="form-floating my-3">
                                    <input type="text" class="form-control" id="floatingPassword" placeholder="UserName" name ="username" 
                                           <c:set var = "ID" value = "${id}"></c:set>
                                           <c:if test = "${fn:contains(ID, 'KH')}">
                                               value="${u.cusUserName}" 
                                           </c:if>

                                           <c:if test = "${ ID eq 'D'}">
                                               value="${u.driverUserName}" 
                                           </c:if>

                                           <c:if test = "${ID eq 'AD'}">
                                               value="${u.adUserName}" 
                                           </c:if>
                                           required>
                                    <label for="floatingPassword">UserName</label>
                                </div>

                                <div class="form-floating my-3">
                                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name ="pass" required>
                                    <label for="floatingPassword">Password</label>
                                </div>

                                <div class="form-floating my-3">
                                    <input type="text" class="form-control" id="floatingPassword" placeholder="Name" name ="name"
                                           <c:set var = "ID" value = "${id}"></c:set>
                                           <c:if test = "${fn:contains(ID, 'KH')}">
                                               value="${u.cusName}" 
                                           </c:if>

                                           <c:if test = "${ ID eq 'D'}">
                                               value="${u.driverName}" 
                                           </c:if>

                                           <c:if test = "${ID eq 'AD'}">
                                               value="${u.adName}" 
                                           </c:if>
                                           required>
                                    <label for="floatingPassword">Name</label>
                                </div>

                                <c:if test = "${ ID eq 'D'}">
                                    <div class="form-group my-3">

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="true" ${u.driverGender == 1 ? "Checked" : ""}>
                                            <label class="form-check-label" for="inlineRadio1">Male</label>
                                        </div>


                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="false" ${u.driverGender == 0 ? "Checked" : ""}> 
                                            <label class="form-check-label" for="inlineRadio2">Female</label>
                                        </div>
                                    </div>
                                </c:if>
                                 <c:if test = "${ ID eq 'D'}">
                                    <div class="my-3">
                                        <label for="userInput" class="col-form-label">Upload Photo</label>
                                        <input class="form-control" type="file" name="photo">
                                    </div>
                                </c:if>

                                <div class="form-floating my-3">
                                    <input type="text" class="form-control" id="floatingPassword" placeholder="Phone" name ="phone" pattern="^09[0-9]{8}"

                                           <c:set var = "ID" value = "${id}"></c:set>
                                           <c:if test = "${fn:contains(ID, 'KH')}">
                                               value="${u.cusPhone}" 
                                           </c:if>

                                           <c:if test = "${ ID eq 'D'}">
                                               value="${u.driverIPhone}" 
                                           </c:if>

                                           <c:if test = "${ID eq 'AD'}">
                                               value="${u.adPhone}" 
                                           </c:if>
                                           required>
                                    <label for="floatingPassword">Phone</label>
                                </div>

                                <div class="form-floating my-3">
                                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name ="email"
                                           <c:set var = "ID" value = "${id}"></c:set>
                                           <c:if test = "${fn:contains(ID, 'KH')}">
                                               value="${u.cusMail}" 
                                           </c:if>

                                           <c:if test = "${ ID eq 'D'}">
                                               value="${u.driverIMail}" 
                                           </c:if>

                                           <c:if test = "${ID eq 'AD'}">
                                               value="${u.getAdMail()}" 
                                           </c:if>

                                           required>
                                    <label for="floatingInput">Email address</label>
                                </div>

                                <button type="submit" class="btn btn-primary">
                                    Update
                                </button>

                                <button class="btn btn-primary">
                                    <a href="Home" class="text-decoration-none text-light">
                                        Cancel
                                    </a>
                                </button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js "></script>
        <script src="js/popper.min.js "></script>
        <script src="js/bootstrap.min.js "></script>
        <script src="js/main.js "></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>                                  
    </body>

</html>