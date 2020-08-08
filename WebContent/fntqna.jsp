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
 * {margin: 0px; padding: 0px;}

 .menubar:nth-child(4) {font-weight:bold;}
 
 #qtable {float: center;}
 
 h1 {margin-top:2%; font-family:"Arial"; text-align:left; margin-left: 10%; color: white;}
 
 table {margin:0px auto; margin-top:1%; width:80%; height:auto; font-family:"Arial";} 
 tr:hover {background-color:rgba(255,255,255,0.5);}
 th {font-size:14pt; color:rgba(255,255,255,0.5); font-weight:bold; height:30px; font-weight:bold; padding-top:2px;}
 td {font-size:12pt; color: white;height:28px;}
 .hovernot:hover {background-color:rgba(255,255,255,0);}

 span {cursor: pointer; margin-left: 10px;}
 span:hover {font-weight: bold;}
 
 a {text-decoration: none; color: white;}
 
 #qlistlast {background-color:rgba(255,255,255,0.5); height:2px;}
 
 #qbbtn {width:50px; height:30px; color:white;font-weight:bold; border:none; border-radius:4px 4px 4px 4px; cursor:pointer; background-color:rgba( 255, 255, 255, 0.5 );}
 #qbbtn:hover {color:white;background-color:rgba(255,255,255,0);border:2px solid rgba(255,255,255,0.5);}
 
 #selectlist {margin-top:6px; height:26px; border:2px solid white; border-radius: 4px 4px 4px 4px; padding-left:10px;}
 #searchqna {margin-top:6px; height:26px; border:2px solid white; border-radius: 4px 4px 4px 4px; padding-left:10px;}
 
 #form1 {margin-top:5%;}
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
      		<tr align="center" class="hovernot">
      			<th>No.</th>
      			<th>답변여부</th>
      			<th>제목</th>
      			<th>작성자</th>
      			<th>작성일</th>
      		</tr>
      		<tr class="hovernot"><td colspan="5" id="qlistlast"></td></tr>
      		
			<%
				if (qnaboardlist == null) { 
			%>
				<tr align="center">
					<td colspan="5">현재 작성된 글이 없습니다.</td>
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
			<tr class="hovernot"><td colspan="5" id="qlistlast"></td></tr>
			<%
				if(memberdto == null) {
			%>
			<%
				} else {
			%>
			<tr class="hovernot">
				<td colspan="5" align="right">
					<button id="qbbtn" onclick="location.href='qna.do?command=qnainsert'">글 작성</button>
				</td>
			</tr>
			<%
				}
			%>
		</table></div>
		<%
			if(selectlist == null || searchqna == null) {
		%>
	<jsp:include page="./paging/fntqnapaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
		<%
			} else if (selectlist.equals("W") || selectlist.equals("T")) {
				%>
	<jsp:include page="./paging/fntqnasearchpaging.jsp">
	<jsp:param value="<%=searchqna %>" name="searchqna"/>
	<jsp:param value="<%=selectlist %>" name="selectlist"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
				<%
			}
		%>
	<form id="form1" action="qna.do" method="post">
		<input type="hidden" name="command" value="searchqna">
		
		<select id="selectlist" name="selectlist">
			<option value="T">제목</option>
			<option value="W">작성자</option>
		</select>
		<input type="text" name="searchqna" id="searchqna" value="" required="required">		
		<span><input id="qbbtn" type="submit" value="검색"></span>
	</form>
		
	</section>
	<%@ include file="./form/footer.jsp" %>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
</body>
</html>