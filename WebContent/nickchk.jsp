<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/section2.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {margin: 0px; padding: 0px;}
section {margin: 0px; padding: 0px;}

table {margin: 0px auto; margin-top: 6%;}

#submitbtn {
	margin-top: 1%;
	background-color: rgba(255,255,255,0.3);
	cursor: pointer;
	width: 50%;
	float: center;
	height: 40px;
	color: white;
	font-size: 14pt;
	font-weight: bold;
	border-radius: 4px 4px 4px 4px;
	border: 2px solid rgba(255,255,255,0);
}

#submitbtn:hover {
	font-weight: bold;
	background-color: rgba(255,255,255,0);
	border: 2px solid rgba(255,255,255,0.5);
}

input {
	width: 100%;
	height: 30px;
	border: none;
	text-align: center;
	color: white;
	font-size: 12pt;
	background-color: rgba(255,255,255,0.1);
}
</style>
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
<section>
	<table>
		<tr>
			<td><input type="text" name="nick" readonly="readonly"/></td>
		</tr>
		<tr><td style="height: 16px;"></td></tr>
		<tr>
			<td><span style="font-family: Arial; text-align: center; color: white;"><%=nicknotused.equals("true") ? "사용 가능한 Nickname입니다!" : "이미 사용중인 Nickname입니다!" %></span></td>
		</tr>
		<tr>
			<td>
				<button style="width: 100%;" id="submitbtn" onclick="confirmnick('<%=nicknotused%>')">확인</button>
			</td>
		</tr>
	</table>
</section>
</body>
</html>