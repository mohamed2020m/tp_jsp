<%-- 
    Document   : forget_password
    Created on : Oct 10, 2023, 5:33:46 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
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
            <div class="container-login100">
                <div class="wrap-login100" style="display:flex; justify-content:center;padding-bottom: 100px;">
                    ${msg}
                    <form action="forgetPassword" method="POST" class="login100-form validate-form">
                        <span class="login100-form-title">
                            Recover Password
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="email" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Continue
                            </button>
                        </div>

                        <div class="text-center p-t-12">
                            <span class="txt1">
                                    Go
                            </span>
                            <a class="txt2" href="/session/auth">
                                Back
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
	</script>
	<script src="ressources/js/main.js"></script>    
    </body>
</html>
