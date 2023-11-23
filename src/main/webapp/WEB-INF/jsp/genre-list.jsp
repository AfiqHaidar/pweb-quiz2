<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>genre List</title>
</head>
<body>
    <h2 class="hello-title">list of genres</h2>

    <a href="/books">back</a>

    <a href="/addgenre">add genre</a>

    <c:if test="${deleteGenreSuccess}">
        <div>Successfully deleted genre</div>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
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


</body>
</html>