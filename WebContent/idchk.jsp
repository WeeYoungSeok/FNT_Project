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
		var id = opener.document.getElementsByName("memberid")[0].value;
		document.getElementsByName("id")[0].value = id;
	}
	
	function confirmid(bool) {
		if (bool == "true") {
			opener.document.getElementsByName("memberid")[0].title = 'y';
			opener.document.getElementsByName("memberpw")[0].focus();
		} else {
			opener.document.getElementsByName("memberid")[0].focus();
		}
		self.close();
	}
	
</script>
</head>
<body>
<%
	String idnotused = request.getParameter("idnotused");
%>

	
	<table>
		<tr>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td><%=idnotused.equals("true") ? "사용 가능한 ID입니다!" : "이미 사용중인 ID입니다!" %></td>
		</tr>
		<tr>
			<td>
				<button onclick="confirmid('<%=idnotused%>')">확인</button>
			</td>
		</tr>
	</table>
</body>
</html>