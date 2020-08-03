<%@page import="com.fnt.util.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 공지사항</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
 * {margin:0px; padding:0px;}

 aside {position:fixed; align:left; width:14%; height:100%; box-shadow:1px 0px 6px black; z-index:2;}

 #menubars {margin-top:50%; height:62%;}
 .menubar {padding-top:12%; background-color:black; color:white; width:100%; height:10%; text-align:left; font:16pt "Arial"; font-weight:bold; cursor:pointer; opacity:0.4;}
 .menubar > p {padding-left:10%;}
 .menubar:hover {opacity:0.6;}
 .menubar_x {background-color:black; width:100%; height:100%; opacity:0.4;}
 
 #ntable {float:center;}
 
 h1 {margin-top:4%; font-family:"Arial";}
 
 table {margin:0px auto; margin-top:2%; width:80%; height:auto; font-family:"Arial";} 
 tr:hover {background-color:#efefef;}
 th {font-size:14pt; background-color:#dddddd; height:30px; font-weight:bold; padding-top:2px;}
 td {font-size:12pt; height:24px;}
 
 span {cursor:pointer; margin-left:10px;}
 span:hover {font-weight:bold;}
 
 #nlistlast {background-color:#dddddd; height:2px;}
 
 #btnline:hover {background-color:white;}
 #nbbtn {width:50px; height:26px; border:none; border-radius:4px 4px 4px 4px; cursor:pointer; background-color:#cccccc;}
 #nbbtn:hover {font-weight:bold; background-color:#bbbbbb;}
 
 #searchnotice {margin-top:6px; height:26px; border:2px solid #cccccc; padding-left:10px;}
 
 #form1 {margin-top:4%;}
 </style>
</head>
<body>

	<%@ include file="./form/header.jsp" %>
	<aside>
		<div id="menubars">
			<div class="menubar" style="opacity:0.7;"><p onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>
	<%
		String searchnotice = (String)request.getAttribute("searchnotice");
		List<NoticeBoardDto> noticeboardlist = (List<NoticeBoardDto>)request.getAttribute("noticeboardlist");
		Paging paging = (Paging)request.getAttribute("paging");
	%>
	<section>
		<div id="ntable">
		<h1>공지사항</h1>
		<table>
			<col width="100">
     		<col width="400">
     	 	<col width="150">
      		<col width="200">
      		<tr align="center">
      			<th>No.</th>
      			<th>제목</th>
      			<th>작성자</th>
      			<th>작성일</th>
      		</tr>
			<%
				if (noticeboardlist == null) { 
			%>
				<tr align="center">
					<td colspan="4">작성된 글이 없습니다.</td>
				</tr>
			<%
				} else {
					for(int i = 0; i < noticeboardlist.size(); i++) {
			%>
				<tr align="center">
					<td><%=noticeboardlist.get(i).getNbboardno() %></td>
					<td align="left">
						<span onclick="location.href='notice.do?command=noticedetail&nbboardno=<%=noticeboardlist.get(i).getNbboardno()%>'"><%=noticeboardlist.get(i).getNbtitle() %></span>
					</td>
					<td><%=noticeboardlist.get(i).getNbnickname() %></td>
					<td><%=noticeboardlist.get(i).getNbregdate().substring(0,10) %></td>
				<tr>
			<%
				}	
			}
			
			%>
			<%
				if (memberdto == null || memberdto.getMemberrole().equals("USER")) {
			%>
			<tr><td colspan="4" id="nlistlast"></td></tr>
			<tr><td id="btnline" colspan="4" align="right"></td></tr>
			<%
				} else {
			%>
			<tr><td colspan="4" id="nlistlast"></td></tr>
			<tr>
				<td id="btnline" colspan="4" align="right">
					<button id="nbbtn" onclick="location.href='notice.do?command=noticeinsert'">글 작성</button>
				</td>
			</tr>
			
			<%
				}
			%>
		</table></div>
		
		<%
			if(searchnotice == null) {
		%>
	<jsp:include page="./paging/fntnoticepaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			} else {
	%>
		<jsp:include page="./paging/fntnoticesearchpaging.jsp">
		<jsp:param value="<%=searchnotice %>" name="searchnotice"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			}
	%>
	<form id="form1" action="notice.do?command=searchnotice" method="post">
		<input type="text" name="searchnotice" id="searchnotice" required="required" placeholder="공지사항 검색하기">		
		<span><input id="nbbtn" type="submit" value="검색"></span>
	</form>
	
	</section>
	
	<%@ include file="./form/footer.jsp" %>
</body>
</html>