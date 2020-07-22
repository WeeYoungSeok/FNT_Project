<%@page import="com.fnt.model.dto.QnaBoardDto"%>
<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	QnaBoardDto qnaboardlistone = (QnaBoardDto)request.getAttribute("qnaboardlistone");
%>
<title>FNT(Feel New Item) : <%=qnaboardlistone.getQbtitle() %></title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	.notice{
		margin-left: 300px;
		margin-top: 200px;
		border: 1px solid gray;
		width: 600px;
	}
	.nickname{
		margin-bottom: 30px;
	}
	.button{
		margin-left: 300px;
		
	}
</style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	<section>
		<table border="1"> 
			<tr>
				<td>고객센터 > 
				<button onclick="location.href='notice.do?command=notice'">목록</button></td>
			<tr>
			<tr>
				<td><%=qnaboardlistone.getQbtitle() %></td>
			</tr>
			<tr>
				<td><%=qnaboardlistone.getQbnickname() %></td>
			</tr>
			<tr>
				<td width="400" height="200"><%=qnaboardlistone.getQbcontent() %></td>
			</tr>
	
		<%
			if(memberdto == null) {
		%>
		
		<%
			} else if (memberdto.getMemberid().equals(qnaboardlistone.getQbid()) || qnaboardlistone.equals("ADMIN")) {
		%>
		<tr>
		<td align="right">
			<button onclick="location.href='qna.do?command=qnaupdate&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">수정</button>
			<button onclick="location.href='qna.do?command=qnadelete&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">삭제</button>
		</td>
		</tr>
		<%
			} else {
		%>
			
		<%
			}
		%>
		</table>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>