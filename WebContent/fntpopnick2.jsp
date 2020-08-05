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

	function reportform(){
		open("LoginCrudController?command=report2&membernickname=<%=membernickname%>","","width=700, height=550");
		self.close();
	}
</script>
<style type="text/css">
	*{
		margin : 0px;
		padding : 0px;
	}
	#head{
		background-color: black;
		color : white;
		text-align : center;
		 width: 100vw;
		 height: 40px;
		 padding-top: 16px;
		 padding-bottom : 10px;
	}
	table{
		border : 1px solid black;
		margin : auto;
		text-align : center;
		margin-top : 50px;
	}
	tr{
		height : 50px;
	}
	th{
	background-color: #cccccc;
	}
	#tracebtn {
	margin : 0px;
	width: 100%; 
	height: 50px; 
	border: none; 
	border-radius: 2px 2px 2px 2px; 
	cursor: pointer; 
	font-size: 12pt;
	color: black;
	float: center;
	font-weight: bold;
}

	#tracebtn:hover {
	font-weight: bold;
	color: white;
	background-color: black;
}
	#nicknamebottom{
	border-bottom : 1px solid black;
	}
</style>
</head>
<body>
	<h2 id="head"><%=membernickname %>님의 정보보기</h2>
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
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><input id="tracebtn" type="button" value="신고" style="background-color : red;" onclick="reportform();"/></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="4"></td>
		</tr>
	</table>
	
	<%@ include file="./form/footer.jsp" %>
</body>
</html>