<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Ads</title>
    <jsp:include page="/WEB-INF/partials/head.jsp" />
    <link href="${pageContext.request.contextPath}/css/card.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <h1>Here are all the ads:</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="cards">
            <div class="card">
                <div class="card-header">
                    <h2>${ad.title}</h2>
                </div>
                <div class="card-main">
                    <p>${ad.description}</p>
                </div>
            </div>
        </div>
    </c:forEach>

    <jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>