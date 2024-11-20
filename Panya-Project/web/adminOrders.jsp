<%-- 
    Document   : adminOrders
    Created on : Jul 16, 2024, 5:27:20 PM
    Author     : Admin
--%>
<%@page import="orders.OrderItemDTO"%>
<%@page import="orders.OrderDTO"%>
<%@page import="orders.ordersDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <link rel="icon" href="assets\img\Logo_Primary.png" type="image/x-icon">
        <link rel="stylesheet" href="assets/css/admin.css">
        <link rel="stylesheet" href="assets/css/variables.css">
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <style>
            .hidden {
                display: none;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <header class="header">
                <nav class="navbar">
                    <div class="header-logo">
                        <a href="ProductController"><img src="assets\images\Logo_Basic1.png" alt="logo"></a>
                    </div>
                    <div class="welcome">
                        <div class="hello-text">
                            <p>Hello, 
                                <c:if test="${sessionScope.acc != null}">
                                    <a href="#">${sessionScope.acc.username}</a>
                                </c:if>
                        </div>
                        <a href="login?action=logout"><button class="logout">Logout</button></a>

                    </div>
                    <ul>
                        <div class="search" >
                            <form action="OrderController" method="">
                                <input type="text" name="searchValue" value="" placeholder="Enter keyword" />
                                <input type="submit" name="action" value="Search"/>
                            </form>
                        </div>
                        <button class="header-button"><a href="ProductController">Edit Cakes</a></button>
                        <button class="header-button"><a href="OrderController">Edit Orders</a></button>
                    </ul>
                </nav>
            </header>
            <div class="main">

                <div class="tableList">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Order ID</th>
                                <th>Product ID</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>State</th>
                                <th>Total price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<OrderItemDTO> list = (List<OrderItemDTO>) request.getAttribute("orderItems");
                                for (OrderItemDTO o : list) {
                                    pageContext.setAttribute("orderItem", o);
                            %>
                            <tr>
                                <td>${orderItem.getId()}</td>
                                <td>${orderItem.getOrderId()}</td>
                                <td>${orderItem.getProductId()}</td>
                                <td>${orderItem.getQuantity()}</td>                                
                                <td>${orderItem.getPrice()}</td>

                                <td class="current-state">
                                    <c:choose>
                                        <c:when test="${order.order_type == 'Online'}">
                                <p6>Online</p6>
                                </c:when>
                                <c:otherwise>
                                <p7>In-Store</p7>
                                </c:otherwise>
                            </c:choose></td>

                        <td class="current-state">
                            <c:choose>
                                <c:when test="${order.status == 'Completed'}">
                                <p3>Completed</p3>
                                </c:when>
                                <c:otherwise>
                                <p5>Pending</p5>
                                </c:otherwise>
                            </c:choose></td> 
                        <td>${order.total_price}$</td>
                        <td>
                            <!--                            <form class="icon-button" action="OrderController" method="POST" >
                                                            <input name="action" value="edit" type="hidden">
                                                            <input name="id" value="${order.id}" type="hidden">
                                                            <input type="image" src="assets/images/pen.png" alt="submit">
                                                        </form>-->

                            <form class="icon-button" action="OrderController" method="" >
                                <input name="action" value="delete" type="hidden">
                                <input name="id" value="${order.id}" type="hidden">
                                <input type="image" src="assets/images/delete.png" alt="submit">
                            </form>
                        </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            document.querySelector("#show-Create").addEventListener("click", function () {
                document.querySelector(".popup").classList.add("active");

            });

            document.querySelector(".popup .close-btn").addEventListener("click", function () {
                document.querySelector(".popup").classList.remove("active");

            });
        </script>

        <script>
            $(document).ready(function () {
                $(window).scroll(function () {
                    if ($(this).scrollTop()) {
                        $('tableList').addClass('sticky');
                    } else {
                        $('tableList').removeClass('sticky');
                    }
                })
            });
        </script>
    </body>
</html>
