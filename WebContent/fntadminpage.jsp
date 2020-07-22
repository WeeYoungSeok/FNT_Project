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
	
/* 	function getParameterValues(){
			var queryString = "?command=select&enabled=" + $("select[name=enabled]").val();
		return queryString;
	}
	

	$(function() {
		$("#selectmember").click(function() {
			$.ajax({
				url : "admin.do" + getParameterValues(),
				data : "text",
				dataType : "json",
				success : function(msg) {
					alert("연결 성공");	
					console.log(msg);
						$("table").attr("border",1);
						var $tr = $("<tr>");
						$tr.append($("<th>").html("아이디"));
						$tr.append($("<th>").html("비밀번호"));
						$tr.append($("<th>").html("비번확인"));
						$tr.append($("<th>").html("닉네임"));
						$tr.append($("<th>").html("이름"));
						$tr.append($("<th>").html("생일"));
						$tr.append($("<th>").html("폰번호"));
						$tr.append($("<th>").html("주소"));
						$tr.append($("<th>").html("이메일"));
						$tr.append($("<th>").html("등급"));
						$tr.append($("<th>").html("여부"));
						$tr.append($("<th>").html("날짜"));
						
						$("thead").append($tr);
						
					$.each(msg, function(key, val){
						if(key == "list"){
							var $tr = $("<tr>");
							for(var i = 0; i < val.length; i++){
								for(var j in val[i]){
									$tr.append($("<td>").html(val[i][j]));
								}
							}
							$("tbody").append($tr);
							}
					});
						
				},
				error : function(){
					alert("연결 실패");
				}
			});
		});
	}); */
	$(function(){
		$("#selectmember").click(function(){
			location.href="admin.do?command=select&enabled=" + $("select[name=enabled]").val();
			console.log($("select[name=enabled]").val());
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
			<optgroup label="선택한 회원 조회">
				<option value="Y">일반회원 조회</option>
				<option value="N">탈퇴회원 조회</option>
				<option value="R">신고회원 조회</option>
			</optgroup>
			<optgroup label="신고된 회원 차단">
				<option value="report">신고 및 차단</option>
			</optgroup>
		</select>
		<input type="button" value="조회" id="selectmember" />

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