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







        <%--CONTENT GOES HERE--%>









        <jsp:include page="/WEB-INF/partials/footer.jsp" />
        <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
    </body>
</html>