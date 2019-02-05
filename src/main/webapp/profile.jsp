<%--
  Created by IntelliJ IDEA.
  User: ronsoeum
  Date: 2019-02-05
  Time: 09:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/navbar.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/footer.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <%@ include file="partials/navbar.jsp" %>
    <h1>You logged in as an admin!</h1>
    <%@ include file="partials/footer.jsp" %>
</body>
</html>
