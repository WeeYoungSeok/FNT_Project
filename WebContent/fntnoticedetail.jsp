<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : </title>
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
<%
	NoticeBoardDto noticeboardlistone = (NoticeBoardDto)request.getAttribute("noticeboardlistone");
%>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	<section>
		<div class="notice">
		<span>공지사항 ></span>
		<button onclick="location.href='notice.do?command=notice'">목록</button><br/>
		<span><%=noticeboardlistone.getNbtitle() %></span><br/>
		<span class="nickname"><%=noticeboardlistone.getNbnickname() %></span><br/>
		<hr/>
		<div>
			<span><%=noticeboardlistone.getNbcontent() %></span>
		</div>
		</div>
		<%
			if(memberdto == null) {
		%>
		
		<%
			} else if (memberdto.getMemberrole().equals("ADMIN")) {
		%>
			<div class="button">
			<button>수정</button>
			<button onclick="location.href='notice.do?command=noticedelete&nbboardno=<%=noticeboardlistone.getNbboardno()%>'">삭제</button>
		</div>
		<%
			} else if (memberdto.getMemberrole().equals("USER")) {
		%>
			
		<%
			}
		%>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>