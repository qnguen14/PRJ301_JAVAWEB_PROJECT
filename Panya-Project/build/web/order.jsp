<%@ page import="java.util.List" %>
<%@ page import="orders.ItemDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order</title>
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/variables.css">
        <link rel="stylesheet" href="assets/css/order.css">
        <link rel="icon" href="assets/img/Logo_Primary.png" type="image/x-icon">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div id="wrapper">
            <header class="order-header">
                <nav>
                    <div class="menu">
                        <div class="header-logo">
                            <a href="main.jsp"><img src="assets/images/Logo_Basic1.png" alt="logo"></a>
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
                    <p>Cart</p>
                </div>
            </header>
            <main id="main">
                <section class="cart-table">
                    <h1>Your Cart</h1>
                    <table class="cart-table-info">
                        <thead>
                            <tr class="cart-table-info-header">
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cart.items}">
                                <tr class="cart-table-info-display">
                                    <td><img src="${item.product.image}" alt="picture"></td>
                                    <td>${item.product.price}</td>
                                    <td class="product-number">${item.quantity}</td>
                                    <td>
                                        <form action="buy" method="post">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="productId" value="${item.product.id}">
                                            <button type="submit" class="delete-button">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </section>
                <section class="order-summary">
                    <h2>Order Summary</h2>
                    <c:set var="totalPrice" value="${0}" />
                    <c:forEach var="item" items="${cart.items}">
                        <c:set var="totalPrice" value="${totalPrice + item.product.price * item.quantity}" />
                    </c:forEach>
                    <div class="summary-item">
                        <span>Total Price:</span>
                        <span><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="$" /></span>
                    </div>
                </section>
                <section class="order-buttons">
                    <form action="buy" method="post">
                        <input type="hidden" name="action" value="checkout">
                        <button  id="alertButton" type="submit" class="checkout-button pay-button">Checkout</button>
                    </form>
                    <form action="ProductController" method="POST">
                        <button type="submit" class="continue-shopping pay-button" name="action" value="listProduct">Continue Shopping</button>
                    </form>
                </section>
            </main>
            <footer>
                <div class="footer-container">
                    <div class="footer-section logo">
                        <img src="assets/images/Logo_Basic1.png" alt="">
                    </div>
                    <div class="footer-section links">
                        <h2>Resources</h2>
                        <ul>
                            <li><a href="main.jsp">Home</a></li>
                            <li><a href="about.jsp">About us</a></li>
                            <li><a href="ProductController?action=listProduct">Menu</a></li>
                            <li><a href="order.jsp">Order</a></li>
                        </ul>
                    </div>
                    <div class="footer-section contact">
                        <h2>Contact</h2>
                        <ul>
                            <li>Email: panyashop@gmail.com</li>
                            <li>Hot line: 0912345678</li>
                            <li>Address: 123 street ABC, District Z, HCM city</li>
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

            document.getElementById("alertButton").addEventListener("click", function () {
                alert("Thank you for buying <3");
            });
        </script>
    </body>
</html>
