<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%= "some title" %></title>
    <link href="${pageContext.request.contextPath}/css/navbar.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/footer.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <%@ include file="partials/navbar.jsp" %>

    <c:if test="true">
        <h1>Variable names should be very descriptive</h1>
    </c:if>
    <c:if test="false">
        <h1>single letter variable names are good</h1>
    </c:if>

    <%@ include file="partials/footer.jsp" %>
</body>
</html>
