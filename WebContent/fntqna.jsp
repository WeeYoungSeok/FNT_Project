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
	color: black;
}
 </style>
 
 

</head>
	<%
		List<QnaBoardDto> qnaboardlist = (List<QnaBoardDto>)request.getAttribute("qnaboardlist");
		Paging paging = (Paging)request.getAttribute("paging");
		String selectlist = (String)request.getAttribute("selectlist");
		String searchqna = (String)request.getAttribute("searchqna");
	%>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	
	<section>
		
		<h1 align="center">고객센터</h1>
		
		<table>
		
			<col width="50">
			<col width="100">
     		<col width="300">
     	 	<col width="100">
      		<col width="300">
      		
      		<tr align="center">
      			<th></th>
      			<th>답변여부</th>
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
					<%
						if (memberdto == null) {
							if (qnaboardlist.get(i).getQbflag().equals("N")) {
					%>
							<td>처리중</td>
					<%
							} else {
					%>
							<td>답변완료</td>
					<% 
							}
						} else {
						
							if (qnaboardlist.get(i).getQbflag().equals("N")) {
					%>
							<td>처리중</td>
					<%
						} else {
							%>
							<td>답변완료</td>
							<% 
						
						}
					}
					%>
					
					
					<%
						if (memberdto == null) {
							if (qnaboardlist.get(i).getQbsecret().equals("Y")) {
					%>
							<td align="left"><a onclick="alert('비밀글입니다'); return false;" href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>">(비밀글)<%=qnaboardlist.get(i).getQbtitle() %></a></td>
					<%
							} else {
					%>
							<td align="left"><a href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>"><%=qnaboardlist.get(i).getQbtitle() %></a></td>
					<% 
							}
						} else {
						
							if (qnaboardlist.get(i).getQbsecret().equals("Y")) {
					%>
							<td align="left"><a id="secret" onclick="<%=((qnaboardlist.get(i).getQbid().equals(memberdto.getMemberid())) || (memberdto.getMemberrole().equals("ADMIN"))) ? "return true;" : "alert('비밀글입니다'); return false;"%>" href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>">(비밀글)<%=qnaboardlist.get(i).getQbtitle() %></a></td>
					<%
						} else {
							%>
							<td align="left"><a href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>"><%=qnaboardlist.get(i).getQbtitle() %></a></td>
							<% 
						
						}  
					}
					%>
					<td><%=qnaboardlist.get(i).getQbnickname() %></td>
					<td><%=qnaboardlist.get(i).getQbregdate() %></td>
				<tr>
			<%
				}	
			}
			
			%>
			<tr>
				<td colspan="5" align="right">
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
	
	<form action="qna.do" method="post">
		<input type="hidden" name="command" value="searchqna">
		
		
		<select id="selectlist" name="selectlist">
			<option value="T">제목</option>
			<option value="W">작성자</option>
		</select>
		<input type="text" name="searchqna" id="searchqna" value="<%=searchqna %>" required="required" placeholder="내용을 입력하세요.">		
		<span><input id="ss" type="submit" value="검색"></span>
	</form>
		
	</section>
	<%@ include file="./form/footer.jsp" %>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("select[name='selectlist'] option[value="+"<%=selectlist%>"+"]").attr("selected", true);
	if($("#searchqna").val() == "null") {
		$("input[name='searchqna']").prop("value","");
	} else {
	$("input[name='searchqna']").prop("value","<%=searchqna%>");
}
})
</script>
	
</body>
</html>