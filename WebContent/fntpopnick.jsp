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
	function closePop() {
		opener.location.href='dealboard.do?command=popnick&membernickname=<%=membernickname%>';
		self.close();
	}
	
	function reportform() {
		open("LoginCrudController?command=report2&membernickname=<%=membernickname%>","","width=700, height=550");
		self.close();
	}
</script>
<link href="css/section2.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

section {
	margin: 0px;
	padding: 0px;
}

#head {
	background-color: rgba(255,255,255,0.1);
	color: white;
	text-align: center;
	width: 100vw;
	height: 40px;
	padding-top: 16px;
	padding-bottom : 10px;
}

table {
	border: 2px solid rgba(255,255,255,0.5);
	margin: auto;
	text-align: center;
	margin-top: 50px;
	font-family: Arial;
}

tr {
	height: 40px;
}

th {
	color: white;
	font-weight: bold;
	background-color: rgba(255,255,255,0.2);
}

.listbtn {
	margin: 0px;
	width: 100%; 
	height: 40px; 
	border: 3px solid rgba(255,255,255,0); 
	border-radius: 4px 4px 4px 4px; 
	cursor: pointer; 
	font-size: 12pt;
	color: white;
	background-color: rgba(255,255,255,0.3);
	float: center;
}

.listbtn:hover {
	font-weight: bold;
	background-color: rgba(255,255,255,0);
	border: 3px solid rgba(255,255,255,0.5);
}

.reportbtn {
	margin: 0px;
	width: 100%; 
	height: 30px; 
	border: 3px solid rgba(255,255,255,0); 
	border-radius: 4px 4px 4px 4px; 
	cursor: pointer; 
	font-size: 12pt;
	color: white;
	background-color: rgba(255,255,255,0.1);
	float: center;
}

.reportbtn:hover {
	font-weight: bold;
	background-color: rgba(255,255,255,0);
	border: 3px solid red;
}

#nicknamebottom{
	color: white;
}
</style>
</head>
<body>
<section>
	<h2 id="head" style="font-family:Arial;"><%=membernickname %>님의 정보보기</h2>
	<table>
		<col width=40/>
		<col width=80/>
		<col width=140/>
		<col width=40/>
		<tr>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td></td>
			<th>닉네임 </th>
			<td id="nicknamebottom"><%=membernickname %></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><input class="listbtn" type="button" value="목록"onclick="closePop();"/></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><input class="reportbtn" type="button" value="신고" onclick="reportform();"/></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="4"></td>
		</tr>
	</table>
</section>
</body>
</html>