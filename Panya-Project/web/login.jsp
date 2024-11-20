<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/variables.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="icon" href="assets/img/Logo_Primary.png" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div class="login-background">
        <div class="login-form-wrapper">
            <form action="login" method="post">
                <h1>Login</h1>

  

                <div class="login-form-input-box">
                    <input type="text" name="username" placeholder="Username" required>
                    <i class='bx bxs-user'></i>
                </div>

                <div class="login-form-input-box">
                    <input type="password" name="password" placeholder="Password" required>
                    <i class='bx bxs-lock'></i>
                </div>
                
                 <c:if test="${not empty errorMessage}">
                    <p class="error-text">${errorMessage}</p>
                </c:if>

                <button type="submit" class="login-submit-button">Sign In</button>

                <div class="login-form-signup-link">
                    <p>Don't have an account? <a href="signUp.jsp">Sign up</a></p>
                </div>
                
             </form>
        </div>
    </div>   
</body>

</html>
