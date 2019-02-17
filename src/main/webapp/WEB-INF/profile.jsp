
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
<body>
    <div class="card mb-3" style="max-width: 1000px;">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="https://propertymarketersllc.com/wp-content/uploads/2018/05/profile-picture-placeholder.png" class="card-img rounded img-thumbnail" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h2 class="card-title"><c:out value="${sessionScope.user.username}"/> <button type="button" onclick="edit()" id="edit-profile" class="btn btn-primary btn-sm">Edit Profile</button>
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
    <script>
        // redirects to edit profile page
        //needs to be updated to a valid url eventually
        function edit() {
            location.href = "http://localhost:8080/profile/edit";
        }
    </script>
</body>
<jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</html>