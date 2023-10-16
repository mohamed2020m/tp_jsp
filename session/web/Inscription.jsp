<%-- 
    Document   : Inscription
    Created on : 10 oct. 2023, 11:54:45
    Author     : Lachgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscription</title>
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
                <div class="wrap-login100">

                    ${msg}
                    <form action="inscription" method="POST" class="login100-form validate-form">
                        <span class="login100-form-title">
                            Create new account
                        </span>
                        
                        <div class="wrap-input100 validate-input" data-validate = "LastName is required">
                            <input autofocus class="input100" type="text" name="nom" placeholder="Last Name">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </span>
                        </div>
                        
                        <div class="wrap-input100 validate-input" data-validate = "FirstName is required">
                            <input class="input100" type="text" name="prenom" placeholder="First Name">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-user-circle" aria-hidden="true"></i>
                            </span>
                        </div>
                        
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
                        
                        <div class="wrap-input100 validate-input" data-validate = "Date is required">
                            <input class="input100" type="date" name="date" placeholder="Birth Date">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                            </span>
                        </div>
                        
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Create Account
                            </button>
                        </div>
                        
                        <div class="text-center p-t-30">
                            <a class="txt2" href="/session/auth">
                                I already have an account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                    <div class="login100-pic js-tilt" data-tilt>
                            <img src="ressources/images/img-01.png" alt="IMG">
                    </div>
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
