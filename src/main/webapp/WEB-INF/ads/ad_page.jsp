<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link href="${pageContext.request.contextPath}/css/homepage.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <%--===================================================--%>

    <%--TODO fix this--%>
    <h3>Here is an individual ad!</h3>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>
                <c:out value="${ad.title}" />
            </h2>
            <p>
                <c:out value="${ad.description}" />
            </p>
        </div>
    </c:forEach>




    <%--===================================================--%>

    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</body>
</html>