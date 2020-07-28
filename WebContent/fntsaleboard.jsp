<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 판매</title>
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
	String salesearch = (String)request.getAttribute("salesearch");
	String salelist = (String)request.getAttribute("salelist");
%>
<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>
	<section>
		<table border="1">
		<tr>
			<td colspan="6">
			<form action="dealboard.do" method="post">
			<input type="hidden" name="command" value="salesearchlist"/>	
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
			</td>
		</tr>
			<tr>
				<th>글 번 호</th>
				<th>카테고리</th>
				<th>제      목</th>
				<th>작 성 자</th>
				<th>가      격</th>
				<th>작 성 일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="5" align="center">작성된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dealboarddto">
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
							<td>
								<a href="dealboard.do?command=detailsaleboard&dboardno=${dealboarddto.dboardno}">${dealboarddto.dtitle }</a>
							</td>
							<td>${dealboarddto.dnickname }</td>
							<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
							<td>${dealboarddto.dregdate }</td>
						</tr>
					</c:forEach>
					<%
					
						MemberDto dto = (MemberDto) session.getAttribute("memberdto");
						if(dto != null){
					%>		
					<tr>
						<td colspan="6" align="right">
							<input type="button" value="글작성" onclick="location.href='dealboard.do?command=insertsaleboard'">
						</td>
					</tr>
					<%
						}
					%>
				</c:otherwise>
			</c:choose>
		</table>
		<jsp:include page="./paging/fntsalepaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	
	
	<form action="dealboard.do" method="post">
		<input type="hidden" name="command" value="salesearch"/>
		
			<select name="salelist" id="search">
				<option value="T">제목</option>
				<option value="W">작성자</option>
			</select>
			<input type="text"  name="salesearch" id="salesearch" value="<%=salesearch%>" required="required" placeholder="내용을 입력하세요"/>
			<input type="submit" value="검색"/>
		</form>
	
	
	</section>
<%@ include file="./form/footer.jsp" %>	
</body>
</html>