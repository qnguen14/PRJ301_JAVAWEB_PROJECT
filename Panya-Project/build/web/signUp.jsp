<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>
    <link rel="stylesheet" href="assets\css\main.css">
    <link rel="stylesheet" href="assets\css\variables.css">
    <link rel="stylesheet" href="assets\css\signUp.css">
    <link rel="icon" href="assets\img\Logo_Primary.png" type="imgae/x-icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>

<body>
    <div class="signUp-background">
        <div class="signUp-form-wrapper">
            <form action="./RegisterController" method = "POST">
                <h1>Sign Up</h1>

                <div class="signUp-form-input-box">
                    <input type="text" name ="username" placeholder="Username" required>
                    <i class='bx bxs-user'></i>
                </div>

                <div class="signUp-form-input-box">
                    <input type="password" name = "password" placeholder="Password" required>
                    <i class='bx bxs-lock' ></i>
                </div>

                <div class="signUp-form-input-box">
                    <input type="password" name = "re_password" placeholder="Re-enter password" required>
                    <i class='bx bxs-check-shield'></i>
                </div>
                
                 <c:if test="${not empty errorMessage}">
                    <p class="error-text">${errorMessage}</p>
                </c:if>

                <button type="submit" class="signUp-submit-button">Sign Up</button>
            </form>
        </div>
    </div>
</body>

</html>