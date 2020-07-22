<%@page import="com.fnt.model.dto.QnaBoardDto"%>
<%@page import="com.fnt.util.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 고객센터</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
 * {
 	margin: 0px; padding: 0px;
 }
 section {
 
 	padding-top: 90px; padding-left: 240px;
 
 }
 
 table {
 	margin-left: 400px;
 	margin-top: 20px;
 } 
 
 h1 {
 	margin-top: 180px;
 }
 span {
 	cursor: pointer;
 }
 a{
 	text-decoration: none;
 }
 </style>
 

</head>
<%
		List<QnaBoardDto> qnaboardlist = (List<QnaBoardDto>)request.getAttribute("qnaboardlist");
		Paging paging = (Paging)request.getAttribute("paging");
	%>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	
	<section>
		
		<h1 align="center">고객센터</h1>
		
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
				if (qnaboardlist == null) { 
			%>
				<tr align="center">
					<td colspan="4">작성된 글이 없습니다.</td>
				</tr>
			<%
				} else {
					for(int i = 0; i < qnaboardlist.size(); i++) {
			%>
				<tr align="center">
					<td><%=qnaboardlist.get(i).getQbboardno() %></td>
					
					
		
						<td align="left"><a href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>"><%=qnaboardlist.get(i).getQbtitle() %></a></td>
					
						
					
					
					<td><%=qnaboardlist.get(i).getQbnickname() %></td>
					<td><%=qnaboardlist.get(i).getQbregdate() %></td>
				<tr>
			<%
				}	
			}
			
			%>
			<tr>
				<td colspan="4" align="right">
					<button onclick="location.href='qna.do?command=qnainsert'">글 작성</button>
				</td>
			</tr>
		</table>
	<jsp:include page="./paging/fntqnapaging.jsp">
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