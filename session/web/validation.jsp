<%-- 
    Document   : validation
    Created on : Oct 10, 2023, 5:40:19 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validation</title>
        <link rel="stylesheet" type="text/css" href="ressources/css/style.css" />
        <link rel="stylesheet" type="text/css" href="ressources/css/util.css">
	<link rel="stylesheet" type="text/css" href="ressources/css/main.css">
        <script>
                document.addEventListener('DOMContentLoaded', function() {
                    'use strict';

                    var body = document.body;

                    function goToNextInput(e) {
                        var key = e.which || e.keyCode,
                            t = e.target,
                            sib = t.nextElementSibling;

                        if (key !== 9 && (key < 48 || key > 57)) {
                            e.preventDefault();
                            return false;
                        }

                        if (key === 9) {
                            return true;
                        }

                        if (!sib || !sib.tagName || sib.tagName.toLowerCase() !== 'input') {
                            sib = body.querySelector('input');
                        }
                        sib.select();
                        sib.focus();
                    }

                    function onKeyDown(e) {
                        var key = e.which || e.keyCode;

                        if (key === 9 || (key >= 48 && key <= 57)) {
                            return true;
                        }

                        e.preventDefault();
                        return false;
                    }

                    function onFocus(e) {
                        e.target.select();
                    }

                    body.addEventListener('keyup', function(e) {
                        if (e.target.tagName.toLowerCase() === 'input') {
                            goToNextInput(e);
                        }
                    });

                    body.addEventListener('keydown', function(e) {
                        if (e.target.tagName.toLowerCase() === 'input') {
                            onKeyDown(e);
                        }
                    });

                    body.addEventListener('click', function(e) {
                        if (e.target.tagName.toLowerCase() === 'input') {
                            onFocus(e);
                        }
                    });
                });
            </script>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div id="wrapper">
                    <div class="error_wrapper">
                        <%
                            HttpSession ses = request.getSession();
                            String errorMessage = (String) ses.getAttribute("message");

                            // Check if there is an error message to display
                            if (errorMessage != null && !errorMessage.isEmpty()) {
                          %>
                          <div class="error_message">
                            <%= errorMessage %>
                          </div>
                        <%
                            // Clear the error message from the session after displaying it
                            session.removeAttribute("message");
                          }
                        %>
                    </div>
                    <div id="dialog">
                        <h3>Please enter the 4-digit verification code we sent via your Email: </h3>
                        <span>(we want to make sure it's you before we contact our movers)</span>
                        <form action="validation" method="POST">
                            <div id="form">
                                <input type="text" name="code_digit_1" maxLength="1" size="1" min="0" max="9" pattern="[0-9]{1}" />
                                <input type="text" name="code_digit_2" maxLength="1" size="1" min="0" max="9" pattern="[0-9]{1}" />
                                <input type="text" name="code_digit_3" maxLength="1" size="1" min="0" max="9" pattern="[0-9]{1}" />
                                <input type="text" name="code_digit_4" maxLength="1" size="1" min="0" max="9" pattern="[0-9]{1}" />                     
                            </div>
                            <div>
                                <button id="verifyBtn" class="btn btn-primary btn-embossed" type="submit">Verify</button>
                            </div>
                        </form>
                        <div>
                            Didn't receive the code?<br />
                            <a href="/session/forgetPassword">Send code again</a><br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
