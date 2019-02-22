<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h3 class="f-color-g main-header">Edit your ad</h3>
    <form action="/ads/edit?adId=${adId}" method="post">
        <div class="form-group f-color">
            <label for="category">Category</label>
            <select class="form-control" id="category" name="category">
                <option value="15">Kids & Baby Products: Kids Clothes & Footwear</option>
                <option value="16">Books & Hobbies: Books</option>
                <option value="17">Camera: Canon</option>
                <option value="18">Camera: Nikon</option>
                <option value="19">Camera: Sony</option>
                <option value="20">Electronics & Computers: Laptop</option>
                <option value="21">Fashion & Beauty: Footwear</option>
                <option value="22">Jobs: IT</option>
                <option value="23">Arts & Crafts: Drawing Supplies</option>
                <option value="24">Arts & Crafts: Painting Supplies</option>
                <option value="25">Vehicles: Electric Scooter</option>
                <option value="26">Vehicles: Electric Bicycles</option>
            </select>
        </div>
        <div class="form-group f-color">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="<c:out value="${ad.title}" />" required>
        </div>
        <div class="form-group f-color">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" required></textarea>
        </div>
        <div class="form-group f-color">
            <label for="country">Country</label>
            <input id="country" name="country" class="form-control" type="text">
        </div>
        <div class="form-group f-color">
            <label for="location">Location</label>
            <input id="location" name="location" class="form-control" type="text">
        </div>
        <div class="form-group f-color">
            <label for="city">City</label>
            <input id="city" name="city" class="form-control" type="text">
        </div>
        <div class="form-group f-color">
            <label for="zip_code">Zip Code</label>
            <input id="zip_code" name="zip_code" class="form-control"  type="text" pattern="[0-9]{5}">
        </div>
        <div class="form-group f-color">
            <label for="price_type">Price Type</label>
            <select class="form-control" id="price_type" name="price_type">
                <option value="1">Fixed Price</option>
                <option value="2">Negotiable</option>
                <option value="3">Exchange Donate</option>
                <option value="4">Free</option>
            </select>
        </div>
        <div class="form-group f-color">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" type="number" min="0.00" max="10000.00" step="0.01" />
        </div>
        <input type="submit" class="btn btn-block btn-success mt-4">
    </form>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
<jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</body>
</html>