
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
 * {margin:0px; padding:0px;}

 aside {position:fixed; align:left; width:14%; height: 100%; box-shadow: 1px 0px 6px black; z-index: 2;}

 #menubars {margin-top: 50%; height: 62%;}
 .menubar {padding-top: 12%; background-color: black; color: white; width: 100%; height: 10%; text-align: left; font: 16pt "Arial"; font-weight: bold; cursor: pointer; opacity: 0.4;}
 .menubar > p {padding-left: 10%;}
 .menubar:hover {opacity: 0.6;}
 .menubar_x {background-color: black; width: 100%; height: 100%; opacity: 0.4;}

 #stable {float: center;}
 
 h1 {margin-top: 4%; font-family: "Arial";}
 
 #categorylist {cursor: pointer;}
 
 #c_btn {width: 50px; height: 19px; border: none; border-radius: 2px 2px 2px 2px; cursor: pointer; color: white; background-color: #595959; margin-bottom: 10px;}
 #c_btn:hover {font-weight: bold;}
 
 table {margin: 0 auto; margin-top: 1%; width: 80%; height: auto; font-family: "Arial";} 
 tr:hover {background-color: #efefef;} 
 th {font-size: 14pt; background-color: #dddddd; height: 30px; font-weight: bold; padding-top: 2px;}
 td {font-size: 12pt; height: 24px;}
 
 span {cursor: pointer; margin-left: 10px;}
 span:hover {font-weight: bold;}
 
 a {text-decoration: none; color: black;}
 
 #slistlast {background-color: #dddddd; height: 2px;}
 
 #btnline:hover {background-color: white;}
 #sbbtn {width: 50px; height: 26px; border: none; border-radius: 4px 4px 4px 4px; cursor: pointer; background-color: #cccccc;}
 #sbbtn:hover {font-weight: bold; background-color: #bbbbbb;}
 
 #search {margin-top: 6px; height: 26px; border: 2px solid #cccccc; padding-left: 10px;}
 #salesearch {margin-top: 8px; height: 22px; border: 2px solid #cccccc; padding-left: 10px;}
 
 #form1 {margin-top: 5%;}
 
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
	<aside>
		<div id="menubars">
			<div class="menubar"><p onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar" style="opacity:0.7;"><p onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>
	
	<section>

		<div id="stable">
		<h1>판매게시판</h1>
		<table>
				<col width="100">
     			<col width="100">
     			<col width="100">
     	 		<col width="300">
      			<col width="150">
     	 		<col width="150">
      			<col width="150">
		<tr>
			<td colspan="6" id="btnline">
			<form action="dealboard.do" method="post">
			<input type="hidden" name="command" value="salesearchlist"/>	
			<input type="hidden" name="salesearch" value="sadjklsjwklsadlsa"/>
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
				<th>이미지</th>
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
					<c:forEach items="${list }" var="dealboarddto" varStatus="status">
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
								<div style="width:100;height:100;">
								<c:choose>
									<c:when test="${dealboarddto.dfilename ne 'undefined'}">
										<img src="${dealboarddto.dfilename }" style="width:100%;height:100%;">
									</c:when>
									<c:otherwise>
										<img src="./img/fnt_logo.png" style="width: 100%;height: 100%;">
									</c:otherwise>
								</c:choose>
								</div>
							</td>
							<td align="left">
								<span onclick="location.href='dealboard.do?command=detailsaleboard&dboardno=${dealboarddto.dboardno}'">
								<c:choose>
									<c:when test="${dealboarddto.dsellflag eq 'Y' || dealboarddto.dsellflag eq 'F' }">
										[판매완료]
									</c:when>
								</c:choose>
								${dealboarddto.dtitle }
								<c:choose>
									<c:when test="${replyAllCount[status.index] ne 0}">
										(${replyAllCount[status.index]})
									</c:when>
								</c:choose>								
								</span>
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
		if(categorylist == null || salesearch == null) {
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
			<jsp:param value="<%=salesearch %>" name="salesearch"/>
			<jsp:param value="<%=categorylist %>" name="dcategory"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<% 
			} else if(categorylist.equals("CHECK")){
	%>
		<jsp:include page="./paging/fntsalepaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			} else if(salelist.equals("W") || salelist.equals("T")) {
	%>
				<jsp:include page="./paging/fntsalesearchtitlepaging.jsp">
				<jsp:param value="<%=salelist %>" name="salelist"/>
				<jsp:param value="<%=categorylist %>" name="categorylist"/>
			<jsp:param value="<%=salesearch %>" name="salesearch"/>
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
	<form id="form1" action="dealboard.do" method="post">
		<input type="hidden" name="command" value="salesearch"/>
		<input type="hidden" name="categorylist" value="Z"/>
			<select name="salelist" id="search">
				<option value="T">제목</option>
				<option value="W">작성자</option>
			</select>
			<input type="text"  name="salesearch" id="salesearch" value="" required="required" />
			<input id="sbbtn" type="submit" value="검색"/>
		</form>

	</section>
<%@ include file="./form/footer.jsp" %>	

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</body>
</html>