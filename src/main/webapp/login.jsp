<%--
  Created by IntelliJ IDEA.
  User: ronsoeum
  Date: 2019-02-05
  Time: 09:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<%--Inside of login.jsp write some code to check the submmitted values. If the username submitted is "admin", and the password is "password", redirect the user to the profile page, otherwise, redirect back to the login form.--%>

<%
    String uname = request.getParameter("uname");
    String psw = request.getParameter("psw");

    if (!StringUtils.isEmpty(uname) || !StringUtils.isEmpty(psw)) {
        if (uname.equalsIgnoreCase("admin")
                && psw.equalsIgnoreCase("password")) {
            response.sendRedirect("/profile.jsp");
        } else {
            response.sendRedirect("/login.jsp");
        }
    }
%>

<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/navbar.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/login.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/footer.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <%@ include file="partials/navbar.jsp" %>

    <%--When a user visits /login.jsp, they should see a form for logging in--%>
    <%--This form should have a 'username' and 'password' field.--%>
    <%--This form should submit a POST request to /login.jsp--%>

    <form method="POST" action="/login.jsp">
        <div class="container">
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
