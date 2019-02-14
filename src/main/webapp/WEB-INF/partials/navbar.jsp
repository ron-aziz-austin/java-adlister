<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <nav class="navbar navbar-expand-md navbar-light bg-light">

        <a class="navbar-brand mr-auto" href="#">Adlister</a>
        <form class="form-inline mx-auto my-lg-0 d-none d-sm-none d-md-block">
            <input class="form-control ml-sm- 2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <a class="navbar-nav ml-auto" >Login</a>
    </nav>
    <!--navbar 2 on md screens and larger-->
    <nav class="navbar navbar-expand-md navbar-light bg-light">
        <div class="d-none d-sm-none d-md-block">
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
</div>






<%--<li><a href="/register">Register</a></li>--%>
<%--<c:choose>--%>
    <%--<c:when test="${sessionScope.user != null}">--%>
        <%--<li><a href="/logout">Logout</a></li>--%>
    <%--</c:when>--%>
    <%--<c:otherwise>--%>
        <%--<li><a href="/login">Login</a></li>--%>
    <%--</c:otherwise>--%>
<%--</c:choose>--%>