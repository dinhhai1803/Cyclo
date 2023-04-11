
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script>
            window.console = window.console || function (t) {};
        </script>
        <script>
            if (document.location.search.match(/type=embed/gi)) {
                window.parent.postMessage("resize", "*");
            }
        </script>
        <link rel="stylesheet" href="../css/ErrorPage.css"/>
        <title>404</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    </head>
    <body>

        <section class="wrapper">

            <div class="container">

                <div id="scene" class="scene" data-hover-only="false">


                    <div class="circle" data-depth="1.2"></div>

                    <div class="one" data-depth="0.9">
                        <div class="content">
                            <span class="piece"></span>
                            <span class="piece"></span>
                            <span class="piece"></span>
                        </div>
                    </div>

                    <div class="two" data-depth="0.60">
                        <div class="content">
                            <span class="piece"></span>
                            <span class="piece"></span>
                            <span class="piece"></span>
                        </div>
                    </div>

                    <div class="three" data-depth="0.40">
                        <div class="content">
                            <span class="piece"></span>
                            <span class="piece"></span>
                            <span class="piece"></span>
                        </div>
                    </div>

                    <p class="p404" data-depth="0.50">404</p>
                    <p class="p404" data-depth="0.10">404</p>

                </div>

                <div class="text">
                    <article>
                        <p>Uh oh! Looks like you got lost. <br>Go back to the homepage if you dare!</p>
                        <button class="btn btn-outline-dark"><a href="../index.jsp"> <i class="bi bi-arrow-left"></i></a></button>
                    </article>
                </div>

            </div>
        </section>

        <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/parallax/3.1.0/parallax.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script id="rendered-js">
// Parallax Code
            var scene = document.getElementById('scene');
            var parallax = new Parallax(scene);
//# sourceURL=pen.js
        </script>
    </body>
</html>
