<%-- 
    Document   : auth
    Created on : 10 oct. 2023, 12:10:57
    Author     : Lachgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connexion</title>
        <link rel="icon" type="image/png" href="ressources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="ressources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="ressources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="ressources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="ressources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="ressources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="ressources/css/util.css">
	<link rel="stylesheet" type="text/css" href="ressources/css/main.css">
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100" style="display: flex; flex-direction:column">
                <div>
                    <%
                        HttpSession ses = request.getSession();
                        String isPasswordChanged = (String) ses.getAttribute("password_changed");

                        // Check if password has changed
                        if(isPasswordChanged != null && isPasswordChanged.equals("changed")) {
                     %>
                        <div id="msg" style="margin-bottom: 10px;background-color: green;color:white; padding:10px; border-radius: 8px">
                          Password recovered successfully
                          <button id="close_msg">
                              <span class="me-1">
                                <i class="fa fa-close" style="color:white"></i>
                            </span>
                          </button>
                        </div>
                    <%
                        // Clear the error message from the session after displaying it
//                        session.removeAttribute("message");
                      }
                    %>
                    
                    <%
                        // Retrieve the "msg" attribute value
                        String message = (String) request.getAttribute("msg");
                        // Check if the message is not null and not empty
                        if (message != null && !message.isEmpty()) {
                    %>
                        <div id="error_container" style="background-color:  red;color:white; padding:10px 20px;border-radius: 8px;margin-bottom: 8px">
                            <%= message %>
                            <button id="close_error">
                                <span class="me-1">
                                  <i class="fa fa-close" style="color:white"></i>
                                </span>
                            </button>
                        </div>
                    <%
                        }
                    %>
                </div>
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                            <img src="ressources/images/img-01.png" alt="IMG">
                    </div>
                    <form action="auth" method="POST" class="login100-form validate-form">
                        <span class="login100-form-title">
                            Login
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="email" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                    Login
                            </button>
                        </div>

                        <div class="text-center p-t-12">
                            <span class="txt1">
                                    Forgot
                            </span>
                            <a class="txt2" href="/session/forgetPassword">
                                    Password?
                            </a>
                        </div>

                        <div class="text-center p-t-30">
                            <a class="txt2" href="/session/inscription">
                                Create your Account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
	</div>             
        
        <script src="ressources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="ressources/vendor/bootstrap/js/popper.js"></script>
	<script src="ressources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="ressources/vendor/select2/select2.min.js"></script>
	<script src="ressources/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
            $('.js-tilt').tilt({
                    scale: 1.1
            })
            
            document.querySelector("#close_msg").addEventListener('click', () => {
                document.querySelector("#msg").remove();
                <%
                    ses.removeAttribute("password_changed");
                %>
            })
            
            document.querySelector("#close_error").addEventListener('click', () => {
                document.querySelector("#error_container").remove();
            })
            
            document.addEventListener("DOMContentLoaded", () => {
                <%
                    ses.removeAttribute("password_changed");
                    request.removeAttribute("msg");
                %>
            })
	</script>
	<script src="ressources/js/main.js"></script>                  
    </body>
</html>
