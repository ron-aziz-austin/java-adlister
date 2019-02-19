<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link href="${pageContext.request.contextPath}/css/ads_index.css" type="text/css" rel="stylesheet" />
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
    <script>
        // Returns an array of maxLength (or less) page numbers
        // where a 0 in the returned array denotes a gap in the series.
        // Parameters:
        //   totalPages:     total number of pages
        //   page:           current page
        //   maxLength:      maximum size of returned array
        function getPageList(totalPages, page, maxLength) {
            if (maxLength < 5) throw "maxLength must be at least 5";

            function range(start, end) {
                return Array.from(Array(end - start + 1), (_, i) => i + start);
            }

            var sideWidth = maxLength < 9 ? 1 : 2;
            var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
            var rightWidth = (maxLength - sideWidth * 2 - 2) >> 1;
            if (totalPages <= maxLength) {
                // no breaks in list
                return range(1, totalPages);
            }
            if (page <= maxLength - sideWidth - 1 - rightWidth) {
                // no break on left of page
                return range(1, maxLength - sideWidth - 1)
                    .concat([0])
                    .concat(range(totalPages - sideWidth + 1, totalPages));
            }
            if (page >= totalPages - sideWidth - 1 - rightWidth) {
                // no break on right of page
                return range(1, sideWidth)
                    .concat([0])
                    .concat(
                        range(totalPages - sideWidth - 1 - rightWidth - leftWidth, totalPages)
                    );
            }
            // Breaks on both sides
            return range(1, sideWidth)
                .concat([0])
                .concat(range(page - leftWidth, page + rightWidth))
                .concat([0])
                .concat(range(totalPages - sideWidth + 1, totalPages));
        }

        $(function() {
            // Number of items and limits the number of items per page
            var numberOfItems = $("#jar .content").length;
            var limitPerPage = 8;
            // Total pages rounded upwards
            var totalPages = Math.ceil(numberOfItems / limitPerPage);
            // Number of buttons at the top, not counting prev/next,
            // but including the dotted buttons.
            // Must be at least 5:
            var paginationSize = 7;
            var currentPage;

            function showPage(whichPage) {
                if (whichPage < 1 || whichPage > totalPages) return false;
                currentPage = whichPage;
                $("#jar .content")
                    .hide()
                    .slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage)
                    .show();
                // Replace the navigation items (not prev/next):
                $(".pagination li").slice(1, -1).remove();
                getPageList(totalPages, currentPage, paginationSize).forEach(item => {
                    $("<li>")
                        .addClass(
                            "page-item " +
                            (item ? "current-page " : "") +
                            (item === currentPage ? "active " : "")
                        )
                        .append(
                            $("<a>")
                                .addClass("page-link")
                                .attr({
                                    href: "javascript:void(0)"
                                })
                                .text(item || "...")
                        )
                        .insertBefore("#next-page");
                });
                return true;
            }

            // Include the prev/next buttons:
            $(".pagination").append(
                $("<li>").addClass("page-item").attr({ id: "previous-page" }).append(
                    $("<a>")
                        .addClass("page-link")
                        .attr({
                            href: "javascript:void(0)"
                        })
                        .text("Prev")
                ),
                $("<li>").addClass("page-item").attr({ id: "next-page" }).append(
                    $("<a>")
                        .addClass("page-link")
                        .attr({
                            href: "javascript:void(0)"
                        })
                        .text("Next")
                )
            );
            // Show the page links
            $("#jar").show();
            showPage(1);

            // Use event delegation, as these items are recreated later
            $(
                document
            ).on("click", ".pagination li.current-page:not(.active)", function() {
                return showPage(+$(this).text());
            });
            $("#next-page").on("click", function() {
                return showPage(currentPage + 1);
            });

            $("#previous-page").on("click", function() {
                return showPage(currentPage - 1);
            });
            $(".pagination").on("click", function() {
                $("html,body").animate({ scrollTop: 0 }, 0);
            });
        });

    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <h1 style="text-align: center">Here Are all the ads!</h1>
    <div class="container" id="jar">
        <c:forEach var="ad" items="${ads}">
            <c:set var="i" value="${ad.categoryId}"/>
            <c:set var="ii" value="${categories[i-1].parentId}"/>
            <div class="mx-auto content">
                <article style="border: 1px solid black" class="row">
                    <%--Classified image--%>
                    <div class="square col-3">
                        <a href="#">
                            <img src="${ad.image}" alt="image" class="landscape">
                        </a>
                    </div>
                    <%--Ad Copy--%>
                    <div class="ad-copy col-8">
                        <a href="/adIndex?adId=${ad.id}"><h5><c:out value="${ad.title}" /></h5></a>
                            <%--<p>--%>
                            <%--<c:out value="${ad.description}" />--%>
                            <%--</p>--%>
                        <p><c:out value="${categories[ii-1].title}"/> > <c:out value="${categories[i-1].title}"/> | By <c:out value="${ad.userId}"/></p>
                        <p><span>Location:</span> <c:out value="${ad.location}"/> <c:out value="${ad.city} "/>, TX,  <c:out value="${ad.zipCode}"/></p>
                        <p><span>Phone: (123) 456-7890</span>   <span>Email: contact@email.com</span></p>
                    </div>
                    <div class="col-1">
                        <p>$${ad.price}</p>
                    </div>
                </article>
            </div>
        </c:forEach>
    <nav>
        <ul class="pagination justify-content-center pagination-sm">
        </ul>
    </nav>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <jsp:include page="/WEB-INF/partials/jsScripts.jsp"/>
</body>
</html>