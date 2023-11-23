<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Genres</title>
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

                    <h1>Explore The Genres!</h1>
                    <h2>Dive into a World of Literary Diversity</h2>

                    <c:if test="${deleteGenreSuccess}">
                        <div class="alert alert-info" role="alert">
                            Successfully deleted Genre
                        </div>
                    </c:if>

                    <div>
                        <table class="table  table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${genres}" var="genre">
                                    <tr>
                                        <td>${genre.id}</td>
                                        <td>${genre.name}</td>
                                        <td><a href="/deletegenre?id=${genre.id}">delete</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="pt-5 d-flex justify-content-center justify-content-lg-start">
                        <a href="/addgenre" class="btn-get-started scrollto">Add Genre</a>
                        <a href="/books" class="glightbox btn-watch-video"><i
                                class="bi bi-book"></i><span>Books</span></a>
                    </div>

                </div>
                <!-- Image -->
                <div class="col-lg-6 order-1 order-lg-2 hero-img">
                    <img src="assets/img/hero-img-3.png" class="img-fluid animated" alt="">
                </div>
            </div>


        </div>
        </div>

    </section>
</body>

</html>