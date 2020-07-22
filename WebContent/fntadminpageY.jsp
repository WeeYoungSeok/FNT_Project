<%@page import="com.fnt.model.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
</head>
<body>
	<%
		List<MemberDto> list = (List<MemberDto>) request.getAttribute("list");
	%>
	<h1>회원 상태 조회</h1>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>이메일</th>
			<th>등급</th>
			<th>여부</th>
			<th>가입 날짜</th>
		</tr>
		<%
			for (MemberDto memberdto : list) {
		%>
		<tr>
			<th><%=memberdto.getMemberid()%></th>
			<th><%=memberdto.getMembernickname()%></th>
			<th><%=memberdto.getMembername()%></th>
			<th><%=memberdto.getMemberbirth()%></th>
			<th><%=memberdto.getMemberphone()%></th>
			<th><%=memberdto.getMemberaddr()%></th>
			<th><%=memberdto.getMemberemail()%></th>
			<th><%=memberdto.getMemberrole()%></th>
			<th><%=memberdto.getMemberenabled()%></th>
			<th><%=memberdto.getMemberregdate()%></th>
		</tr>
	<%
		}
	%>
	</table>

</body>
</html>