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
<title>Insert title here</title>
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
</style>
</head>
<body>
	<%
		MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");
	%>
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	<section>

		<form action="notice.do?cammand=notice" method="post">
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<div>
				<input type="text" name="qbtitle"/>
			</div>
			<div>
				<textarea cols="50" rows="5" name="qbcontent"></textarea>
			</div>
			<div>
				<input type="button" value="취소"
					onclick="location.href='notice.do?command=notice'" /> <input
					type="submit" value="완료" />
			</div>
		</form>
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>