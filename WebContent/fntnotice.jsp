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
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
 table {
 	margin-left: 100px;
 	margin-top: 20px;
 } 
 
 h1 {
 	margin-top: 20px;
 }
 span {
 	cursor: pointer;
 }
 </style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	<%
		List<NoticeBoardDto> noticeboardlist = (List<NoticeBoardDto>)request.getAttribute("noticeboardlist");
		Paging paging = (Paging)request.getAttribute("paging");
	%>
	<section>
		
		<h1>공지사항</h1>
		
		<table>
		
			<col width="50">
     		<col width="300">
     	 	<col width="100">
      		<col width="300">
      		
      		<tr align="center">
      			<th></th>
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
					<td align="left"><span onclick="location.href='notice.do?command=noticedetail&nbboardno=<%=noticeboardlist.get(i).getNbboardno()%>'"><%=noticeboardlist.get(i).getNbtitle() %></span></td>
					<td><%=noticeboardlist.get(i).getNbnickname() %></td>
					<td><%=noticeboardlist.get(i).getNbregdate() %></td>
				<tr>
			<%
				}	
			}
			
			%>
			<tr>
				<td colspan="4" align="right">
					<button onclick="location.href='notice.do?command=noticeinsert'">글 작성</button>
				</td>
			</tr>
		</table>
	<jsp:include page="./paging/fntnoticepaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>



	
		
		
		
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>