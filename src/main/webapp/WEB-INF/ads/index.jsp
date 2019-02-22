<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link href="${pageContext.request.contextPath}/css/ads_list.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container p-0">
        <form class="input-group" method="post" action="/ads">
            <div class="input-group">
                <select class="custom-select" id="inputGroupSelect04" name="category">
                    <option value="0">-- Category --</option>
                    <option value="1">Arts & Crafts</option>
                    <option value="2">Vehicles</option>
                    <option value="3">Camera</option>
                    <option value="4">Fashion & Beauty</option>
                    <option value="5">Books & hobbies</option>
                    <option value="6">Electronics & Computers</option>
                    <option value="7">Kids Furniture</option>
                    <option value="8">Jobs</option>
                    <option value="9">Kids & Baby Products</option>
                    <option value="10">Mobiles & Tablets</option>
                    <option value="11">Animals</option>
                    <option value="12">Games</option>
                    <option value="13">Marketing</option>
                    <option value="14">Computers & Laptops</option>
                    <option value="0">-- Sub Category --</option>
                    <option value="15">Kids Clothes & Footwear</option>
                    <option value="16">Books</option>
                    <option value="17">Canon</option>
                    <option value="18">Nikon</option>
                    <option value="19">Sony</option>
                    <option value="20">Laptop</option>
                    <option value="21">Footwear</option>
                    <option value="22">IT</option>
                    <option value="23">Drawing Supplies</option>
                    <option value="24">Painting Supplies</option>
                    <option value="25">Electric Scooter</option>
                    <option value="26">Electric Bicycles</option>
                </select>
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" id="searchButton" type="submit">Search</button>
                </div>
            </div>
        </form>
    </div>

    <%--<h1 style="text-align: center">Here Are all the ads!</h1>--%>
    <div class="container" id="jar">
        <c:forEach var="ad" items="${ads}">
            <c:set var="i" value="${ad.categoryId}"/>
            <c:set var="ii" value="${categories[i-1].parentId}"/>
            <c:forEach var="user" items="${usersPublicInfo}">
                <c:if test = "${user != null && user.id == ad.userId}">
                    <c:set var="username" value="${user.username}"/>
                    <c:set var="phone" value="${user.phone_number}"/>
                    <c:set var="email" value="${user.email}"/>
                </c:if>
            </c:forEach>
            <div class="mx-auto content">
                <article style="border: 1px solid black" class="row">
                    <%--Classified image--%>
                    <div class="square col-3">
                        <a href="#">
                            <img src="${ad.image}" alt="image" class="landscape">
                        </a>
                    </div>
                    <%--Ad Copy--%>
                    <div class="ad-copy col-8">
                        <a href="/adIndex?adId=${ad.id}"><h5 id="adTitle"><c:out value="${ad.title}" /></h5></a>
                        <p><c:out value="${categories[ii-1].title}"/> > <c:out value="${categories[i-1].title}"/> | By <c:out value="${ad.userId}"/></p>
                        <p><span>Location:</span> <c:out value="${ad.location}"/> <c:out value="${ad.city} "/>, TX,  <c:out value="${ad.zipCode}"/></p>
                        <p><span class="pr-4">Phone: <c:out value="${phone}"/></span>   <span>Email: <c:out value="${email}"/></span></p>
                    </div>
                    <div class="col-1">
                        <p>$${ad.price}</p>
                    </div>
                </article>
            </div>
        </c:forEach>
    <nav>
        <ul class="pagination justify-content-center pagination-sm"></ul>
    </nav>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
    <script type="text/javascript" src="/js/ad_index.js"></script>
</body>
</html>