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

function popnick(membernickname) {
	open("fntpopnick.jsp?popnick=" + membernickname,
		 "",
		 "width=200, height=250");
}

function delChk(dboardno) {
	if (confirm("삭제하시겠습니까?")) {
		location.href='dealboard.do?command=deletebuyboard&dboardno=' + dboardno;
	}
}

function insertreply(me,memberid) {
	if($("input[name=replytitle]").val() == "") {
		alert("내용을 입력해주세요");
		return false;
		
	} else {
		return true;		
	}	
}

/* 	$.ajax({
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
 */
function openrereply(me,membernickname,replyno,replyboardno) {
	if (membernickname == "") {
		alert("답변 하시려면 로그인 해주세요");
		return false;
	}
	
	$(".rereplyform").hide();
	$(me).closest("li").after(
				'<li class="rereplyform" style="padding-left:45px;list-style:none;">'
					+'<div><strong>'+membernickname+'</strong></div>'
					+'<form action="reply.do" method="method">'
					+'<input type="hidden" name="command" value="insertRereply">'
					+'<div><input type="text" name="rereplytitle"/>'
					+'<input type="hidden" name="replyno" value="'+replyno+'">'
					+'<input type="hidden" name="replyboardno" value="'+replyboardno+'">'
					+'<input type="hidden" name="replynickname" value="'+membernickname+'">'
					+'<input type="submit" value="등록">'
					+'</div>'
					+'</form>'
					+'</li>'
			);
}

// 댓글 ajax하는거 취소

function insertRereply() {
	
 	var replynickname = $(me).parent().parent().find("div").eq(0).children().text();
	var rereplytitle = $(me).parent().find("input").val();

	if (rereplytitle == "") {
		alert("내용을 입력해주세요");
		return false;
		
	} else {
		return true;		
	}
}
/*
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
*/

function deletereply(replyno,replyboardno) {
	if (confirm("삭제하시겠습니까?")) {
		location.href='reply.do?command=deletereply2&replyno='
					 + replyno
					 + '&dboardno='
					 + replyboardno;
	}
}
</script>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
aside {position:fixed; align:left; width:14%; height:100%; box-shadow:1px 0px 6px black; z-index:2;}

#menubars {margin-top:50%; height:62%;}
.menubar {padding-top:12%; background-color:black; color:white; width:100%; height:10%; text-align:left; font:16pt "Arial"; font-weight:bold; cursor:pointer; opacity:0.4;}
.menubar > p {padding-left:10%;}
.menubar:hover {opacity:0.6;}
.menubar_x {background-color:black; width:100%; height:100%; opacity:0.4;}

#dboard {margin-top:6%; margin-bottom:6%;}

h1 {margin-top:6%; font-family:"Arial"; text-align:center; margin-bottom:2%;}
	
table {margin:0px auto; width:80%; height:auto; font-family:"Arial";}

#tolist {cursor:pointer;}
#tolist:hover {font-weight:bold;}

th {font-size:14pt; width:100px; height:30px; background-color:#dddddd; font-weight:bold; padding-top:2px;}
td {font-size:12pt; padding-left:10px; background-color:#f9f9f9;}

#dlistlast {background-color:#dddddd; height:2px;}

#btnline {background-color:white;}
#btnbox {margin-top:4px; float:right; display:flex;}
#dbbtn {width:50px; height:26px; border:none; margin-left:10px; border-radius:4px 4px 4px 4px; cursor:pointer; background-color:#cccccc;}
#dbbtn:hover {font-weight:bold; background-color:#bbbbbb;}

#reply {list-style:none;}

</style>
</head>
<body>

<%@ include file="./form/header.jsp"%>
	<aside>
		<div id="menubars">
			<div class="menubar"><p onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar" style="opacity:0.7;"><p onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>
	
	<section>
	
<%
	if(memberdto == null) {
	
	}
%>
		<div id="dboard">
		<h1>구매 게시판</h1>
		<table>
			<tr>
				<th>제  목</th>
				<td colspan="3">${dealboarddto.dtitle}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><a onclick="popnick('${dealboarddto.dnickname}');">${dealboarddto.dnickname }</a></td>
				<th>가격</th>
				<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" width="400" height="200">${dealboarddto.dcontent }</td>
			</tr>
			<tr><td colspan="4" id="dlistlast"></td></tr>
	<%
		if (memberdto == null) {
	%>
	<% 
		} else {
	%>
	<%
			DealBoardDto dealboarddto = (DealBoardDto) request.getAttribute("dealboarddto");
			String dealboardid = dealboarddto.getDid();
			if (dealboarddto.getDid().equals(memberdto.getMemberid()) || memberdto.getMemberid().equals("admin")) {
	%>
			<tr>
				<td align="right" colspan="4" id="btnline">
					<div id="btnbox">
						<input id="dbbtn" type="button" value="수정하기" onclick="location.href='dealboard.do?command=updatebuyboard&dboardno=${dealboarddto.dboardno}'">
						<input id="dbbtn" type="button" value="삭제하기" onclick="delChk(${dealboarddto.dboardno});">
					</div>
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
		if (memberdto == null) {
	%>
	<%
		} else {
	%>
	<form action="reply.do" method="post" onsubmit="insertreply();">
	<input type="hidden" name="command" value="insertreply">
		<table>
			<tr>
				<th><input type="text" name="replynickname" value="${memberdto.membernickname }" readonly="readonly" style="width:90%; height:90%; border:none; margin:0px auto; background-color:#dddddd;"></th>
				<td>
					<div id="btnbox">
						<input type="text" id="replytitle" name="replytitle" placeholder="댓글을 입력하세요." style="width:100%; height:28px; border:none; margin:0px auto; background-color:#f9f9f9;">
						<input id="dbbtn" type="submit" id="insertreply" value="등록">
						<input type="hidden" name="replyboardno" value="${dealboarddto.dboardno }">
					</div>
				</td>
		</table>
	</form>	
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
					<c:when test="${replydto.replygroupnoseq eq 0 }">
						<li id="reply" style="list-style:none;">삭제된 댓글입니다.</li>
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
	</div>
	</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function popnick(membernickname) {
	
	var memberdto = "<%=memberdto%>";
	
	if (memberdto == "null") {	//문자열로 null 선언해줘야함
		alert("로그인이 필요합니다");
		location.href="fntlogincrud.jsp";
		
	} else {
	open("fntpopnick2.jsp?popnick=" + membernickname,
		 "",
		 "width=200, height=250");	
	}
}

</script>
<%@ include file="./form/footer.jsp" %>
</body>
</html>