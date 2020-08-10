<%@page import="java.text.SimpleDateFormat"%>
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
* {margin: 0px; padding: 0px;}

#menutitle {padding-left: 31% !important;}

h1 {font-family: "Arial"; text-align: center; margin-top: 4%; color: white;}

table {width: 60%; margin: 0px auto; margin-top: 2%; font-family: "Arial";}

tr {height: 30px;}

th {font-size: 12pt; font-weight: bold; text-align: center; width: 120px; color: white; background-color: rgba(255,255,255,0.1);}

td {font-size: 11pt; padding-left: 10px; color: white; background-color: rgba(255,255,255,0);}

#listline {background-color: rgba(255,255,255,0.5); height: 2px !important;}

#content {border: none; padding-top: 10px; font-size: 11pt; width: 900px; height: 150px; overflow: scroll; color: white; background-color: rgba(255,255,255,0);}

#rpbtn {width: 50px; height: 30px; border: 2px solid rgba(255,255,255,0); border-radius: 4px 4px 4px 4px; cursor: pointer; color: white; background-color: rgba(255,255,255,0.2); margin-top: 2px;}

#rpbtn:hover {font-weight: bold; background-color: red; color: white;}
</style>
</head>
<body>
<%
	ReportDto dto = (ReportDto)request.getAttribute("reportdto");
	SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
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
			<tr id="listline"><td colspan="6"></td></tr>
			<tr>
				<th>No.</th>
				<td><%=dto.getReportno() %></td>
				<th>신고자 닉네임</th>
				<td><%=dto.getSendnickname() %></td>
				<th>신고자 ID</th>
				<td><%=dto.getSendid() %></td>
			</tr>
			<tr id="listline"><td colspan="6"></td></tr>
			<tr>
				<th>신고 사유</th>
				<td colspan="5"><%=dto.getReporttitle() %></td>
			</tr>
			<tr id="listline"><td colspan="6"></td></tr>
			<tr>
				<th>상세 내용</th>
				<td colspan="5" id=content><%=dto.getReportcontent() %></td>
			</tr>
			<tr id="listline"><td colspan="6"></td></tr>
			<tr>
				<th>대상자 닉네임</th>
				<td><%=dto.getReceivenickname() %></td>
				<th>대상자 ID</th>
				<td><%=dto.getReceiveid() %></td>
				<th>신고일</th>
				<td><%=sDate.format(dto.getReportregdate()) %></td>
			</tr>
			<tr id="listline"><td colspan="6"></td></tr>
			<tr>
				<td colspan="6" align="right">
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