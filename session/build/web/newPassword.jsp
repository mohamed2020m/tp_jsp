<%-- 
    Document   : newPassword
    Created on : Oct 10, 2023, 5:43:55 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Password</title>
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
            <div class="container-login100" >
                <div class="wrap-login100" style="display:flex; justify-content:center; padding-bottom: 100px;">
                    ${msg}
                    <form action="new_password" method="POST" class="login100-form validate-form">
                        <span class="login100-form-title">
                            Recover password
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input class="input100" type="password" name="new_password" placeholder="New Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Confirme password is required">
                            <input class="input100" type="password" name="confirme_new_password" placeholder="Confirme Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                    <i class="fa fa-repeat" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Recover password
                            </button>
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
