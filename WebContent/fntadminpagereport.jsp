<%@page import="com.fnt.model.dto.ReportDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)신고회원처리</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
	List<ReportDto> list = (List<ReportDto>)request.getAttribute("reportlist");
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
		<table border="1">
		<col width="50px"/>
		<col width="200px"/>
		<col width="150px"/>
		<col width="150px"/>
		<col width="250px"/>
		<col width="30px"/>
			<tr>
				<th>신고번호</th>
				<th>신고사유</th>
				<th>신고자 닉네임</th>
				<th>신고 받는자 닉네임</th>
				<th>신고날짜</th>
			</tr>
			<%
				if(list.size() == 0 || list == null){
			%>
				<tr align="center">
					<td colspan="5">-----신고된 회원이 없습니다-----</td>
				</tr>
				<tr align="right">
					<td colspan="5">
						<input type="button" value="뒤로가기" onclick="location.href='admin.do?command=adminpage'"/>
					</td>
				</tr>
			<%
				}else{
			for(int i = 0; i < list.size(); i++){	
			%>
				<tr>
					<td><%=list.get(i).getReportno() %></td>
					<td><a href="admin.do?command=reportdetail&reportno=<%=list.get(i).getReportno()%>"><%=list.get(i).getReporttitle() %></a></td>
					<td><%=list.get(i).getSendnickname() %></td>
					<td><%=list.get(i).getReceivenickname() %></td>
					<td><%=list.get(i).getReportregdate() %></td>
				</tr>
					<%
					}
					%>
				<tr align="right">
					<td colspan="5">
						<input type="button" value="뒤로가기" onclick="location.href='admin.do?command=adminpage'"/>
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</section>
	<%@ include file="./form/footer.jsp" %>
	<%
		}
	%>
</body>
</html>