
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panya</title>
    <link rel="icon" href="assets\img\Logo_Primary.png" type="imgae/x-icon">
    <link rel="stylesheet" href="assets\css\main.css">
    <link rel="stylesheet" href="assets\css\variables.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>

<body>
    <div id="wrapper">
        <header class="main-header">
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
                <p>Panya bakery</p>
            </div>

        </header>



        <main id="main">
            <section class="bestseller">
                <h1>Bestseller <i class='bx bxs-star' style='color:#ffff00'></i></h1>

                <div class="bestseller-card-wrapper">
                    <div class="bestseller-card">
                        <img src="assets\product-images\RedVelvetCake.jpg" alt="picture">
                        <h3 class="bestseller-card-content white-text">Red Velvet Cake</h3>
                        <p class="bestseller-card-content yellow-text">Soft red velvet cake with cream cheese frosting</p>
                        <p class="bestseller-card-content white-text">80.000</p>
                    </div>

                    <div class="bestseller-card">
                        <img src="assets\product-images\MatchaCake.jpg" alt="picture">
                        <h3 class="bestseller-card-content white-text">Matcha Cake</h3>
                        <p class="bestseller-card-content yellow-text">Japanese green tea-flavored cake</p>
                        <p class="bestseller-card-content white-text">80.000</p>
                    </div>

                    <div class="bestseller-card">
                        <img src="assets\product-images\Tiramisu.jpg" alt="picture">
                        <h3 class="bestseller-card-content white-text">Tiramisu</h3>
                        <p class="bestseller-card-content yellow-text">Italian dessert with layers of coffee-soaked sponge and mascarpone</p>
                        <p class="bestseller-card-content white-text">80.000</p>
                    </div>

                    <div class="bestseller-card">
                        <img src="assets\product-images\BananaBread.jpg" alt="picture">
                        <h3 class="bestseller-card-content white-text">Banana Bread</h3>
                        <p class="bestseller-card-content yellow-text">Moist, sweet bread made with bananas</p>
                        <p class="bestseller-card-content white-text">50.000</p>
                    </div>

                    <div class="bestseller-card">
                        <img src="assets\product-images\RyeBread.jpg" alt="picture">
                        <h3 class="bestseller-card-content white-text">Rye Bread</h3>
                        <p class="bestseller-card-content yellow-text">Dense bread made with rye flour</p>
                        <p class="bestseller-card-content white-text">50.000</p>
                    </div>

                    <div class="bestseller-card">
                        <img src="assets\product-images\MatchaLatte.jpg" alt="picture">
                        <h3 class="bestseller-card-content white-text">Matcha Latte</h3>
                        <p class="bestseller-card-content yellow-text">Japanese matcha green tea with steamed milk</p>
                        <p class="bestseller-card-content white-text">60.000</p>
                    </div>
                </div>
            </section>

            <section class="comingsoon">
                <h1>Coming soon <i class='bx bxs-timer' style='color:#ffff00'></i></h1>

                <div class="comingsoon-card-wrapper">
                    <div class="comingsoon-card big">
                        <img src="assets\images\Greentea.jpg" alt="picture">
                        <h3 class="bestseller-card-content blue-text">Thailand Green Milk Tea</h3>
                        <p class="bestseller-card-content yellow-text">Perfect tea from Thailand</p>
                        <p class="bestseller-card-content blue-text">70.000</p>
                    </div>

                    <div class="comingsoon-card small1">
                        <img src="assets\images\Cupcake.jpg" alt="picture">
                        <h3 class="bestseller-card-content blue-text">Cupcake</h3>
                        <p class="bestseller-card-content yellow-text">Delicious cupcake for birthday</p>
                        <p class="bestseller-card-content blue-text">60.000</p>
                    </div>

                    <div class="comingsoon-card small2">
                        <img src="assets\images\Kebab.jpg" alt="picture">
                        <h3 class="bestseller-card-content blue-text">Doner Kebab</h3>
                        <p class="bestseller-card-content yellow-text">Doner kebab from Turkey</p>
                        <p class="bestseller-card-content blue-text">50.000</p>
                    </div>
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
            $(window).scroll(function(){
                if($(this).scrollTop()){
                    $('nav').addClass('sticky');
                } else{
                    $('nav').removeClass('sticky');
                }
            })
        });
    </script>
</body>

</html>