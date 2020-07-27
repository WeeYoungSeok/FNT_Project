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
	if($("input[name=replytitle]").val()==""){
		alert("내용을 입력해주세요");
	}
	$.ajax({
		url : "reply.do",
		method : "POST",
		data : {"command":"insertreply", 
			"memberid":memberid, 
			"replynickname":$("input[name=replynickname]").val(),
			"replytitle":$("input[name=replytitle]").val(),
			"replyboardno" : $("input[name=replyboardno]").val()},
		dataType : "JSON",
		success : function(obj){
			if(obj != null){
				alert("댓글 등록 성공!");
				let today = new Date();   

				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				let day = today.getDay();  // 요일 
		
			$("#reply").eq(0).before(
				'<li>'
					+'<div><strong>'+obj.replynickname+'</strong></div>'
					+ '<div>'+obj.replytitle+'</div>'
					+ '<div>'+year+"-"+"0"+month+"-"+date
					+'<span><input type="button" value="답변" onclick="openrereply(this,\''+obj.replynickname+'\','+obj.replyno+','+obj.replyboardno+');"></span>'
					+'<input type="hidden" name="replyid" value="'+obj.replyid+'">'
					+'</div>'
				+'</li>'
			);
				document.getElementById("replytitle").value="";
			}else{
				alert("댓글 등록 실패");
			}
		}
	});
}

function openrereply(me,membernickname,replyno,replyboardno){
	if(membernickname==""){
		alert("답변 하시려면 로그인 해주세요");
		return false;
	}
	
	$(".rereplyform").hide();
	$(me).closest("li").append(
				'<li class="rereplyform" style="padding-left:45px">'
					+'<div><strong>'+membernickname+'</strong></div>'
					+'<div><input type="text" name="rereplytitle"/>'		
					+'<input type="button" value="등록" onclick="insertRereply(this,\''+membernickname+'\','+replyno+','+replyboardno+');">'
					+'</div>'
				+'</li>'
			);
	
}

function insertRereply(me,replynickname,replyno,replyboardno){
	var rereplyid = $("input[name=replyid]").val();
	var rereplytitle = $("input[name=rereplytitle]").val();
	if(rereplytitle == ""){
		alert("내용을 입력해주세요");
	}
	$.ajax({
		url : "reply.do",
		data : {"command":"insertRereply",
			"replyno":replyno,
			"replyid":rereplyid,
			"replytitle":rereplytitle,
			"replyboardno":replyboardno,
			"replynickname":replynickname},
		dataType:"JSON",
		success:function(obj){
			if(obj != null){
				alert("대댓글 작성 완료");
				let today = new Date();   

				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				let day = today.getDay();  // 요일 
				
				alert($(me).text());
				$(me).parent().parent().after(
					'<li>'
						+'<div><strong>'+obj.replynickname+'</strong></div>'
						+ '<div>'+obj.replytitle+'</div>'
						+ '<div>'+year+"-"+"0"+month+"-"+date
						+'<span><input type="button" value="답변" onclick="openrereply(this,'+obj.replynickname+','+obj.replyno+','+obj.replyboardno+');"></span>'
						+'<input type="hidden" name="replyid" value="'+obj.replyid+'">'
						+'</div>'
					+'</li>'						
				)
				
				$(".rereplyform").hide();
			}else{
				alert("대댓글 등록 안됐어 멍청아");
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
ul{
   list-style:none;
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
			<ul>
				<li id="reply">
				</li>
			</ul>
		</c:when>
		<c:otherwise>
			<c:forEach items="${replylist }" var="replydto">
				<ul>
				<c:choose>
					<c:when test="${replydto.replygroupnoseq eq 1}">
						<li id="reply">
					</c:when>	
					<c:otherwise>
						<li id="reply" style="padding-left:45px">
					</c:otherwise>
				</c:choose>
						<div><strong>${replydto.replynickname }</strong></div>
						<div>${replydto.replytitle }</div>
						<div>${replydto.replyregdate }<span><input type="button" value="답변" onclick="openrereply(this,'${memberdto.membernickname}',${replydto.replyno },${replydto.replyboardno });"></span></div>
					</li>			
				</ul>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</section>
<%@ include file="./form/footer.jsp" %>
</body>
</html>