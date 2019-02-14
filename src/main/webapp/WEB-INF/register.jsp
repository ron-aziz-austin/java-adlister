<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Register" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h2 style="color:red;text-align:center">
            <c:out value="${inputErrors}" />
        </h2>
        <h1>Register as a new User</h1>
        <form action="/register" method="post">
            <%--first name--%>
            <div class="form-group">
                <label for="first_name">First Name</label>
                <input id="first_name" name="first_name" class="form-control" type="text" required>
            </div>
            <%--last name--%>
                <div class="form-group">
                    <label for="last_name">Last Name</label>
                    <input id="last_name" name="last_name" class="form-control" type="text" required>
                </div>
            <%--email--%>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="email" required>
            </div>
            <%--phone number--%>
                <div class="form-group">
                    <label for="phone_number">Phone Number</label>
                    <input id="phone_number" name="phone_number" class="form-control" type="text" required>
                </div>
            <%--Username--%>
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" required>
            </div>
            <%--password--%>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password" required>
            </div>
            <%--confirm password--%>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password" required>
            </div>










                <%--fb--%>
                <%--<div class="form-group">--%>
                    <%--<label for="user_fb">Facebook profile (optional)</label>--%>
                    <%--<input id="user_fb" name="phone_number" class="form-control" type="text" required>--%>
                <%--</div>--%>
                <%--&lt;%&ndash;twitter&ndash;%&gt;--%>
                <%--<div class="form-group">--%>
                    <%--<label for="user_fb">Twitter profile (optional)</label>--%>
                    <%--<input id="user_twitter" name="user_twitter" class="form-control" type="text" required>--%>
                <%--</div>--%>
                <%--&lt;%&ndash;linkedin&ndash;%&gt;--%>
                <%--<div class="form-group">--%>
                    <%--<label for="user_linkedin">LinkedIn profile (optional)</label>--%>
                    <%--<input id="user_linkedin" name="user_linkedin" class="form-control" type="text" required>--%>
                <%--</div>--%>



                <%--submit button--%>
            <input type="submit" class="btn btn-block btn-primary" value="Register">
        </form>
    </div>
</body>
<jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</html>