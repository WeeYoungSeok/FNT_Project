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
* {margin: 0px; padding: 0px;}

aside {position: fixed; align: left; width: 14%; height: 100%; box-shadow: 1px 0px 6px black; z-index: 2;}
#menubars {margin-top: 50%; height: 62%;}
.menubar {padding-top: 12%; background-color: black; color: white; width: 100%; height: 16%; text-align: left; font: 16pt "Arial"; font-weight: bold; cursor: pointer; opacity: 0.4;}
.menubar > p {padding-left: 10%;}
.menubar:hover {opacity: 0.6;}
.menubar_x {background-color: black; width: 100%; height: 100%; opacity: 0.4;}

section {padding-top: 8%; padding-left: 14%; width: 100%; height: auto; overflow: scroll; padding-bottom: 30px; z-index: 1;}
#searchlistzone {float: center; width: 86%; position: fixed;}
#searchfilter {margin-top: 2%; margin-bottom: 2%;}

#deallist {width: 80%; margin: 1px auto; font-family: "Arial";}
tr:hover {background-color: #efefef; font-weight: bold;}
th {background-color: #cccccc; font-weight: bold; height: 30px; font-size: 14pt; text-align: center; padding-top: 0.4%;}
td {height: 28px; font-size: 12pt; text-align: center;}
a {width: 100%; height: 100%; text-decoration: none; color: black;}
#listlast {background-color: #dddddd; height: 2px;}

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
	<aside>
		<div id="menubars">
			<div class="menubar"><p onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>
	
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
		<input type="submit" value="필터적용">
	</form>
	
	<table id="deallist">
		<col width="5%">
		<col width="10%">
		<col width="15%">
		<col width="40%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
			<tr>
				<th>No.</th>
				<th>카테고리</th>
				<th>게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>가격</th>
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
		<tr><td id="listlast" colspan="7"></td></tr>
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