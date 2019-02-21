<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container-fluid">
        <h2>Browse Categories</h2>
        <section class="category_list_wrap row">
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header"><h3>
                    <a href="#" title="Animals">Animals</a>
                </h3></div>

                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0"><a href="#" >Cats</a>
                    <li class="list-group-item py-0"><a href="#">Dogs</a>
                    </li>
                    <li class="list-group-item py-0"><a href="#">Amphibians</a>
                    </li>
                    <li class="list-group-item py-0"><a href="#">Birds</a>
                    </li>
                    <li class="list-group-item py-0"><a href="#">Abstract</a>
                    </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">

                <div class="card-header">
                    <h3><a href="#" title="Art &amp; Crafts">Art &amp; Crafts</a></h3>
                </div>

                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0"><a href="#" >Fashion &amp; Beauty</a>
                    <li class="list-group-item py-0"><a href="#">Accessories</a>
                    </li>
                    <li class="list-group-item py-0"><a href="#">Cloths</a>
                    </li>
                    <li class="list-group-item py-0"><a href="#">Footwear</a>
                    </li>
                    <li class="list-group-item py-0"><a href="#">Abstract</a>
                    </li>
                </ul>
                </li>
                <li class="view">
                    <a href="#">View all »</a>
                </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header">
                    <h3>
                        <a href="#" title="Books &amp; Hobbies">Books &amp; Hobbies</a>
                    </h3>
                </div>

                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0">
                        <a href="#">Magazines</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Other hobbies</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">View all »</a>
                    </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header">
                    <h3>
                        <a href="#" title="Cameras">Cameras</a>
                    </h3>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0">
                        <a href="#">Canon</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Nikon</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Panasonic</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Sony</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">View all »</a>
                    </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header">
                    <h3>
                        <a href="#">Electronics &amp; Computers</a>
                    </h3>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0">
                        <a href="#">Computers</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Mobile accessories</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">TV</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">View all »</a>
                    </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header">
                    <h3>
                        <a href="#" title="Entertainment">Entertainment</a>
                    </h3>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0">
                        <a href="#">Books</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Games</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Movie DVDs</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Music</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">View all »</a>
                    </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header">
                    <h3>
                        <a href="#" title="Jobs">Jobs</a>
                    </h3>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0">
                        <a href="#">Customer Service</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">IT</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Marketing</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Part-time</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">View all »</a>
                    </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header">
                    <h3>
                        <a href="#" title="Kids &amp; Baby Products">Kids &amp; Baby Products</a>
                    </h3>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0"><a href="#">Cloths &amp; Footwear</a>
                    </li>
                    <li class="list-group-item py-0"><a href="#">Kids Furniture</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Toys &amp; Games</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">View all »</a>
                    </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header">
                    <h3>
                        <a href="#" title="Mobiles &amp; Tablets">Mobiles &amp; Tablets</a>
                    </h3>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0">
                        <a href="#">Mobile Phones</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Tablets</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">View all »</a>
                    </li>
                </ul>
            </div>
            <div class="card mx-3 my-3" style="width: 18rem; height: 18rem">
                <div class="card-header">
                    <h3>
                        <a href="#" title="Vehicles">Vehicles</a>
                    </h3>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item py-0">
                        <a href="#">Bicycle</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Bike</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">Car</a>
                    </li>
                    <li class="list-group-item py-0">
                        <a href="#">View all »</a>
                    </li>
                </ul>
            </div>
        </section>
    </div>

    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</body>
</html>