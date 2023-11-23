<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Book List</title>
</head>
<body>
<div class="alert alert-info" role="alert">
  A simple info alert—check it out!
</div>
    <h2 class="hello-title">list of books</h2>
    <h2 class="hello-title">TOTAL: ${count}</h2>

    <a href="/addbook">add book</a>
    <a href="/genres">manage genres</a>

    <c:if test="${deleteBookSuccess}">
        <div>Successfully deleted Book</div>
    </c:if>

    <table>
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
                    <td><a href="/deletebook?id=${book.id}">delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div>
        <c:forEach items="${pagination.pageNumbers}" var="page">
            <c:choose>
                <c:when test="${page==pagination.currentPage}">
                    <span>${page}</span>
                </c:when>
                <c:otherwise>
                    <span><a href="/books?offset=${(page-1)*2}&limit=2&currentPage=${page}">${page}</a></span>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>


</body>
</html>