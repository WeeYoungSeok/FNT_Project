<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) 내 정보 보기</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
}
.tzone {width: 80%; margin: 0px auto; margin-top: 5%;}

h1 {text-align: center; font-family: "Arial";}

table {margin: 0px auto; margin-top: 2%; font-size: 12pt; font-family: "Arial"; border: 2px solid #cccccc;}
th {font-size: 14pt; background-color: #dddddd;}
td {height: 40px; padding-left: 20px;}

.acntBtn {width: 100%; height: 100%; font-family: "Arial"; cursor: pointer; border: none;}
#Udt {font-size: 14pt; font-weight: bold; background-color: #fee500; margin-top: 1%;}
#Udt:hover {color: white; background-color: black;}
#Dlt {font-size: 12pt; height: 90%; margin-top: 2%;}
#Dlt:hover {color: white; background-color: red; font-weight: bold;}

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
	<div class="tzone">
	<h1>내 정보 보기</h1>
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
			<td><%=memberdto.getMemberid() %></td>
			<th>PW</th>
			<td><%=memberdto.getMemberpw() %></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>NICKNAME</th>
			<td><%=memberdto.getMembernickname() %></td>
			<th>NAME</th>
			<td><%=memberdto.getMembername() %></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>PHONE</th>
			<td colspan="3"><%=memberdto.getMemberphone() %></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>EMAIL</th>
			<td colspan="3"><%=memberdto.getMemberemail() %></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<th>ADDRESS</th>
			<td colspan="3"><%=memberdto.getMemberaddr() %></td>
			<td></td>
		</tr>
		<tr style="height:60px;">
			<td></td>
			<td colspan="4" align="center" style="padding:0;">
				<input class="acntBtn" id="Udt" type="button" value="개인정보 수정" onclick="location.href='LoginCrudController?command=crudupdate&memberid=<%=memberdto.getMemberid()%>'">
			</td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="4" align="center" style="padding:0;">
				<input class="acntBtn" id="Dlt" type="button" value="탈퇴하기" onclick="location.href='LoginCrudController?command=outmember&memberid=<%=memberdto.getMemberid()%>&memberenabled=N'">
			</td>
			<td></td>
		</tr>
		<tr><td colspan="6"></td></tr>
	</table>
	</div>
				
	</section>
	
	<%@ include file="./form/footer.jsp" %>
	<%
		}
	%>
</body>
</html>