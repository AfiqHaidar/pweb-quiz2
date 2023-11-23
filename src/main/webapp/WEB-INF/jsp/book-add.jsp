<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add Book</title>
    </head>
    <body>
        <a href="/books">back</a>
        <c:if test="${addBookSuccess}">
            <div>Successfully added Book</div>
        </c:if>

        <c:url var="add_book_url" value="/addbookpost"/>
        <form:form action="${add_book_url}" method="post" modelAttribute="book">
            <form:label path="title">Book Name: </form:label> <form:input type="text" path="title"/>
            <form:label path="description">Description Name: </form:label> <form:input path="description"/>
            <form:select path="genreId">
                <c:forEach items="${genres}" var="genre">
                    <form:option value="${genre.id}">${genre.name}</form:option>
                </c:forEach>
            </form:select>
            <input type="submit" value="submit"/>
        </form:form>
    </body>
</html>