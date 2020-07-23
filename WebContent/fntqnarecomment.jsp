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
	<%
		if(memberdto == null) {
	%>
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href = "fntlogincrud.jsp";
			// 여기는 고쳐야함
		</script>
	<%
		} else {
	%>
		<form action="qna.do" method="post">
		<input type="hidden" name="command" value="qnarecommnetres"/>
		<input type="hidden" name="qbboardno" value="<%=qnaboardlistone.getQbboardno()%>"/>
		<table border="1"> 
			<tr>
				<td>고객센터 > 
				<button onclick="location.href='qna.do?command=qna'">목록</button></td>
			<tr>
			<tr>
				<td><%=qnaboardlistone.getQbtitle() %></td>
			</tr>
			<tr>
				<td><%=qnaboardlistone.getQbnickname() %></td>
			</tr>
			<tr>
				<td width="400" height="200"><textarea cols="54" rows="13" name="qbcontent" style="resize: none"><%=qnaboardlistone.getQbcontent() %><br><br><br></textarea></td>
			</tr>
	
	
		<tr>
		<td align="right">
			<input type="submit" value="완료">
			<button onclick="location.href='qna.do?command=qnadelete&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">삭제</button>
		</td>
		</tr>
		
		</table>
		</form>
		<%
		}
		%>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>