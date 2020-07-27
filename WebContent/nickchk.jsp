<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	onload = function(){
		var nick = opener.document.getElementsByName("membernickname")[0].value;
		document.getElementsByName("nick")[0].value = nick;
	}
	
	function confirmid(bool) { 
		if (bool == "true") {
			opener.document.getElementsByName("membernick")[0].title = 'y';
			opener.document.getElementsByName("memberbirth")[0].focus();
		} else {
			$('.NickChk').val('');
			opener.document.getElementsByName("membernick")[0].focus();
		}
		self.close(); 
	}
	
</script>
</head>
<body>
<%
	String nicknotused = request.getParameter("nicknotused");
%>

	
	<table>
		<tr>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td><%=nicknotused.equals("true") ? "사용 가능한 ID입니다!" : "이미 사용중인 ID입니다!" %></td>
		</tr>
		<tr>
			<td>
				<button onclick="confirmid('<%=nicknotused%>')">확인</button>
			</td>
		</tr>
	</table>
</body>
</html>