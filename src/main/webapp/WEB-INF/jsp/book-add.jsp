<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Add Book</title>
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


                    <c:if test="${addBookSuccess}">
                        <div class="alert alert-info" role="alert">
                            Successfully added Book
                        </div>
                    </c:if>

                    <h1>Add Our Book Collection</h1>
                    <h2>Contribute and Share Your Favorite Reads</h2>
                    <div>
                        <c:url var="add_book_url" value="/addbookpost" />
                        <form:form action="${add_book_url}" method="post" modelAttribute="book">
                            <div class="form-group py-1  w-75">
                                <form:label path="title" cssClass="text-white">Book Name: </form:label>
                                <form:input type="text" path="title" cssClass="form-control" />
                            </div>
                            <div class="form-group py-1  w-75">
                                <form:label path="description" cssClass="text-white">Description: </form:label>
                                <form:input type="text" path="description" cssClass="form-control" />
                            </div>

                            <div class="form-group py-1  w-75">
                                <form:select path="genreId" cssClass="form-control">
                                    <c:forEach items="${genres}" var="genre">
                                        <form:option value="${genre.id}">${genre.name}</form:option>
                                    </c:forEach>
                                </form:select>
                            </div>

                            <div class="py-1  w-75">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form:form>
                    </div>

                    <div class="pt-5 d-flex justify-content-center justify-content-lg-start">
                        <a href="/books" class="glightbox btn-watch-video"><i class="bi bi-book"></i><span>Back</span></a>
                      </div>

                </div>

                <div class="col-lg-6 order-1 order-lg-2 hero-img">
                    <img src="assets/img/hero-img-3.png" class="img-fluid " alt="">
                </div>
            </div>
        </div>


    </section>
</body>

</html>