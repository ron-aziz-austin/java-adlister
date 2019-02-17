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
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="category">Category</label>
                <select class="form-control" id="category" name="category">
                    <option value="7">Kids Products: Clothes & Footwear</option>
                    <option value="8">Entertainment: Books</option>
                    <option value="9">Camera: Canon</option>
                    <option value="10">Camera: Nikon</option>
                    <option value="11">Camera: Sony</option>
                    <option value="12">Computers & Laptops: Laptop</option>
                    <option value="13">Fashion & Beauty: Footwear</option>
                    <option value="14">Jobs: IT</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" required></textarea>
            </div>
            <div class="form-group">
                <label for="country">Country</label>
                <input id="country" name="country" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input id="location" name="location" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <input id="city" name="city" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="zip_code">Zip Code</label>
                <input id="zip_code" name="zip_code" class="form-control"  type="text" pattern="[0-9]{5}">
            </div>
            <div class="form-group">
                <label for="price_type">Price Type</label>
                <select class="form-control" id="price_type" name="price_type">
                    <option value="1">Fixed Price</option>
                    <option value="2">Negotiable</option>
                    <option value="3">Exchange Donate</option>
                    <option value="4">Free</option>
                </select>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input id="price" name="price" class="form-control" type="number" min="0.00" max="10000.00" step="0.01" />
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</body>
</html>