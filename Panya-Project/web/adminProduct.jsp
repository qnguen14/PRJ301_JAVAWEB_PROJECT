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

                <div class="addProduct">

                    <div class="popupCreate">
                        <div class="close-btn">&times;</div>
                        <div class="form">
                            <h2>Enter Information</h2>
                            <form action="ProductController" method="">
                                <div class="form-element">
                                    <label for="name">Name</label>
                                    <input type="text" name="name"  placeholder="Enter Name" />
                                </div>

                                <div class="form-element">
                                    <label for="description">Description</label>
                                    <input type="text" name="description"  placeholder="Enter Description" />
                                </div>

                                <div class="form-element">
                                    <label for="price">Price</label>
                                    <input type="text" name="price" placeholder="Enter Price" />
                                </div>

                                <div class="form-element">
                                    <label for="image">Image</label>
                                    <input type="text" name="image" placeholder="Enter Image" />
                                </div>


                                <div class="form-element">
                                    <label for="category_name">Category</label>
                                    <input type="text" name="category_name" placeholder="Enter Category" />
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
                                        <input name="action" value="insert" type="hidden" />
                                        Create </button>

                                    <button class="cancel" type="button" onclick="window.location.href='ProductController';">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="tableList" >
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Description</th>
                                    <th>Image</th>
                                    <th>Status</th>
                                    <th>Price</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="productTable">
                                <%
                                    List<productsDTO> list = (List<productsDTO>) request.getAttribute("productlist");
                                    if (list != null) {
                                    for (productsDTO p : list) {
                                        pageContext.setAttribute("p", p);
                                %>


                                <tr><td class="tableID">
                                        <a href="ProductController?action=list&id=${p.id}">${p.id}</a></td>               
                                    <td>${p.name} </td>
                                    <td>${p.category_name}</td>
                                    <td>${p.description}</td>
                                    <td class="product-image"><image src="${p.image}"></td>
                                    <td class="current-state"><c:choose>
                                            <c:when test="${p.is_in_stock}">
                                    <p3>Yes</p3>
                                    </c:when>
                                    <c:otherwise>
                                    <p4>No</p4>
                                    </c:otherwise>
                                </c:choose></td> 
                            <td>${p.price}</td>     
                            <td>
                                <form class="icon-button" action="ProductController" method="">
                                    <input name="action" value="edit" type="hidden">
                                    <input name="id" value="${p.id}" type="hidden">
                                    <input type="image" src="assets/images/pen.png" alt="delete">
                                </form>


                                <form class="icon-button" action="ProductController" method="POST">
                                    <input name="action" value="delete" type="hidden">
                                    <input name="id" value="${p.id}" type="hidden">
                                    <input type="image" src="assets/images/delete.png" alt="delete">
                                </form>
                            </td>

                            </tr>

                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </section>
                </div>
            </div>
        </div>

        <script>
            // Show Create Popup
            document.querySelector("#show-Create").addEventListener("click", function () {
                document.querySelector(".popupCreate").classList.add("active");
            });

            // Close Create Popup
            document.querySelector(".popupCreate .close-btn").addEventListener("click", function () {
                document.querySelector(".popupCreate").classList.remove("active");
            });

            // Cancel button functionality
            document.querySelector(".form-buttons .cancel").addEventListener("click", function () {
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
                });
            });
        </script>
    </body>
</html>
