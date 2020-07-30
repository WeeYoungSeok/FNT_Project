<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
body {
    text-align: center;
    position: relative;
}

#paging {
	margin-top: 1%;
	display: flex;
	float: center;
	position: absolute;
	left: 50%;
}

.thispage {
	font-family: "Arial";
    font-size: 16pt;
    width: 38px;
    height: 30px;
    padding-top: 8px;
    margin-right: 6px;
    border: 2px solid #aaaaaa;
    background-color: #eeeeee;
    border-radius: 20px 20px 20px 20px;
}

.otherpage {
	font-family: "Arial";
    font-size: 16pt;
    width: 38px;
    height: 30px;
    padding-top: 8px;
    margin-right: 6px;
    border: 2px solid #dddddd;
    border-radius: 20px 20px 20px 20px;
}
</style>
</head>
<body>
<div id="paging">
<!-- 1~10까지 있는 페이지의 페이징 -->
<c:url var="action" value="/dealboard.do"/>
<c:if test="${param.prev}">
    <a href="${action}?page=${param.beginPage-1}&command=fntbuyboard">prev</a>
</c:if>
<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
    <c:choose>
        <c:when test="${param.page==index}">
            <div class="thispage"><a id="onePage">${index}</a></div>
        </c:when>
        <c:otherwise>
            <div class="otherpage"><a href="${action}?page=${index}&command=fntbuyboard">${index}</a></div>
        </c:otherwise>
    </c:choose>
</c:forEach>
<c:if test="${param.next}">
    <a href="${action}?page=${param.endPage+1}&command=fntbuyboard">next</a>
</c:if>
</div>
</body>
<script type="text/javascript">
			$(function(){
				$("#onePage").css("color","red");
			});
	</script>

</html>