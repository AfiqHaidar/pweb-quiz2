<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Book</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="../assets/img/favicon.png" rel="icon">

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet">
</head>

<body>
    <section id="hero" class="d-flex align-items-center">

        <div class="container">
            <div class="row">
                <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1">

                    <h1>All The Books In The World!</h1>
                    <h2>Discover Worlds Between the Pages</h2>



                    <c:if test="${deleteBookSuccess}">

                        <div class="alert alert-info" role="alert">
                            Successfully deleted Book
                        </div>
                    </c:if>

                    <c:if test="${updateBookSuccess}">

                        <div class="alert alert-info" role="alert">
                        Successfully updated Book
                        </div>
                    </c:if>

                    <table class="table  table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Genre</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${books}" var="book">
                                <tr>
                                    <td>${book.id}</td>
                                    <td>${book.title}</td>
                                    <td>${book.description}</td>
                                    <td>${book.genreName}</td>
                                    <td><a href="/deletebook?id=${book.id}">delete</a> <a
                                            href="/updatebook?id=${book.id}">update</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>



                    <div class="d-flex justify-content-center">
                        <c:forEach items="${pagination.pageNumbers}" var="page">
                            <c:choose>
                                <c:when test="${page==pagination.currentPage}">
                                    <span class="glightbox btn-watch-video" style="color: #FFC300">${page}</span>
                                </c:when>
                                <c:otherwise>
                                    <span><a href="/books?offset=${(page-1)*10}&limit=10&currentPage=${page}"
                                            class="glightbox btn-watch-video">${page}</a></span>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                    </div>

                    <div class="pt-5 d-flex justify-content-center justify-content-lg-start">
                        <a href="/addbook" class="btn-get-started scrollto">Add Books</a>
                        <a href="/genres" class="glightbox btn-watch-video"><i
                                class="bi bi-archive"></i><span>Genre</span></a>
                    </div>

                </div>

                <div class="col-lg-6 order-1 order-lg-2 hero-img">
                    <img src="assets/img/hero-img-3.png" class="img-fluid animated" alt="">
                </div>


            </div>
        </div>

    </section>
</body>

</html>