<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
</head>
<body>
    <h2 class="hello-title">list of books</h2>

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


</body>
</html>