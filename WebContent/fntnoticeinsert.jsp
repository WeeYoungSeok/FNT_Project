<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 공지사항 글 작성</title>
<link href="css/fntnoticeinsert.css" rel="stylesheet" type="text/css" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

section {
	padding-top: 90px;
	padding-left: 240px;
}
span {
	color: red;
}
</style>
</head>
<body>
	
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
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
		<form action="notice.do" method="post">
			<input type="hidden" value="noticeinsertres" name="command"/>
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<table>
				<tr>
				<td>
				제목
				</td>
				<td>
				<input type="text" name="nbtitle"/>
				</td>
			</tr>
			<tr>
				<td>
				내용
				</td>
				<td><textarea cols="50" rows="5" name="nbcontent"></textarea></td>
			</tr>
			<tr>
			<td align="right" colspan="2">
				<input type="button" value="취소"
					onclick="location.href='notice.do?command=notice'" />
					 <input type="submit" value="완료" />
					 </td>
			</tr>
			</table>
		</form>
	</section>
	<%@ include file="./form/footer.jsp"%>
	
	<%
	}
	%>
</body>
</html>