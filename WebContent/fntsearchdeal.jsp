<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) 구매,판매 게시판</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {margin: 0px; padding: 0px;}

#searchlistzone {float: center; width: 90%; margin-left: 6%;}
#searchfilter {margin-top: 2%; margin-bottom: 2%;}
#order {height: 22px; color:white; background-color: rgba(255,255,255,0.1);}
#categorylist {height: 22px; color:white; background-color: rgba(255,255,255,0.1);}
#filter {width: 60px; height: 24px; cursor: pointer; color:white; background-color: rgba(255,255,255,0.3); border: 2px solid rgba(255,255,255,0); border-radius: 2px 2px 2px 2px;}
#filter:hover {font-weight: bold; background-color: rgba(255,255,255,0); border: 2px solid rgba(255,255,255,0.5);}

#deallist {width: 80%; margin: 1px auto; font-family: "Arial";}
tr:hover {background-color: rgba(255,255,255,0.1); font-weight: bold;}
th {font-weight: bold; height: 30px; text-align: center; padding-top: 0.4%; font-size: 14pt; color: rgba(255,255,255,0.5); background-color: rgba(255,255,255,0);}
td {height: 28px; font-size: 12pt; text-align: center; color: white; background-color: rgba(255,255,255,0);}
a {width: 100%; height: 100%; text-decoration: none; color: white;}
#listlast {background-color: rgba(255,255,255,0.5); height: 2px;}
.hovernot:hover {background-color:rgba(255,255,255,0);font-weight:null;}
#paging {margin-top: 40%; align: center;}
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
	<div id="searchlistzone">
	<form id="searchfilter" action="dealboard.do" method="post">
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
		<input id="filter" type="submit" value="필터적용">
	</form>
	
	<table id="deallist">
		<col width="5%">
		<col width="10%">
		<col width="15%">
		<col width="40%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
			<tr class="hovernot">
				<th>No.</th>
				<th>카테고리</th>
				<th>게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>가격</th>
				<th>작성일</th>
			</tr>
			<tr class="hovernot"><td id="listlast" colspan="7"></td></tr>
		<c:choose>
		<c:when test="${empty list} }">
			<tr>
				<td colspan="6" align="center">조회된 키워드가 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
		<c:forEach items="${list}" var="dealboarddto" varStatus="status">
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
						<c:choose>
							<c:when test="${replyAllCount[status.index] ne 0}">
								(${replyAllCount[status.index]})
							</c:when>
						</c:choose>
				</td>
				<td>${dealboarddto.dnickname }</td>
				<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
				<td>${dealboarddto.dregdate }</td>
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		<tr class="hovernot"><td id="listlast" colspan="7"></td></tr>
	</table>
	<div id="paging">
		<%
			if(orderlist.equals("D") && categorylist.equals("CHECK")) {
		%>
		<jsp:include page="./paging/fntsearchpaging.jsp">
		<jsp:param value="<%=categorylist %>" name="categorylist"/>
		<jsp:param value="<%=orderlist %>" name="orderlist"/>
		<jsp:param value="<%=searchdeal %>" name="searchdeal"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			} else if((orderlist.equals("D")) && (categorylist.equals("F") || categorylist.equals("C")
					|| categorylist.equals("D") || categorylist.equals("A") || categorylist.equals("S"))){
	%>
			<jsp:include page="./paging/fntsearchcatepaging.jsp">
		<jsp:param value="<%=categorylist %>" name="categorylist"/>
		<jsp:param value="<%=orderlist %>" name="orderlist"/>
		<jsp:param value="<%=searchdeal %>" name="searchdeal"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			} else if(orderlist.equals("A") && categorylist.equals("CHECK")) {
	%>
	<jsp:include page="./paging/fntsearchascpaging.jsp">
		<jsp:param value="<%=categorylist %>" name="categorylist"/>
		<jsp:param value="<%=orderlist %>" name="orderlist"/>
		<jsp:param value="<%=searchdeal %>" name="searchdeal"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			} else if((orderlist.equals("A")) && (categorylist.equals("F") || categorylist.equals("C")
					|| categorylist.equals("D") || categorylist.equals("A") || categorylist.equals("S"))) {
	%>
	<jsp:include page="./paging/fntsearchascpaging.jsp">
		<jsp:param value="<%=categorylist %>" name="categorylist"/>
		<jsp:param value="<%=orderlist %>" name="orderlist"/>
		<jsp:param value="<%=searchdeal %>" name="searchdeal"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			}
	%>
	</div>
	</div>
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