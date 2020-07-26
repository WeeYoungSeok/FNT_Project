<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 구매 글보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">


function delChk(dboardno){
	if(confirm("삭제하시겠습니까?")){
		location.href='dealboard.do?command=deletebuyboard&dboardno='+dboardno;
	}
}

function insertreply(memberid){
	$.ajax({
		url : "reply.do",
		method : "POST",
		data : {"command":"insertreply", 
			"memberid":memberid, 
			"replynickname":$("input[name=replynickname]").val(),
			"replytitle":$("input[name=replytitle]").val(),
			"replyboardno" : $("input[name=replyboardno]").val()},
		success : function(msg){
			if(msg == "COMPLETE"){
				alert("댓글 등록 성공!");
				let today = new Date();   

				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				let day = today.getDay();  // 요일
				$("#reply").eq(0).before(
					'<tr>'
						+'<th>'+$("input[name=replynickname]").val()+'</th>'
						+ '<td>'+$("input[name=replytitle]").val()+'</td>'
						+ '<td>'+year+"-"+"0"+month+"-"+date+'</td>'
						+'<td><input type="button" value="답변" onclick="insertrereply();"></td>'
					+'</tr>'
				);
				
				document.getElementById("replytitle").value="";
			}else{
				alert("댓글 등록 실패");
			}
		}
	});
}
</script>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

section {
	padding-top: 90px;
	padding-left: 240px;
}
</style>
</head>
<body>

<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>
	<section>
<%
	if(memberdto == null) {
	
	}
%>
		<table border="1">
			<tr>
				<th>제  목</th>
				<td>${dealboarddto.dtitle }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dealboarddto.did }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td width="400" height="200">${dealboarddto.dcontent }</td>
			</tr>

	<%
		if(memberdto==null) {
	%>
		
	<% 
		}else {
	%>
	<%
				DealBoardDto dealboarddto = (DealBoardDto) request.getAttribute("dealboarddto");
				String dealboardid = dealboarddto.getDid();
				if(dealboarddto.getDid().equals(memberdto.getMemberid())|| memberdto.getMemberid().equals("admin")){
	%>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="수정하기" onclick="location.href='dealboard.do?command=updatebuyboard&dboardno=${dealboarddto.dboardno}'">
					<input type="button" value="삭제하기" onclick="delChk(${dealboarddto.dboardno});">
				</td>
			</tr>
	<%	
				} else {
	%>
					
	<%
				}
		}
	%> 
		</table>
	<%
		if(memberdto==null) {
			
	%>
	
	<%
		}else{
	%>
		<table>
			<tr>
				<th><input type="text" name="replynickname" value="${memberdto.membernickname }" readonly="readonly" style="width:80px"></th>
				<td>
					<input type="text" id="replytitle" name="replytitle" style="width:450px">
					<input type="button" id="insertreply" value="등록" onclick="insertreply('${memberdto.memberid}');">
					<input type="hidden" name="replyboardno" value="${dealboarddto.dboardno }">
				</td>
		</table>
	<%
		}
	%>
	<c:choose>
		<c:when test="${empty replylist }">
			<div>작성된 댓글이 없습니다.</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${replylist }" var="replydto">
				<table>
					<tr id="reply">
						<th>${replydto.replynickname }</th>
						<td>${replydto.replytitle }</td>
						<td>${replydto.replyregdate }</td>
						<td><input type="button" value="답변" onclick="insertrereply(this);"></td>
					</tr>					
				</table>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</section>
<%@ include file="./form/footer.jsp" %>
</body>
</html>