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
table {width: 60%; margin: 0px auto; margin-top: 8%;}

input {
	width: 100%;
	height: 30px;
	text-align: center;
	border: none;
	color: white;
	font-size: 12pt;
	background-color: rgba(255,255,255,0.1);
}

#submitbtn {
	margin-top: 2%;
	background-color: rgba(255,255,255,0.2);
	cursor: pointer;
	width: 100%;
	height: 40px;
	color: white;
	font-size: 14pt;
	border-radius: 4px 4px 4px 4px;
	border: 2px solid rgba(255,255,255,0);
}

#submitbtn:hover {
	font-weight: bold;
	background-color: rgba(255,255,255,0);
	border: 2px solid rgba(255,255,255,0.5);
}
</style>
<title>FNT - ID Validation</title>
<script type="text/javascript">

	onload = function() {
		var id = opener.document.getElementsByName("memberid")[0].value;
		document.getElementsByName("id")[0].value = id;
	}
	
	function confirmid(bool) { 
		if (bool == "true") {
			opener.document.getElementById("IDCHK").value = "a";
			opener.document.getElementsByName("memberid")[0].title = 'y';
			opener.document.getElementsByName("memberpw")[0].focus();
			self.close(); 
		} else {
			opener.document.getElementById("IDCHK").value = "";
			opener.document.getElementsByName("memberid")[0].focus();
		self.close(); 
		}
	}
	
</script>
<%	String idnotused = request.getParameter("idnotused");%>
</head>
<body>
<section>
	<table>
		<tr>
			<td><input type="text" name="id" readonly="readonly"/></td>
		</tr>
		<tr style="height: 10px;"><td></td></tr>
		<tr>
			<td style="font-family: Arial; color: white; text-align: center;"><span><%=idnotused.equals("true") ? "사용 가능한 ID입니다!" : "이미 사용중인 ID입니다!" %></span></td>
		</tr>
		<tr>
			<td>
				<button id="submitbtn" onclick="confirmid('<%=idnotused%>')">확인</button>
			</td>
		</tr>
	</table>
</section>
</body>
</html>