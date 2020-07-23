<%@page import="com.fnt.model.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<%
		List<MemberDto> list = (List<MemberDto>) request.getAttribute("list");
	%>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	<section>
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
			for (MemberDto memberdto1 : list) {
		%>
		<tr>
			<td><%=memberdto1.getMemberid()%></td>
			<td><%=memberdto1.getMembernickname()%></td>
			<td><%=memberdto1.getMembername()%></td>
			<td><%=memberdto1.getMemberbirth()%></td>
			<td><%=memberdto1.getMemberphone()%></td>
			<td><%=memberdto1.getMemberaddr()%></td>
			<td><%=memberdto1.getMemberemail()%></td>
			<td><%=memberdto1.getMemberrole()%></td>
			<td><%=memberdto1.getMemberenabled()%></td>
			<td><%=memberdto1.getMemberregdate()%></td>
			<%
				if(memberdto1.getMemberenabled().equals("R")){
			%>
			<td>
				<input type="button" value="복귀" onclick="location.href='admin.do?command=reset&id=<%=memberdto1.getMemberid()%>'"/>
			</td>
			<%
				}
			%>
		</tr>
	<%
		}
	%>
	</table>
	<button onclick="location.href='fntadminpage.jsp'">뒤로가기</button>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>