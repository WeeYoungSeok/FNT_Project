<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)내가 쓴 글 조회</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
	List<DealBoardDto> list = (List<DealBoardDto>)request.getAttribute("mywriterlist");
%>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	<section>
		<h1>내가 쓴 글 조회</h1>
		
		<table border="1">
		<col width="100px"/>
		<col width="100px"/>
		<col width="50px"/>
		<col width="100px"/>
			<tr>
				<th>제목</th>
				<th>닉네임</th>
				<th>가격</th>
				<th>작성날짜</th>
			</tr>
			
			<%
				if(list.size() == 0 || list == null) {
			%>
				<tr align = "center">
					<td colspan="4">-----조회된 글이 없습니다-----</td>
				</tr>
				<tr align = "right">
					<td colspan="4">
						<input type="button" value="뒤로가기" onclick="location.href='admin.do?command=adminpage'"/>
					</td>
				</tr>
			<%
				} else {
				for(int i = 0; i < list.size(); i++){
			%>
				<tr>
					<td><%=list.get(i).getDtitle() %></td>
					<td><%=list.get(i).getDnickname() %></td>
					<td><%=list.get(i).getDprice() %></td>
					<td><%=list.get(i).getDregdate() %></td>
				</tr>
				<%
				}
				%>
				<tr align="right">
					<td colspan="4">
						<input type="button" value="뒤로가기" onclick="location.href='mypage.do?command=mypage'"/>
					</td>
				</tr>
				<%
				}
				%>
		</table>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>