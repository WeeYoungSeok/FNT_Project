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

 .menubar:nth-child(1) {font-weight:bold;}

 #ntable {float:center;}
 
 h1 {margin-top:2%; font-family:"Arial"; text-align:left; margin-left: 10%; color: white;}
 
 table {margin:0px auto; margin-top:1%; width:80%; height:auto; font-family:"Arial";} 
 tr:hover {background-color:rgba(255,255,255,0.5);}
 th {font-size:14pt; color:rgba(255,255,255,0.5); font-weight:bold; height:30px; font-weight:bold; padding-top:2px;}
 td {font-size:12pt; color: white;height:28px;}
 .hovernot:hover {background-color:rgba(255,255,255,0);}
 
 span {cursor:pointer; margin-left:10px;}
 span:hover {font-weight:bold;}
 
 #nlistlast {background-color:rgba(255,255,255,0.5); height:2px;}
 
 #nbbtn {width:50px; height:30px; color:white;font-weight:bold; border:none; border-radius:4px 4px 4px 4px; cursor:pointer; background-color:rgba( 255, 255, 255, 0.5 );}
 #nbbtn:hover {color:white;background-color:rgba(255,255,255,0);border:2px solid rgba(255,255,255,0.5);}
 
 #searchnotice {margin-top:6px; height:26px; border:2px solid white; border-radius: 4px 4px 4px 4px; padding-left:10px;}
 
 #form1 {margin-top:4%;}
 </style>
</head>
<body>

	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	
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
      		<tr class="hovernot" align="center">
      			<th>No.</th>
      			<th>제목</th>
      			<th>작성자</th>
      			<th>작성일</th>
      		</tr>
			<tr class="hovernot"><td colspan="4" id="nlistlast"></td></tr>
			<%
				if (noticeboardlist == null) { 
			%>
				<tr align="center">
					<td colspan="4">현재 작성된 글이 없습니다.</td>
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
			<tr class="hovernot"><td colspan="4" id="nlistlast"></td></tr>
			<tr class="hovernot"><td colspan="4" align="right"></td></tr>
			<%
				} else {
			%>
			<tr><td colspan="4" id="nlistlast"></td></tr>
			<tr class="hovernot">
				<td colspan="4" align="right">
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