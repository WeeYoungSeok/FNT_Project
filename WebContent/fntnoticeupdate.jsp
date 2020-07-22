<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	NoticeBoardDto noticeboardlistone = (NoticeBoardDto)request.getAttribute("noticeboardlistone");
%>
<title>FNT(Feel New Item) : <%=noticeboardlistone.getNbtitle() %></title>
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
	<form action="notice.do" method="post">
		<input type="hidden" value="noticeupdateres" name="command"/>
		<input type="hidden" value="<%=noticeboardlistone.getNbboardno() %>" name="nbboardno"/>
		<table border="1"> 
			<tr>
				<td>공지사항 > 
				<button onclick="location.href='notice.do?command=notice'">목록</button></td>
			<tr>
			<tr>
				<td><input type="text" value="<%=noticeboardlistone.getNbtitle() %>" name="nbtitle"/></td>
			</tr>
			<tr>
				<td><%=noticeboardlistone.getNbnickname() %></td>
			</tr>
			<tr>
				<td width="400" height="200"><textarea cols="55" rows="14" name="nbcontent" style="resize: none"><%=noticeboardlistone.getNbcontent() %></textarea></td>
			</tr>
	
		<%
			if(memberdto == null) {
		%>
		
		<%
			} else if (memberdto.getMemberrole().equals("ADMIN")) {
		%>
		<tr>
		<td align="right">
			<input type="submit" value="완료"/>
			<input type="button" value="취소" onclick="location.href='notice.do?command=noticedetail&nbboardno=<%=noticeboardlistone.getNbboardno()%>'"/>
		</td>
		</tr>
		<%
			} else if (memberdto.getMemberrole().equals("USER")) {
		%>
			
		<%
			}
		%>
		</table>
		</form>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>