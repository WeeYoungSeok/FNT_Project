
<%@page import="com.fnt.util.Paging"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 판매</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">

#stable {
	float: center;
 }
 
 h1 {
 	margin-top: 5%;
 	font-family: "Arial";
 }
 
 #c_btn {
 	width: 50px;
 	height: 19px;
 	border: none;
 	border-radius: 2px 2px 2px 2px;
 	cursor: pointer;
 	color: white;
 	background-color: #595959;
 	margin-bottom: 10px;
 }
 
 #c_btn:hover {
 	font-weight: bold;
 }
 
 table {
 	margin: 0 auto;
 	margin-top: 10px;
 	font-family: "Arial";
 } 
 
 th {
 	background-color: #dddddd;
 	height: 26px;
 	font-weight: bold;
 	padding-top: 2px;
 }
 
 td {
 	height: 24px;
 }
 
 tr:hover {
 	background-color: #efefef;
 }
 
 span {
 	cursor: pointer;
 	margin-left: 10px;
 }
 
 span:hover {
 	font-weight: bold;
 }
 
 a {
	text-decoration: none;
	color: black;
 }
 
 #slistlast {
 	background-color: #dddddd;
 	height: 2px;
 }
 
 #btnline:hover {
 	background-color: white;
 }
 
 #sbbtn {
 	width: 50px;
 	height: 26px;
 	border: none;
 	border-radius: 4px 4px 4px 4px;
 	cursor: pointer;
 	background-color: #cccccc;
 }
 
 #sbbtn:hover {
 	font-weight: bold;
 	background-color: #bbbbbb;
 }
 
 #search {
 	margin-top: 6px;
 	height: 26px;
 	border: 2px solid #cccccc;
 	padding-left: 10px;
 }
 
 #salesearch {
 	margin-top: 8px;
 	height: 22px;
 	border: 2px solid #cccccc;
 	padding-left: 10px;
 }
 
</style>
</head>
<body>
<%
	String salesearch = (String)request.getAttribute("salesearch");
	String salelist = (String)request.getAttribute("salelist");
	String dnickname = (String)request.getAttribute("dnickname");
	String categorylist = (String)request.getAttribute("categorylist");
	List<DealBoardDto> list = (List<DealBoardDto>)request.getAttribute("list");
	Paging paging = (Paging)request.getAttribute("paging");

%>
<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>
	<section>

		<div id="stable">
		<h1>판매게시판</h1>
		<table>
				<col width="100">
     			<col width="100">
     	 		<col width="300">
      			<col width="150">
     	 		<col width="150">
      			<col width="150">
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
					<input id="c_btn" type="submit" value="필터적용">
				</form>
			</td>
		</tr>
			<tr>
				<th>No.</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>가격</th>
				<th>작성일</th>
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
							<td align="left">
								<span onclick="location.href='dealboard.do?command=detailsaleboard&dboardno=${dealboarddto.dboardno}'">${dealboarddto.dtitle }</span>
							</td>
							<td>${dealboarddto.dnickname }</td>
							<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
							<td>${dealboarddto.dregdate }</td>
						</tr>
					</c:forEach>
					<tr><td colspan="6" id="slistlast"></td></tr>
					<%
						MemberDto dto = (MemberDto) session.getAttribute("memberdto");
						if(dto != null){
					%>		
					<tr>
						<td id="btnline" colspan="6" align="right">
							<button id="sbbtn" onclick="location.href='dealboard.do?command=insertsaleboard'">글 작성</button>
						</td>
					</tr>
					<%
						}
					%>
				</c:otherwise>
			</c:choose>
		</table></div>
		<%
		if(categorylist == null) {
			%>
			<jsp:include page="./paging/fntsalepaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
			<% 
		} else {
			if(categorylist.equals("A")||categorylist.equals("S")||categorylist.equals("D")||categorylist.equals("C")||categorylist.equals("F")) {
		%>
			<jsp:include page="./paging/fntsalecategorypaging.jsp">
			<jsp:param value="<%=categorylist %>" name="dcategory"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
		<% 
			} else {
		%>
		<jsp:include page="./paging/fntbuypaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			}
		}
	%>
	
	
	<form action="dealboard.do" method="post">
		<input type="hidden" name="command" value="salesearch"/>
		
			<select name="salelist" id="search">
				<option value="T">제목</option>
				<option value="W">작성자</option>
			</select>
			<input type="text"  name="salesearch" id="salesearch" value="<%=salesearch%>" required="required" placeholder="내용을 입력하세요"/>
			<input id="sbbtn" type="submit" value="검색"/>
		</form>
	
	
	</section>
<%@ include file="./form/footer.jsp" %>	

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	   $("select[name='salelist'] option[value="+"<%=salelist%>"+"]").attr("selected", true);
	   if($("input[name=salesearch]").val() == "null") {
	      $("input[name='salesearch']").prop("value","");
	   } else {
	   $("input[name='salesearch']").prop("value","<%=salesearch%>");
	}
	})
</script>

</body>
</html>