<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add Genre</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <a href="/genres">back</a>
        <c:if test="${addGenreSuccess}">
            <div>Successfully added Genre</div>
        </c:if>

        <c:url var="add_genre_url" value="/addgenrepost"/>
        <form:form action="${add_genre_url}" method="post" modelAttribute="genre">
            <div class="form-group">
            <form:label path="name">Genre Name: </form:label> <form:input type="text" path="name"/>
            </div>
            <input type="submit" value="submit"/>
        </form:form>
    </body>
</html>