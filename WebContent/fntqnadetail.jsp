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
				<button onclick="location.href='qna.do?command=qna'">목록</button></td>
			<tr>
			<tr>
				<td><%=qnaboardlistone.getQbtitle() %></td>
			</tr>
			<tr>
				<td><%=qnaboardlistone.getQbnickname() %></td>
			</tr>
			<tr>
			
				<td width="400" height="200" style="vertical-align: top;"><br/><p style="font-weight: bold;">Q.문의 내용</p><%=qnaboardlistone.getQbcontent() %>
			
				<%
				if (qnaboardlistone.getQbflag().equals("Y")) {
				%>
					<span>&nbsp;&nbsp;&nbsp;문의 답변 | 등록일 : <%=qnaboardlistone.getQbredate() %></span>
				<%
				} 
				%>
				</td>
			</tr>
	
		<%
			if(memberdto == null) {
		%>
		
		<%
			} else {
				if (memberdto.getMemberrole().equals("ADMIN")) {
		%>
		<tr>
			<td align="right">
				<button onclick="location.href='qna.do?command=qnarecomment&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">답변</button>
				<button onclick="location.href='qna.do?command=qnadelete&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">삭제</button>
			</td>
		</tr>
		<%
			} else if (qnaboardlistone.getQbflag().equals("Y")){
		%>
			<tr>
				<td align="right">
					<button onclick="location.href='qna.do?command=qnadelete&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">삭제</button>
				</td>
			</tr>
		<%
			} else if (memberdto.getMemberid().equals(qnaboardlistone.getQbid()) || qnaboardlistone.getQbflag().equals("N")){
				
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
		}
		
		%>
		
		
		</table>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>