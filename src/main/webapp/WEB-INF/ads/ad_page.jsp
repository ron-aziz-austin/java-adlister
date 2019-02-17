<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link href="${pageContext.request.contextPath}/css/homepage.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/ad_page.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <%--===================================================--%>

    <%--TODO fix this--%>
    <div class="container">
        <h4>Title of ad goes here</h4>
            <p class="bottom_line">
                <span>Ad ID:&nbsp;</span>
                <span>5267512</span>
            </p>
        <div class="price">
            <h5>$150.00</h5>
        </div>
        <div class="row">
            <div class="column">
                <div id = "main_image">
                    <img src="https://www.fillmurray.com/300/200">
                </div>
            </div>
            <div class="column ml-2">
                <p class="entry_address">
                    <label class="adLabel">Location: </label>
                    <span id="frontend_address" class="frontend_address">37 rue du Faubourg Montmartre 75009 Paris France</span>
                </p>
                <p class="classified_county ">
                    <label class="adLabel">Country:</label>
                    <span>United States</span>
                </p>
                <p class="classified_city ">
                    <label class="adLabel">City:</label>
                    <span>New York, Philadelphia, San Francisco</span>
                </p>
                <p class="zip_code">
                    <label class="adLabel">Zip Code: </label>
                    <span class="frontend_zip_code">710618.6545</span>
                </p>
                <p class="classified_tag">
                    <label class="adLabel">Classified Status: </label>
                    <span class="frontend_classified_tag">O.N.O</span>
                </p>
                <p class="publish_date">
                    <label class="adLabel">Listed On:</label>
                    <span>Feb 1</span>
                </p>
                <button class="contactButton">Contact Seller</button>
            </div>
        </div>
        <div class="mt-2">
            <h3>Description</h3>
            <p>Inflamarae funnunculus petrificus totalus unbreakable. Sonorus stupefy unction stupefy aparecium leviosa.
                Conjunctivitis evanesco mortis tarantallegra quietus evanesco immobilus liberacorpus lacarnum. Leviosa
                homorphus aresto charm evanesco immobilus quietus. Evanesca aguamenti aparecium patronum mobilicorpus
                leviosa mobilicorpus.
            </p>
        </div>
    </div>






    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>
                <c:out value="${ad.title}" />
            </h2>
            <p>
                <c:out value="${ad.description}" />
            </p>
        </div>
    </c:forEach>




    <%--===================================================--%>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</body>
</html>