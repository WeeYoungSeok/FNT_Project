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

h2 {text-align: center; font-family: "Arial"; margin-top: 8%;}
.tzone {width: 80%; margin: 0px auto; margin-top: 5%;}

table {margin: 0px auto; margin-top: 2%; font-size: 12pt; font-family: "Arial"; border: 2px solid #cccccc;}
th {font-size: 14pt; background-color: #dddddd;}
td {height: 40px; padding-left: 0px;}
.acntBtn {width: 100%; height: 100%; font-family: "Arial"; cursor: pointer; border: none;}
#Udt {font-size: 14pt; font-weight: bold; background-color: #fee500; margin-top: 1%;}
#Udt:hover {color: white; background-color: black;}
input {
	width: 98%;
	height: 40px;
	padding-left: 10px;
	border: none;
	font-size: 12pt;
}

#updatemember{
	background-color: #EFEFEF;
}


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
			<th>Id</th>
			<td>&nbsp;&nbsp;<%=memberdto.getMemberid()%></td>
			<th>PW</th>
			<td><input type="text" id="updatemember" name="memberpw" value="<%=memberdto.getMemberpw()%>" style="width: 99%;"></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>NICKNAME</th>
			<td>&nbsp;&nbsp;<%=memberdto.getMembernickname()%></td>
			<th>NAME</th>
			<td>&nbsp;&nbsp;<%=memberdto.getMembername()%></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>PHONE</th>
			<td colspan="3">&nbsp;&nbsp;<%=memberdto.getMemberphone()%></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>email</th>
			<td colspan="3"><input type="text" id="updatemember" name="memberemail" value="<%=memberdto.getMemberemail()%>" style="width: 99%;"></td>
			<td></td>
		</tr>
		<tr>
		<td></td>
			<td colspan="4" align="center" style="padding:0;">
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