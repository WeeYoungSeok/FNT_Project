<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nickname Validation</title>
<script type="text/javascript">

	onload = function() {
		var nick = opener.document.getElementsByName("membernickname")[0].value;
		document.getElementsByName("nick")[0].value = nick;
	}
	
	function confirmnick(bool) { 
		if (bool == "true") {
			opener.document.getElementById("NICKCHK").value = "a";
			opener.document.getElementsByName("membernickname")[0].title = 'y';
			opener.document.getElementsByName("membername")[0].focus();
		} else {
			opener.document.getElementById("NICKCHK").value = "";
			opener.document.getElementsByName("membernickname")[0].focus();
		}
		self.close(); 
	}
	
</script>
<%	String nicknotused = request.getParameter("nicknotused");%>
</head>
<body>	
	<table>
		<tr>
			<td><input type="text" name="nick"/></td>
		</tr>
		<tr>
			<td><%=nicknotused.equals("true") ? "사용 가능한 Nickname입니다!" : "이미 사용중인 Nickname입니다!" %></td>
		</tr>
		<tr>
			<td>
				<button onclick="confirmnick('<%=nicknotused%>')">확인</button>
			</td>
		</tr>
	</table>
</body>
</html>