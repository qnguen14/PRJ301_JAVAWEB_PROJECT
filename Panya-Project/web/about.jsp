<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About us</title>
    <link rel="stylesheet" href="assets\css\main.css">  
    <link rel="stylesheet" href="assets\css\about.css">
    <link rel="stylesheet" href="assets\css\variables.css">
    <link rel="icon" href="assets\img\Logo_Primary.png" type="imgae/x-icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jacques+Francois&display=swap" rel="stylesheet">

</head>


<body>
    <div id="wrapper">
        <header class="about-header">
            <nav>
                <div class="menu">
                    <div class="header-logo">
                        <a href="main.jsp"><img src="assets\images\Logo_Basic1.png" alt="logo"></a>
                    </div>

                    <ul>
                            <li><a href="ProductController?action=listProduct">Menu</a></li>
                            <li><a href="about.jsp">About Us</a></li>
                                <c:if test="${sessionScope.acc == null}">
                                <li><a href="login.jsp" class="header_loginbutton">Login</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acc != null}">
                                <li><a href="">Hello ${sessionScope.acc.username}</a></li>
                                <li><a href="login?action=logout" class="header_loginbutton">Logout</a></li>
                                </c:if>
                            <li><a href="order.jsp" class="cart-icon">
                                    <i class='bx bxs-cart'></i>
                                    <p class="size-number">${sessionScope.size}</p>
                                </a>
                            </li>
                        </ul>
                </div>

            </nav>

            <div class="header-text-center">
                <p>About us</p>
            </div>

        </header>



        <main id="main">
            <section class="row">
                <div class="story">
                    <img src="assets/images/About.png" alt="Bakery">
                    <div class="essay">
                        <h1>OUR STORY</h1>
                        <p class="intro">Welcome to Panya Bakery, where we bake happiness!</p>
                        <p>We're a passionate team of bakers dedicated to creating delicious treats using only the
                            finest ingredients.
                            From mouthwatering pastries to melt-in-your-mouth cakes,
                            we have something to satisfy every sweet tooth.
                            We believe that fresh-baked goodness brings people together,
                            and we love seeing our customers enjoy our creations.</p>
                    </div>
                </div>
            </section>

            <h2 class="title2">OUR VALUES</h2>

            <section class="slogans">
                <section class="box">
                    <section class="icons">
                        <img src="assets/images/bread.png" alt="Quality">
                        <h3>Quality</h3>
                        <p>Fine Requirements,</p>
                        <p>Delicious Results.</p>
                    </section>
        
                    <section class="icons">
                        <img src="assets/images/happy.png" alt="Community">
                        <h3>Community</h3>
                        <p>Where connections</p>
                        <p>Bake up.</p>
                    </section>
        
                    <section class="icons">
                        <img src="assets/images/cupcake.png" alt="Fresh Daily">
                        <h3>Fresh Daily</h3>
                        <p>Because flavor</p>
                        <p>matters.</p>
                    </section>
        
                    <section class="icons">
                        <img src="assets/images/heart.png" alt="Baked with Passion">
                        <h3>Baked with Passion</h3>
                        <p>In every bite.</p>
                    </section>
                </section>
            </section>

            <section class="quote">
                <div class="box">
                    <h4>Savoring every crumb of bakery bliss.</h4>
                </div>
            </section>
        </main>

        <footer>
            <div class="footer-container">
                <div class="footer-section logo">
                    <img src="assets\images\Logo_Basic1.png" alt="">
                </div>
                <div class="footer-section links">
                    <h2>Resources</h2>
                    <ul>
                        <li><a href="main.jsp">Home</a></li>
                        <li><a href="about.jsp">About us</a></li>
                        <li><a href="menu.jsp">Menu</a></li>
                        <li><a href="order.jsp">Order</a></li>
                    </ul>
                </div>
                <div class="footer-section contact">
                    <h2>Contact</h2>
                    <ul>
                        <li>Email: panyashop@gmail.com</li>
                        <li>Hot line: 0912345678</li>
                        <li>Adress: 123 steert ABC, District Z, HCM city</li>
                    </ul>
                </div>
                <div class="footer-section social">
                    <h2>Follow Us</h2>
                    <ul>
                        <li><a href="#"><i class='bx bxl-facebook-circle' style='color:#ffffff'></i></a></li>
                        <li><a href="#"><i class='bx bxl-instagram-alt' style='color:#ffffff'></i> </a></li>
                        <li><a href="#"><i class='bx bxl-shopify' style='color:#ffffff'></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; 2024 Panya | Group 07
            </div>
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('nav').addClass('sticky');
                } else {
                    $('nav').removeClass('sticky');
                }
            })
        });
    </script>
</body>

</html>