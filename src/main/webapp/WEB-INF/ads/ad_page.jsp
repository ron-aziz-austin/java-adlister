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
    <%--TODO fix this--%>
    <div class="container">
        <h4 class="f-color-g"><c:out value="${ad.title}"/></h4>
            <p class="bottom_line f-color">
                <span>Ad ID:&nbsp;</span>
                <span><c:out value="${ad.id}"/></span>
            </p>
        <div class="price">
            <h5 class="my-auto">$<c:out value="${ad.price}"/></h5>
        </div>
        <div class="row">
            <div class="column">
                <div id = "main_image">
                    <%--TODO added temporary inline style--%>
                    <img style="width: 300px;height: auto" src="${ad.image}">
                </div>
            </div>
            <div class="column ml-2">
                <p class="entry_address">
                    <label class="adLabel">Location: </label>
                    <span id="frontend_address" class="frontend_address"><c:out value="${ad.location}"/></span>
                </p>
                <p class="classified_city">
                    <label class="adLabel">City: <c:out value="${ad.city}"/></label>
                    <span><c:out value="${ad.city}"/></span>
                </p>
                <p class="zip_code">
                    <label class="adLabel">Zip Code: </label>
                    <span class="frontend_zip_code"><c:out value="${ad.zipCode}"/></span>
                </p>
                <p class="publish_date">
                    <label class="adLabel">Listed On: <c:out value="${ad.listedOn}"/></label>
                    <span>Feb 1</span>
                </p>
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