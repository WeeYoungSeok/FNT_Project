<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) 구매,판매 게시판</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

section {
	padding-top: 90px;
	padding-left: 240px;
}
a{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%
		String searchdeal = (String)request.getAttribute("searchdeal");
		String orderlist = (String)request.getAttribute("orderlist");
		String categorylist = (String)request.getAttribute("categorylist");
	%>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	<section>
	<form action="dealboard.do" method="post">
	<input type="hidden" name="searchdeal" value="<%=searchdeal %>"/>
	<input type="hidden" name="command" value="searchlist"/>
			<select id="order" name="orderlist">
							<option value="D">최신순</option>
							<option value="A">오래된 순</option>
			</select>
		<select id="categorylist" name="categorylist">
							<option value="CHECK">카테고리</option>
							<option value="F">패션</option>
							<option value="C">차량</option>
							<option value="D">가전제품</option>
							<option value="A">애완</option>
							<option value="S">스포츠</option>
			</select>
			<input type="submit" value="필터적용">
			</form>
		<table border="1">
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>게시판</th>
				<th>제  목</th>
				<th>작성자</th>
				<th>가  격</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list} }">
				<tr>
					<td colspan="6" align="center">조회된 키워드가 없습니다.</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="dealboarddto">
						<tr>
							<td>${dealboarddto.dboardno }</td>
							<c:choose>
							<c:when test="${dealboarddto.dcategory eq 'F'}">
								<td>패션</td>
							</c:when>
							<c:when test="${dealboarddto.dcategory eq 'C'}">
								<td>차량</td>
							</c:when>
							<c:when test="${dealboarddto.dcategory eq 'D'}">
								<td>가전제품</td>
							</c:when>
							<c:when test="${dealboarddto.dcategory eq A}">
								<td>애완</td>
							</c:when>
							<c:otherwise>
								<td>스포츠</td>
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${dealboarddto.dflag eq 'B' }">
							<td>구매 게시판</td>
							</c:when>
							<c:otherwise>
							<td>판매 게시판</td>
							</c:otherwise>
							</c:choose>
							<td>
								<a href="dealboard.do?command=detailboard&dboardno=${dealboarddto.dboardno}">${dealboarddto.dtitle }</a>
							</td>
							<td>${dealboarddto.dnickname }</td>
							<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
							<td>${dealboarddto.dregdate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</section>
	<%@ include file="./form/footer.jsp" %>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("select[name='orderlist'] option[value="+"<%=orderlist%>"+"]").attr("selected", true);
	$("select[name='categorylist'] option[value="+"<%=categorylist%>"+"]").attr("selected", true);
})
</script>
</body>
</html>