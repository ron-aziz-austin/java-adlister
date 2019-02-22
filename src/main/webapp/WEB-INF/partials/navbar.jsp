<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
<nav id="nav-1" class="navbar navbar-expand-md navbar-light">
    <div class="container-fluid">
        <div class="even-spacer">
            <a class="navbar-brand d-inline" id="logoTopLeft" href="/home">Adlister</a>
        </div>
        <div class="even-spacer">
            <form class="form-inline my-lg-0 d-none d-sm-none d-md-block" method="post" action="/ads">
                <input class="form-control ml-sm- 2" type="search" name="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        <div class="even-spacer">
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <a href="/logout">Logout</a>
                </c:when>
                <c:otherwise>
                    <button id="nav_register_user" type="button" class="btn btn-link float-right">Register</button>
                    <button id="nav_returning_user" type="button" class="btn btn-link float-right">Login</button>
                </c:otherwise>
            </c:choose>


            <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
            <script type="text/javascript">
                $("#nav_register_user").click(function(){
                    location.href = "http://localhost:8080/register";
                });
                $("#nav_returning_user").click(function(){
                    location.href = "http://localhost:8080/login";
                });

            </script>
        </div>
    </div>
</nav>
<!--navbar 2 on md screens and larger-->
<nav id="nav-2" class="navbar navbar-expand-md navbar-light nav-wrapper">
    <div class="d-none d-sm-none d-md-block navbar-sec container" id="nav-2Back">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="/categories" id="categories" class="nav-link">Categories</a>
            </li>
            <li class="nav-item">
                <a href="/classifieds" id="classifieds" class="nav-link">Classifieds</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contactUs">Contact Us</a>
            </li>
            <li class="nav-item">
                <a href="/profile" id="profile" class="nav-link">My Profile</a>
            </li>
            <li class="nav-item">
                <a href="/ads" id="listAll" class="nav-link">List all Ads</a>
            </li>
            <c:if test="${sessionScope.user != null}">
                <a href="/ads/create" id="createAd" class="nav-link">Create Ad</a>
            </c:if>
        </ul>
    </div>
    <div class="d-block d-sm-block d-md-none">
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navBarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navBarMenu">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link">Classifieds</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link">My Profile</a>
                </li>
                <li class="nav-item">
                    <form class="form-inline mx-auto my-lg-0">
                        <input class="form-control ml-sm- 2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
</header>