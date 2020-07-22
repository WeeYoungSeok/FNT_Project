<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)관리자페이지</title>
<link href="css/section.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	function getParameterValues(){
			var queryString = "?command=select&enabled=" + $("select[name=enabled]").val();
		return queryString;
	}
	

	$(function() {
		$("#selectmember").click(function() {
			$.ajax({
				url : "admin.do" + getParameterValues(),
				success : function(msg) {
					alert("연결 성공");	
					console.log(msg);
					
					$("table").attr("boarder", 1);
					$("thead").append(
					"<tr>" +
					"<th>" + msg.memberid + "</th>" +
					"<th>" + msg.membernickname + "</th>" +
					"<th>" + msg.membername + "</th>" +
					"<th>" + msg.memberbirth + "</th>" +
					"<th>" + msg.memberphone + "</th>" +
					"<th>" + msg.memberaddr + "</th>" +
					"<th>" + msg.memberemail + "</th>" +
					"<th>" + msg.memberrole + "</th>" +
					"<th>" + msg.enabled + "</th>" +
					"<th>" + msg.regdate + "</th>" +
					"</tr>"
					);
				},
				error : function(){
					alert("연결 실패");
				}
			});
		});
	});
</script>

</head>
<body>
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	<section>
		<h1>관리자페이지</h1>
		<select name="enabled">
			<option>신고 및 차단</option>
			<option value="Y">일반회원 조회</option>
			<option value="N">탈퇴회원 조회</option>
			<option value="R">신고회원 조회</option>
		</select> <input type="button" value="조회" id="selectmember" />

		<div id="print">
			<table>
				<thead></thead>
				<tbody></tbody>
			</table>
		</div>
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>