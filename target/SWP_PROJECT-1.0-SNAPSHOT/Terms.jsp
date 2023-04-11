<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <title>Term & Condition</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1 class="text-primary"> Example</h1>
                    <h1 class="text-warning">Hello ${NAME.cusName}</h1>

                <p class= "text-secondary">This page is the demo of the assignment, so don't worry</p>
                <div>                
                    <a class="btn btn-outline-primary my-3" href="index.jsp">Return to home page.</a>
                </div>
            </div>
        </div>
        <script>
            function displayFunc()
            {
                var check = document.getElementById("checkBox");
                var img = document.getElementById("image");
                console.log(check);
                if (check.checked === true)
                {
                    img.style.display = "block";
                } else
                {
                    img.style.display = "none";
                }
            }
        </script>
    </body>
</html>
