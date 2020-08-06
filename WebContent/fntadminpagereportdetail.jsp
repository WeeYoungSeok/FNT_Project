<%@page import="com.fnt.model.dto.ReportDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)신고상세보기</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {
	margin:0px;
	padding:0px;
}

h1 {
	font-family: "Arial";
	text-align:center;
	margin-top: 4%;
}

table {
	width: 70%;
	margin: 0px auto;
	margin-top: 2%;
	font-family:"Arial";
}

tr {
	height: 30px;
}

th {
	font-size: 12pt;
	font-weight: bold;
	text-align: center;
	background-color: #dddddd;
}

td {
	font-size: 11pt;
	padding-left: 10px;
	background-color: #f9f9f9;
}

textarea {
	border: none;
	padding-top: 10px;
	font-size: 11pt;
	width: 100%;
	height: 100%;
	background-color: #f9f9f9;
}

#rpbtn {
	width: 50px; 
	height: 30px; 
	border: none; 
	border-radius: 4px 4px 4px 4px; 
	cursor: pointer; 
	background-color: #cccccc; 
	margin-top: 2px;
}

#rpbtn:hover {
	font-weight: bold; 
	background-color: red;
	color: white;
}
</style>
</head>
<body>
<%
	ReportDto dto = (ReportDto)request.getAttribute("reportdto");
%>
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
		<h1>신고 상세보기</h1>
		<table>
			<tr>
				<th>No.</th>
				<td><%=dto.getReportno() %></td>
			</tr>
			<tr>
				<th>신고자 닉네임</th>
				<td><%=dto.getSendnickname() %></td>
			</tr>
			<tr>
				<th>신고자 ID</th>
				<td><%=dto.getSendid() %></td>
			</tr>
			<tr>
				<th>신고 사유</th>
				<td><%=dto.getReporttitle() %></td>
			</tr>
			<tr>
				<th>상세 내용</th>
				<td>
					<textarea cols="60" rows="10"><%=dto.getReportcontent() %></textarea>
				</td>
			</tr>
			<tr>
				<th>대상자 닉네임</th>
				<td><%=dto.getReceivenickname() %></td>
			</tr>
			<tr>
				<th>대상자 ID</th>
				<td><%=dto.getReceiveid() %></td>
			</tr>
			<tr>
				<th>신고일</th>
				<td><%=dto.getReportregdate() %></td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="background-color: white;">
					<input id="rpbtn" type="button" value="차단" onclick="location.href='admin.do?command=change&receiveid=<%=dto.getReceiveid() %>'"/>		
				</td>
			</tr>
		</table>
	</section>
	<%@ include file="./form/footer.jsp" %>
	<%
		}
	%>
</body>
</html>