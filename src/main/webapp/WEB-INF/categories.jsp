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
    <div class="container">
        <h3 class="home-header">Home Page Categories</h3>
    </div>
    <div class="container">
        <ul id="home-category" class="row justify-content-md-center">
            <div class="card">
                <div class="card-body">
                    <li class="col-sm">
                        <a href="/ads?homeCategory=1"><i class="far fa-star"></i>Art &amp; Crafts</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-175" class="col-sm">
                        <a href="/ads?homeCategory=2"><i class="fa fa-car"></i>Vehicles</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-176" class="col-sm">
                        <a href="/ads?homeCategory=3"><i class="fa fa-camera"></i>Camera</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-177" class="col-sm">
                        <a href="/ads?homeCategory=4"><i class="fa fa-asterisk"></i>Fashion &amp; Beauty</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-178" class="col-sm">
                        <a href="/ads?homeCategory=5"><i class="fa fa-book"></i>Books &amp; Hobbies</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-179" class="col-sm">
                        <a href="/ads?homeCategory=6"><i class="fa fa-desktop"></i> Electronics &amp; Computers</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-180" class="col-sm">
                        <a href="/ads?homeCategory=7"><i class="fa fa-cube"></i> Kids Furniture</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-181" class="col-sm">
                        <a href="/ads?homeCategory=8"><i class="fa fa-briefcase"></i>Jobs</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-182" class="col-sm">
                        <a href="/ads?homeCategory=9"><i class="far fa-smile"></i>Kids &amp; Baby Products</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-183" class="col-sm">
                        <a href="/ads?homeCategory=10"><i class="fas fa-mobile-alt"></i>Mobiles &amp; Tablets</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-184" class="col-sm">
                        <a href="/ads?homeCategory=11"><i class="fa fa-film"></i>Entertainment</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-186" class="col-sm">
                        <a href="/ads?homeCategory=12"><i class="fa fa-paw"></i>Animals</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-187" class="col-sm">
                        <a href="/ads?homeCategory=13"><i class="fa fa-gamepad"></i>Games</a>
                    </li>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <li id="menu-item-188" class="col-sm">
                        <a href="/ads?homeCategory=14"><i class="fa fa-cogs"></i>Marketing</a>
                    </li>
                </div>
            </div>
        </ul>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</body>
</html>