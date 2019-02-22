<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <%--<link href="${pageContext.request.contextPath}/css/categories.css" type="text/css" rel="stylesheet" />--%>
    <link href="${pageContext.request.contextPath}/css/ad_page.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h4 class="f-color-g"><c:out value="${ad.title}"/></h4>
            <p class="bottom_line f-color">
                <span>Ad ID:&nbsp;</span>
                <span><c:out value="${ad.id}"/></span>
            </p>
        <div class="price mb-3">
            <h5 class="my-auto">$<c:out value="${ad.price}"/></h5>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12 p-0">
                <div id = "main_image">
                    <img src="${ad.image}">
                </div>
            </div>
            <div class="col-lg-4 col-md-3 col-sm-6 align-self-center p-0">
                <p class="entry_address"><c:out value="${ad.location}"/></p>
                <p class="classified_city"><c:out value="${ad.city}"/></p>
                <p class="zip_code"><c:out value="${ad.zipCode}"/></p>
                <p class="publish_date">Listed On: <c:out value="${ad.listedOn}"/></p>
            </div>
            <div class="col-lg-4 col-md-3 col-sm-6 align-self-center p-0">
                <c:forEach var="user" items="${usersPublicInfo}">
                    <c:if test = "${user != null && user.id == ad.userId}">
                        <c:set var="username" value="${user.username}"/>
                        <c:set var="phone" value="${user.phone_number}"/>
                        <c:set var="email" value="${user.email}"/>
                    </c:if>
                </c:forEach>
                <p>Seller: <c:out value="${username}" /></p>
                <p>Phone: <c:out value="${phone}" /></p>
                <p>Email: <c:out value="${email}" /></p>
                <button class="btn btn-success">Contact Seller</button>
            </div>
        </div>
        <div class="mt-2">
            <h3 class="f-color">Description</h3>
            <p class="f-color"><c:out value="${ad.description}"/></p>
        </div>
    </div>
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
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</body>
</html>