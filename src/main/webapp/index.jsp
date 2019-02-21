<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>

    <style>
        .jumbotron-billboard .img {
            margin-bottom: 0px;
            opacity: 0.2;
            color: #fff;
            background: #000 url("https://bootstrapcreative.com/wp-bc/wp-content/uploads/2017/03/learning-story.png") top center no-repeat;
            width: 100%;
            height: 100%;
            background-size: cover;
            overflow: hidden;
            position:absolute;
            top:0;
            left:0;
            z-index:1;
        }
        .jumbotron h2 {margin-top:0;}
        .jumbotron {
            position:relative;
            padding-top:50px;
            padding-bottom:50px;
        }
        .jumbotron .container {
            position:relative;
            z-index:2;
        }

        @media screen and (max-width: 768px) {
            .jumbotron {
                padding-top:20px;
                padding-bottom:20px;
            }
        }
    </style>
</head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <%--CONTENT GOES HERE--%>
        <%--jumbo 2--%>


        <div class="jumbotron jumbotron-billboard text-center">
            <div class="img"></div>
            <h2 class="card-title text-center h2">We dont have a name yet adlister</h2>
            <!-- Subtitle -->

            <!-- Grid row -->
            <div class="row d-flex justify-content-center">

                <!-- Grid column -->
                <div class="col-xl-7 pb-2">

                    <p class="card-text text-center">XXX adlister is the most popular adliter in the San Antonio area since it's creation in 2019. Thousands of users create and sell products every single day. Registering for an account is simple and straightforward. Join the thousands of users who already enjoy xxx adlister and start selling and buying today! </p>

                </div>
                <!-- Grid column -->

            </div>
            <!-- Grid row -->

            <hr class="my-4">

            <div class="pt-2">
                <button id="new_user" type="button" class="btn btn-outline-primary waves-effect">New User <span class="far fa-user ml-1"></span></button>
                <button id="returning_user" type="button" class="btn btn-outline-primary waves-effect">Returning User <i class="fas fa-user ml-1"></i></button>
            </div>
        </div>
        <%--jumbo 2 end--%>

        <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
            <script type="text/javascript">

            $("#new_user").click(function(){
                location.href = "http://localhost:8080/register";
            });
            $("#returning_user").click(function(){
                location.href = "http://localhost:8080/login";
            });
            // document.getElementById("new_user").onclick = function () {
            //     location.href = "http://localhost:8080/register";
            // };
            //
            // document.getElementById("returning_user").onclick = function () {
            //     location.href = "http://localhost:8080/login";
            // };
        </script>
        <jsp:include page="/WEB-INF/partials/footer.jsp" />
    </body>
</html>