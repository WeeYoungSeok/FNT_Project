<%@page import="com.fnt.model.dto.ReplyDto"%>
<%@page import="java.util.List"%>
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

function popnick(membernickname){
	open("fntpopnick.jsp?popnick="+membernickname,"","width=200, height=250");
}

function delChk(dboardno){
	if(confirm("삭제하시겠습니까?")){
		location.href='dealboard.do?command=deletebuyboard&dboardno='+dboardno;
	}
}

function insertreply(me,memberid){
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
				$("#noreply").hide();
				let today = new Date();   

				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				let day = today.getDay();  // 요일 
		
				$("#replylist").last().append(
				'<ul>'+
				'<li id="relpy"  style="list-style:none;">'
					+'<div><strong>'+obj.replynickname+'</strong></div>'
					+ '<div>'+obj.replytitle+'</div>'
					+ '<div>'+year+"-"+"0"+month+"-"+date
					+'<span><input type="button" value="답변" onclick="openrereply(this,\''+obj.replynickname+'\','+obj.replyno+','+obj.replyboardno+');"></span>'
					+'<input type="button" value="삭제" onclick="deletereply('+obj.replyno+','+obj.replyboardno+');">'
					+'<input type="hidden" name="replyid" value="'+obj.replyid+'">'
					+'</div>'
				+'</li>'+
				'</ul>'
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
	$(me).closest("li").after(
				'<li class="rereplyform" style="padding-left:45px;list-style:none;">'
					+'<div><strong>'+membernickname+'</strong></div>'
					+'<div><input type="text" name="rereplytitle"/>'		
					+'<input type="button" value="등록" onclick="insertRereply(this,\''+membernickname+'\','+replyno+','+replyboardno+');">'
					+'</div>'
				+'</li>'
			);
	
}

function insertRereply(me,replynickname,replyno,replyboardno){	
	var replynickname = $(me).parent().parent().find("div").eq(0).children().text();
	var rereplytitle = $(me).parent().find("input").val();

	if(rereplytitle == ""){
		alert("내용을 입력해주세요");
	}
	$.ajax({
		url : "reply.do",
		data : {"command":"insertRereply",
			"replyno":replyno,
			"replytitle":rereplytitle,
			"replyboardno":replyboardno,
			"replynickname":replynickname
			},
		dataType:"JSON",
		success:function(obj){
			if(obj != null){
				alert("대댓글 작성 완료");
				let today = new Date();   

				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				let day = today.getDay();  // 요일 

				var go = $(me).parent().parent().parent();
				$(".rereplyform").hide();
				go.append(
					'<ul class="rereply">' +
					'<li style="padding-left:45px;list-style:none;">'
						+'<div><strong>'+obj.replynickname+'</strong></div>'
						+ '<div>'+obj.replytitle+'</div>'
						+ '<div>'+year+"-"+"0"+month+"-"+date
//						+'<span><input type="button" value="답변" onclick="openrereply(this,\''+obj.replynickname+'\','+obj.replyno+','+obj.replyboardno+');"></span>'
						+'<input type="hidden" name="replyid" value="'+obj.replyid+'">'
						+'</div>'
					+'</li>' +
					'</ul>'
				);
				
			
			}else{
				alert("대댓글 등록 안됐어 멍청아");
			}
		}
	});
	
}

function deletereply(replyno,replyboardno){
	if(confirm("삭제하시겠습니까?")){
		location.href='reply.do?command=deletereply&replyno='+replyno+'&dboardno='+replyboardno;
	}
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
#reply{
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
				<td><a onclick="popnick('${dealboarddto.dnickname}');">${dealboarddto.dnickname }</a></td>
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
					<input type="button" id="insertreply" value="등록" onclick="insertreply(this,'${memberdto.memberid}');">
					<input type="hidden" name="replyboardno" value="${dealboarddto.dboardno }">
				</td>
		</table>
	<%
		}
	%>
	<c:choose>
		<c:when test="${empty replylist }">
			<div id="noreply">작성된 댓글이 없습니다.</div>
			<ul id="replylist">
				<li id="reply" style="list-style:none;"></li>
				<div id="up"></div>
			</ul>
		</c:when>
		<c:otherwise>
				<ul id="replylist">
			<c:forEach items="${replylist }" var="replydto">
				<c:choose>
					<c:when test="${replydto.replygroupnoseq eq 1}">
						<li id="reply" style="list-style:none;">
					</c:when>	
					<c:otherwise>
						<li class="rereply" style="padding-left:45px;list-style:none;">
					</c:otherwise>
				</c:choose>
						<div><strong>${replydto.replynickname }</strong></div>
						<div>${replydto.replytitle }</div>
						<div>${replydto.replyregdate }
							<span>
								<c:choose>
									<c:when test="${replydto.replytitletab eq 0 }">
										<input type="button" value="답변" onclick="openrereply(this,'${memberdto.membernickname}',${replydto.replyno },${replydto.replyboardno });">
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${replydto.replynickname == memberdto.membernickname}">							
										<input type="button" value="삭제" onclick="deletereply(${replydto.replyno },${replydto.replyboardno });">
									</c:when>
								</c:choose>
							</span>
						</div>
					</li>			
			</c:forEach>
				<div id="up"></div>
				</ul>
		</c:otherwise>
	</c:choose>
	</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function popnick(membernickname){
	var memberdto = "<%=memberdto%>";
	if(memberdto == "null"){	//문자열로 null 선언해줘야함
		alert("로그인이 필요합니다");
		location.href="fntlogincrud.jsp";
	}else{
	open("fntpopnick2.jsp?popnick="+membernickname,"","width=200, height=250");	
	}
}
</script>
<%@ include file="./form/footer.jsp" %>
</body>
</html>