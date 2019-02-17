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
    <body>
        <div class="container">
            <h1>Edit Profile
                <c:out value="${sessionScope.user.username}"/>
            </h1>
            <hr>
            <div class="row">
                <!-- left column -->
                <div class="col-md-3">
                    <div class="text-center">
                        <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
                        <h6>Upload a different photo...</h6>

                        <input type="file" class="form-control btn btn-default">
                    </div>
                </div>

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        <i class="fa fa-coffee"></i>
                       we dont really need this tbh its just here for the meantime.
                    </div>
                    <h3>Personal info</h3>

                    <form action="/profile/edit" method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="first_name" class="col-lg-3 control-label">First name:</label>
                            <div class="col-lg-8">
                                <input id="first_name" class="form-control" type="text" value="First Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="last_name" class="col-lg-3 control-label">Last name:</label>
                            <div class="col-lg-8">
                                <input id="last_name" class="form-control" type="text" value="Last Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="company" class="col-lg-3 control-label">Company:</label>
                            <div class="col-lg-8">
                                <input id="company" class="form-control" type="text" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-lg-3 control-label">Email:</label>
                            <div class="col-lg-8">
                                <input id="email" class="form-control" type="text" value="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="username" class="col-md-3 control-label">Username:</label>
                            <div class="col-md-8">
                                <input id="username" class="form-control" type="text" value="Username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-md-3 control-label">Password:</label>
                            <div class="col-md-8">
                                <input id="password" class="form-control" type="password" value="11111122333">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm_password" class="col-md-3 control-label">Confirm password:</label>
                            <div class="col-md-8">
                                <input id="confirm_password" class="form-control" type="password" value="11111122333">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-8">
                                <input type="button" class="btn btn-primary" value="Save Changes">
                                <span></span>
                                <input type="reset" class="btn btn-default" onclick="cancelEditProfile()" value="Cancel">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <hr>
        <script>
            function cancelEditProfile() {
                location.href = "http://localhost:8080/profile";
            }
        </script>
        <jsp:include page="/WEB-INF/partials/footer.jsp" />
        <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
    </body>
</html>