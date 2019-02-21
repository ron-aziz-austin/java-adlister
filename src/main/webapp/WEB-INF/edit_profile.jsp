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
                    <c:if test="${inputErrors != null}">
                    <div class="alert alert-danger alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        <i class="fa fa-times-circle"></i>
                        <c:out value="${inputErrors}" />
                    </div>
                    </c:if>
                    <%--<h2 style="color:red;text-align:center">--%>
                        <%--<c:out value="${inputErrors}" />--%>
                    <%--</h2>--%>
                    <h3>Personal info</h3>

                    <form action="/profile/edit" method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="first_name_edit" class="col-lg-3 control-label">First name:</label>
                            <div class="col-lg-8">
                                <input name="first_name_edit" id="first_name_edit" class="form-control" type="text" value= "<c:out value="${sessionScope.user.first_name}"/>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="last_name_edit" class="col-lg-3 control-label">Last name:</label>
                            <div class="col-lg-8">
                                <input name="last_name_edit" id="last_name_edit" class="form-control" type="text" value=" <c:out value="${sessionScope.user.last_name}"/>">
                            </div>
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label for="company" class="col-lg-3 control-label">Company:</label>--%>
                            <%--<div class="col-lg-8">--%>
                                <%--<input id="company" class="form-control" type="text" value="">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label for="email_edit" class="col-lg-3 control-label">Email:</label>
                            <div class="col-lg-8">
                                <input name="email_edit" id="email_edit" class="form-control" type="text" value=<c:out value="${sessionScope.user.email}"/>>
                            </div>
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label for="username_edit" class="col-md-3 control-label">Username:</label>--%>
                            <%--<div class="col-md-8">--%>
                                <%--<input id="username_edit" class="form-control" type="text" value="Username">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label for="password_edit" class="col-md-3 control-label">Password:</label>
                            <div class="col-md-8">
                                <input name="password_edit" id="password_edit" class="form-control" type="password" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm_password_edit" class="col-md-3 control-label">Confirm password:</label>
                            <div class="col-md-8">
                                <input name="confirm_password_edit" id="confirm_password_edit" class="form-control" type="password" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-8">
                                <input type="submit" name="submit" class="btn btn-primary" value="submit">
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