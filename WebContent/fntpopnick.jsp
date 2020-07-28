<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	<% String membernickname = request.getParameter("popnick"); %>
	function closePop(){
		opener.location.href='dealboard.do?command=popnick&membernickname=<%=membernickname%>';
		self.close();
	}

</script>
</head>
<body>
	<h2><%=membernickname %>님의 정보보기</h2>
	<table border="1">
		<tr>
			<td>닉네임 : <%=membernickname %></td>
		</tr>
		<tr>
			<td><input type="button" value="판매목록보기" onclick="closePop();"></td>
		</tr>
		<tr>
			<td><input type="button" value="신고하기" onclick=""></td>
		</tr>
		<tr>
			<td><input type="button" value="채팅하기" onclick=""></td>
		</tr>
	</table>
</body>
</html>