<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <jsp:include page="partials/head.jsp" />
    <link href="${pageContext.request.contextPath}/css/login.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <%@ include file="partials/navbar.jsp" %>

    <form method="POST" action="/login">
        <div class="container">
            <h2 class="error">${invalidLogin}</h2>
            <label for="uname"><b>Username</b></label>
            <input type="text" id="uname" placeholder="Enter Username" name="uname" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" id="psw" placeholder="Enter Password" name="psw" required>

            <button type="submit">Login</button>
            <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>
        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" class="cancelbtn">Cancel</button>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
    </form>

    <%@ include file="partials/footer.jsp" %>
</body>
</html>