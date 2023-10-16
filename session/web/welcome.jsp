<%-- 
    Document   : welcome
    Created on : 10 oct. 2023, 12:25:31
    Author     : Lachgar
--%>

<%@page import="ma.projet.entity.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="icon" type="image/png" href="ressources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="ressources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="ressources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="ressources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="ressources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="ressources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="ressources/css/util.css">
	<link rel="stylesheet" type="text/css" href="ressources/css/main.css">
        <style>
            #logoutBtn:hover{
                background-color: cadetblue;
                color:white;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        
        <%
            
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            
            if(session.getAttribute("client") == null){
                response.sendRedirect("auth.jsp");
            } 

            HttpSession ses = request.getSession();
            Client c = (Client) ses.getAttribute("client");
        %>
        
       <%
        if(c != null){
        %>
        <div class="limiter">
            <div class="container-login100">
                
                <div class="wrap-login100">
                    <div class="flex flex-column">
                       <div>
                            <h1>
                                Welcome : <span style="color:gold"><%= c.getNom() %></span> 
                            </h1>
                        </div>
                        <div>
                            <h5><%=c.getEmail()%></h5>
                        </div> 
                        <form method="POST" action="Logout">
                            <!--<input type="text" hidden value="logout" name="op" />-->
                            <input id="logoutBtn" value="Logout" type="submit" class="btn btn-embossed mt-3"/>
                        </form>
                    </div>
                    
                </div>
                
            </div>
        </div>
        <%
        }
        %>
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
    </body>
</html>
