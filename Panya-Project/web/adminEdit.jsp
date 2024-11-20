<%@page import="products.productsDAO"%>
<%@page import="products.productsDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

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
                        <div class="search">
                            <form action="ProductController" method="">
                                <input type="text" name="searchValue" value="" placeholder="Enter keyword" />
                                <input type="submit" name="action" value="Search"/>
                            </form>
                        </div>
                        <button class="header-button" id="show-Create">Add Cake</button>
                        <button class="header-button"><a href="ProductController">Edit Cakes</a></button>
                        <button class="header-button"><a href="OrderController">Edit Orders</a></button>
                    </ul>
                </nav>
            </header>

            <div class="main">
                <div class="popupUpdate">
                    <div class="form">
                        <h2>Enter Information</h2>
                        <form action="ProductController" method="">
                            <input type="hidden" name="id" value="${requestScope.p.id}" />
                            <div class="form-element">
                                <label for="name">Name</label>
                                <input type="text" name="name" value="${requestScope.p.name}" placeholder="Enter Name" />
                            </div>

                            <div class="form-element">
                                <label for="description">Description</label>
                                <input type="text" name="description" value="${requestScope.p.description}" placeholder="Enter Description" />
                            </div>

                            <div class="form-element">
                                <label for="price">Price</label>
                                <input type="text" name="price" value="${requestScope.p.price}" placeholder="Enter Price" />
                            </div>

                            <div class="form-element">
                                <label for="image">Image</label>
                                <input type="text" name="image" value="${requestScope.p.image}" placeholder="Enter Image" />
                            </div>


                            <div class="form-element">
                                <label for="category_name">Category</label>
                                <input type="text" name="category_name" value="${requestScope.p.category_name}" placeholder="Enter Category" />
                            </div>

                            <div class="form-element">

                                <p2>In Stock</p2>
                                <div>
                                    <input type="radio" id="yes" name="status" value="true" ${requestScope.p.is_in_stock ? 'checked' : ''} />
                                    <label for="yes">Yes</label>

                                    <input type="radio" id="no" name="status" value="false" ${requestScope.p.is_in_stock ? 'checked' : ''} />
                                    <label for="no">No</label>
                                </div>
                            </div>

                            <div class="form-buttons">
                                <button type="submit">
                                    <input name="action" value="${requestScope.nextaction}" type="hidden" />
                                    Save </button>

                                <button class="cancel" type="button" onclick="window.location.href='ProductController';">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
