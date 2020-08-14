<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) 내 정보 수정</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
*{margin: 0px; padding: 0px;}
#menutitle {padding-left:31% !important;}

h2 {text-align: center; font-family: "Arial"; margin-top: 8%; color: white;}
.tzone {width: 80%; margin: 0px auto; margin-top: 5%;}

table {margin: 0px auto; margin-top: 2%; font-size: 12pt; font-family: "Arial"; border: 2px solid rgba(255,255,255,0.5);}
th {font-size: 14pt; color: white; background-color: rgba(255,255,255,0.3);}
td {color: white; height: 40px; background-color: rgba(255,255,255,0);}
#Udt {font-size: 14pt; width: 99.9%; height: 100%; font-family: "Arial"; cursor: pointer; color: white; border: 2px solid rgba(255,255,255,0); border-radius: 4px 4px 4px 4px; background-color: rgba(255,255,255,0.2); margin-top: 1%;}
#Udt:hover {font-weight: bold; background-color: rgba(255,255,255,0); border: 2px solid rgba(255,255,255,0.5);}
.retype {height: 40px; padding-left: 10px; color: white !important; background-color: rgba(255,255,255,0.1) !important; border: none; font-size: 12pt;}

#updatemember{background-color: #EFEFEF;}
</style>
</head>
<body>

	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>

	<section>
		<%
		if(memberdto == null) {
	%>
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href = "fntlogincrud.jsp";
			// 여기는 고쳐야함
		</script>
	<%
		} else {
	%>

	<h2>내정보 수정</h2>
	<form action="LoginCrudController" method="post">
	<input type="hidden" name="command" value="crudupdateres">
	<input type="hidden" name="memberid" value="<%=memberdto.getMemberid()%>">
	
	<table>
		<col width="40">
		<col width="120">
		<col width="300">
		<col width="120">
		<col width="300">
		<col width="40">
		<tr><td colspan="6"></td></tr>
		<tr>
			<td></td>
			<th>ID</th>
			<td><b>&nbsp;&nbsp;<%=memberdto.getMemberid()%></b></td>
			<th>PW</th>
			<td><input type="text" class="retype" id="updatemember" name="memberpw" value="<%=memberdto.getMemberpw()%>" style="width: 290px;"></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>NICKNAME</th>
			<td><b>&nbsp;&nbsp;<%=memberdto.getMembernickname()%></b></td>
			<th>NAME</th>
			<td><b>&nbsp;&nbsp;<%=memberdto.getMembername()%></b></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>PHONE</th>
			<td colspan="3"><b>&nbsp;&nbsp;<%=memberdto.getMemberphone()%></b></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>email</th>
			<td colspan="3"><input type="text" class="retype" id="updatemember" name="memberemail" value="<%=memberdto.getMemberemail()%>" style="width: 713px;"></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="4">
				<input id="Udt" class="acntBtn" type="submit" value="수정하기">
			</td>
			<td></td>
		</tr>
		<tr><td colspan="6"></td></tr>
	</table>
	</form>
	</section>
	<%@ include file="./form/footer.jsp" %>
	<%
		}
	%>
</body>
</html>