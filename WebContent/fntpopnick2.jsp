<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	<% String membernickname = request.getParameter("popnick"); %>

	function reportform(){
		open("LoginCrudController?command=report2&membernickname=<%=membernickname%>","","width=700, height=550");
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
			<td><input type="button" value="신고하기" onclick="reportform();"></td>
		</tr>
		
	</table>
</body>
</html>