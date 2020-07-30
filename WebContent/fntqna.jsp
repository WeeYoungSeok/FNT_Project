	<%@page import="com.fnt.model.dto.QnaBoardDto"%>
<%@page import="com.fnt.util.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 고객센터</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">

#qtable {float: center;}
 
 h1 {margin-top: 6%; font-family: "Arial";}
 
 table {font-size: 14pt; margin: 0 auto; margin-top: 3%; width: 80%; height: auto; font-family: "Arial";} 
 
 tr:hover {background-color: #efefef;}
 
 th {background-color: #dddddd; height: 30px; font-weight: bold; padding-top: 2px;}
 
 td {height: 24px;}
 
 span {cursor: pointer; margin-left: 10px;}
 span:hover {font-weight: bold;}
 
 a {text-decoration: none; color: black;}
 
 #qlistlast {background-color: #dddddd; height: 2px;}
 
 #btnline:hover {background-color: white;}
 #qbbtn {width: 50px; height: 26px; border: none; border-radius: 4px 4px 4px 4px; cursor: pointer; background-color: #cccccc;}
 #qbbtn:hover {font-weight: bold; background-color: #bbbbbb;}
 
 #selectlist {margin-top: 6px; height: 26px; border: 2px solid #cccccc; padding-left: 10px;}
 #searchqna {margin-top: 8px; height: 24px; border: 2px solid #cccccc; padding-left: 10px;}
 
 #form1 {margin-top: 4%;}
 </style>
</head>
	<%
		List<QnaBoardDto> qnaboardlist = (List<QnaBoardDto>)request.getAttribute("qnaboardlist");
		Paging paging = (Paging)request.getAttribute("paging");
		String selectlist = (String)request.getAttribute("selectlist");
		String searchqna = (String)request.getAttribute("searchqna");
	%>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	
	<section>
		<div id="qtable">
		<h1>고객센터</h1>
		<table>
		
			<col width="100">
			<col width="100">
     		<col width="300">
     	 	<col width="150">
      		<col width="200">
      		
      		<tr align="center">
      			<th>No.</th>
      			<th>답변여부</th>
      			<th>제목</th>
      			<th>작성자</th>
      			<th>작성일</th>
      		</tr>
      		
			<%
				if (qnaboardlist == null) { 
			%>
				<tr align="center">
					<td colspan="4">작성된 글이 없습니다.</td>
				</tr>
			<%
				} else {
					for(int i = 0; i < qnaboardlist.size(); i++) {
			%>
				<tr align="center">
					<td><%=qnaboardlist.get(i).getQbboardno() %></td>
					<%
						if (memberdto == null) {
							if (qnaboardlist.get(i).getQbflag().equals("N")) {
					%>
							<td>처리중</td>
					<%
							} else {
					%>
							<td>답변완료</td>
					<% 
							}
						} else {
						
							if (qnaboardlist.get(i).getQbflag().equals("N")) {
					%>
							<td>처리중</td>
					<%
						} else {
							%>
							<td>답변완료</td>
							<% 
						
						}
					}
					%>
					
					<%
						if (memberdto == null) {
							if (qnaboardlist.get(i).getQbsecret().equals("Y")) {
					%>
							<td align="left"><span><a onclick="alert('비밀글입니다'); return false;" href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>">[비밀글] <%=qnaboardlist.get(i).getQbtitle() %></a></span></td>
					<%
							} else {
					%>
							<td align="left"><span><a href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>"><%=qnaboardlist.get(i).getQbtitle() %></a></span></td>
					<% 
							}
						} else {
						
							if (qnaboardlist.get(i).getQbsecret().equals("Y")) {
					%>
							<td align="left"><span><a id="secret" onclick="<%=((qnaboardlist.get(i).getQbid().equals(memberdto.getMemberid())) || (memberdto.getMemberrole().equals("ADMIN"))) ? "return true;" : "alert('비밀글입니다'); return false;"%>" href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>">[비밀글] <%=qnaboardlist.get(i).getQbtitle() %></a></span></td>
					<%
						} else {
							%>
							<td align="left"><span><a href="qna.do?command=qnadetail&qbboardno=<%=qnaboardlist.get(i).getQbboardno()%>"><%=qnaboardlist.get(i).getQbtitle() %></a></span></td>
							<% 
						
						}  
					}
					%>
					<td><%=qnaboardlist.get(i).getQbnickname() %></td>
					<td><%=qnaboardlist.get(i).getQbregdate().substring(0,10) %></td>
				<tr>
			<%
				}	
			}
			
			%>
			<tr><td colspan="5" id="qlistlast"></td></tr>
			<tr>
				<td id="btnline" colspan="5" align="right">
					<button id="qbbtn" onclick="location.href='qna.do?command=qnainsert'">글 작성</button>
				</td>
			</tr>
		</table></div>
	<jsp:include page="./paging/fntqnapaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	
	<form id="form1" action="qna.do" method="post">
		<input type="hidden" name="command" value="searchqna">
		
		<select id="selectlist" name="selectlist">
			<option value="T">제목</option>
			<option value="W">작성자</option>
		</select>
		<input type="text" name="searchqna" id="searchqna" value="<%=searchqna %>" required="required" placeholder="내용을 입력하세요.">		
		<span><input id="qbbtn" type="submit" value="검색"></span>
	</form>
		
	</section>
	<%@ include file="./form/footer.jsp" %>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("select[name='selectlist'] option[value="+"<%=selectlist%>"+"]").attr("selected", true);
	if($("#searchqna").val() == "null") {
		$("input[name='searchqna']").prop("value","");
	} else {
	$("input[name='searchqna']").prop("value","<%=searchqna%>");
}
})
</script>
	
</body>
</html>