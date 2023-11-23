<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Add Genre</title>
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


                <h1>Enrich Our Genre Collection</h1>
                <h2>Join Us in Building a Diverse Tapestry of Literary Genres</h2>
                <c:if test="${addGenreSuccess}">
                    <div class="alert alert-info" role="alert">
                        Successfully added Genre
                    </div>
                </c:if>

                <c:url var="add_genre_url" value="/addgenrepost" />
                <div>
                    <form:form action="${add_genre_url}" method="post" modelAttribute="genre">
                        <div class="form-group py-1  w-75">
                            <form:label path="name" cssClass="text-white">Genre Name: </form:label>
                            <form:input type="text" path="name" cssClass="form-control" />
                        </div>
                        <div class="py-1  w-75">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form:form>
                </div>

                <div class="pt-5 d-flex justify-content-center justify-content-lg-start">
                    <a href="/genres" class="glightbox btn-watch-video"><i
                            class="bi bi-archive"></i><span>Back</span></a>
                </div>

            </div>

            <!-- Image -->
            <div class="col-lg-6 order-1 order-lg-2 hero-img">
                <img src="assets/img/hero-img-3.png" class="img-fluid " alt="">
            </div>

        </div>
        </div>

    </section>
</body>

</html>