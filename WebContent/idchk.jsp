<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#submitbtn {
	margin-top: 1%;
	background-color: #fee500;
	cursor: pointer;
	width: 50%;
	height: 40px;
	color: black;
	font-size: 14pt;
	font-weight: bold;
	border: none;
}

#submitbtn:hover {
	color: white;
	background-color: black;
}

input {
	width: 98%;
	height: 40px;
	padding-left: 10px;
	border: none;
	font-size: 12pt;
	background-color: #EFEFEF;
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
	<table>
		<tr>
			<td><input type="text" name="id" readonly="readonly"/></td>
		</tr>
		<tr>
			<td><span style="font-family: Arial;"><%=idnotused.equals("true") ? "사용 가능한 ID입니다!" : "이미 사용중인 ID입니다!" %></span></td>
		</tr>
		<tr>
			<td>
				<button style="width: 100%;" id="submitbtn" onclick="confirmid('<%=idnotused%>')">확인</button>
			</td>
		</tr>
	</table>
</body>
</html>