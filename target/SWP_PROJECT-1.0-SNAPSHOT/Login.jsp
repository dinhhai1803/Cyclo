<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>Login Page</title>

        <!<!-- Customer CSS -->
        <link rel="stylesheet" href="css/Login.css"/>
    </head>

    <body>

        <%
            String uname = "", pass = "", check = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c.getName().equals("cookieName")) {
                        uname = c.getValue();
                    } else if (c.getName().equals("cookiePass")) {
                        pass = c.getValue();
                    } else if (c.getName().equals("remember")) {
                        check = c.getValue();
                    }
                }
            }
        %>

        <div class="cont mt-5">
            <div class="form sign-in">
                <h2>Welcome back,</h2>
                <form action="LoginServlet" method="POST">
                    <label>
                        <span>Username or Email</span>
                        <input type="text" name="username" value="<%=uname%>">
                    </label>
                    <label>
                        <span>Password</span>
                        <input type="password" name="pass" value="<%=pass%>">
                    </label>
                    <div class="row mt-3">
                        <div class="d-flex justify-content-center">
                            <div class="col-lg-4 col-md-4">
                                <input type="checkbox" class="" id="checkBox" name="check" value="1" <%= "1".equals(check) ? "checked='/checked'" : ""%> >
                            </div>
                            <div class="col-lg-3 col-md-4" style="color: #d4af7a">
                                Remember me
                            </div>
                        </div>
                        <a class="forgot-pass" href="#">Forgot password?</a>
                    </div>
                    <button type="submit" class="submit">LogIn</button>
                </form> 
                <hr style=" border-top: 5px solid #00000;">
                
                <button type="submit" class="fb-btn">
                    <a class="text-decoration-none" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/CikloWeb/LoginGoogleHandler&response_type=code
                       &client_id=220909469087-l7a8vpj10m5it3oohjbd3p40lqsjre1e.apps.googleusercontent.com&approval_prompt=force">
                        Sign Up by <span>Google</span>
                    </a>
                </button>
                <label class="text-warning">${Error}</label>
                <label class="text-success">${Success}</label>
            </div>
            <div class="sub-cont">
                <div class="img">
                    <div class="img__text m--up">
                        <h2>New here?</h2>
                        <p>Sign up and discover great amount of new opportunities!</p>
                    </div>
                    <div class="img__text m--in">
                        <h2>One of us?</h2>
                        <p>If you already has an account, just sign in. We've missed you!</p>
                    </div>
                    <div class="img__btn">
                        <span class="m--up">Sign Up</span>
                        <span class="m--in">Sign In</span>
                    </div>
                </div>
                <div class="form sign-up">
                    <form action="SignupServlet" method="POST" style="margin-top: -60px">
                        <label>
                            <span>Username</span>
                            <input type="text" name="username" required/>
                        </label>
                        <label>
                            <span>Email</span>
                            <input type="email" name="email" required/>
                        </label>
                        <label>
                            <span>Password</span>
                            <input type="password" name = "pass" required/>
                        </label>
                        <label>
                            <span>Name</span>
                            <input type="text" name="name" required/>
                        </label>
                        <label>
                            <span>Phone</span>
                            <input type="tel" name="phone" pattern="^09[0-9]{8}" required/>
                        </label>
                        <button type="submit" class="submit">Sign Up</button>
                    </form>
                </div>
            </div>
        </div>   

        <script>
            document.querySelector('.img__btn').addEventListener('click', function () {
                document.querySelector('.cont').classList.toggle('s--signup');
            });
        </script>
    </body>

</html>