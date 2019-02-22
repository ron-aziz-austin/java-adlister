
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link href="${pageContext.request.contextPath}/css/ads_list.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <div class="card mb-3">
            <div class="row no-gutters">
                <div class="col-md-4">
                    <img src="<c:out value="${sessionScope.user.image}" />" class="card-img rounded img-thumbnail" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h2 class="card-title">
                            <c:out value="${sessionScope.user.username}"/>
                            <%--TODO set attribute with user public info--%>
                            <c:if test="${sessionScope.user != null}">
                                <button type="button" onclick="location.href='/profile/edit'" id="edit-profile" class="btn btn-success btn-sm">Edit Profile</button>
                            </c:if>
                        </h2>
                        <p class="card-text">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">First name: <c:out value="${sessionScope.user.first_name}"/></li>
                                <li class="list-group-item">Last name: <c:out value="${sessionScope.user.last_name}"/></li>
                                <li class="list-group-item">Email: <c:out value="${sessionScope.user.email}"/></li>
                                <li class="list-group-item">Phone number: <c:out value="${sessionScope.user.phone_number}"/> </li>
                            </ul>
                        </p>
                        <p class="card-text">
                            <small class="text-muted"> Social Media:</small>
                            <br>
                            <button type="button" class="btn btn-fb"><i class="fab fa-facebook-f pr-1"></i> Facebook</button>
                            <button type="button" class="btn btn-tw"><i class="fab fa-twitter pr-1"></i> Twitter</button>
                            <button type="button" class="btn btn-li"><i class="fab fa-linkedin-in pr-1"></i> Linkedin</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Ads--%>
    <h1 style="text-align: center"><c:out value="${sessionScope.user.username}"/>'s Ads</h1>
    <div class="container" id="jar">
        <c:forEach var="ad" items="${ads}">
            <c:set var="i" value="${ad.categoryId}"/>
            <c:set var="ii" value="${categories[i-1].parentId}"/>
            <div class="mx-auto content">
                <button type="button" onclick="location.href='/ads/edit?adId=${ad.id}'" class="edit-ad btn btn-success btn-sm">Edit</button>
                <button type="button" onclick="location.href='/profile?deleteAd=${ad.id}'" class="delete-ad btn btn-success btn-sm">Delete</button>
                <article style="border: 1px solid lightgray" class="row">
                        <%--Ad image--%>
                    <div class="square col-3">
                        <a href="#">
                            <img src="${ad.image}" alt="image" class="landscape">
                        </a>
                    </div>
                        <%--Ad Copy--%>
                    <div class="ad-copy col-8">
                        <a href="/adIndex?adId=${ad.id}"><h5 id="adTitle" class="mt-2"><c:out value="${ad.title}" /></h5></a>
                        <p><c:out value="${categories[ii-1].title}"/> > <c:out value="${categories[i-1].title}"/> | By <c:out value="${sessionScope.user.username}"/></p>
                        <p><span>Location: </span> <c:out value="${ad.location}"/>, <c:out value="${ad.city} "/>, TX,  <c:out value="${ad.zipCode}"/></p>
                        <p><span class="pr-4">Phone: <c:out value="${sessionScope.user.phone_number}"></c:out></span> <span>Email: <c:out value="${sessionScope.user.email}"></c:out></span></p>
                    </div>
                    <div class="col-1">
                        <p class="mt-2">$${ad.price}</p>
                    </div>
                </article>
            </div>
        </c:forEach>
    </div>
    <nav>
        <ul class="pagination justify-content-center pagination-sm"></ul>
    </nav>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
    <script type="text/javascript" src="/js/ad_index.js"></script>
</body>
</html>