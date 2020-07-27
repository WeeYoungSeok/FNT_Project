<%@page import="com.fnt.model.dto.AlertDto"%>
<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람내역</title>
<script type="text/javascript" src="js/fntalert.jsp"></script>
</head>
<body>
	<%
		//세션에 값이 담긴 memberdto을 받아온다.
		MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
		List<AlertDto> alertlist = (List<AlertDto>)request.getAttribute("alertlist");
	%>
	<h4><%=memberdto.getMembernickname() %>님의 알림내역</h4>
	
	<table>
	<%
		for(int i = 0; i < alertlist.size(); i++){
	%>
		<tr>
			<td>
				<%=alertlist.get(i).getAlertno() %>.
				회원님이 올린 "<%=alertlist.get(i).getDealboarddto().getDtitle() %>"게시글에 댓글을 달렸습니다.
			</td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>