<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 고객센터 글 작성</title>
<link href="css/fntnoticeinsert.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">

	 $(document).ready(function() {
	      $('#summernote').summernote({
	        placeholder: '홍보 포스팅을 자유롭게 입력해주세요.',
	        height: 500,
	        width: 1000,
	        lang: 'ko-KR',
	        toolbar: [
	                    // [groupName, [list of button]]
	                    ['Font Style', ['fontname']],
	                    ['style', ['bold', 'italic', 'underline']],
	                    ['font', ['strikethrough']],
	                    ['fontsize', ['fontsize']],
	                    ['color', ['color']],
	                    ['para', ['paragraph']],
	                    ['height', ['height']],
	                    ['Insert', ['picture']],
	                    ['Insert', ['link']],
	                    ['Misc', ['fullscreen']]
	                 ]
	      });
	    });
	
	

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
span {
	color: red;
}

table {
	margin-top: 100px;
	margin-left: 100px;
}

.form-control {
	height: 38px;
}



</style>


<script type="text/javascript">
	$(function(){
		$("#chk").click(function(){
			if($("#chk").prop("checked")){
				$("#chk").val("Y");
				console.log($("#chk").val());
			} else {
				$("#chk").val("N");
				console.log($("#chk").val());
			}
		});
		
		
	});
	
	function postForm() {
	
		return true
	}
</script>
</head>
<body>
	
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
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
		<form action="qna.do" method="post" onsubmit="postForm()">
			<input type="hidden" value="qnainsertres" name="command"/>
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<table>
				<tr>
				<td>제목</td>
				<td>
				<input type="text" name="qbtitle"/> <input type="checkbox" name="qbsecret" id="chk" value="N" />비밀글 
				</td>
			</tr>
			<tr>
				<td>
				내용
				</td>
				<td><textarea cols="50" rows="5" name="qbcontent" id="summernote"></textarea></td>
			</tr>
			<tr>
			<td align="right" colspan="2">
				<input type="button" value="취소"
					onclick="location.href='qna.do?command=qna'" />
					 <input type="submit" value="완료" />
					 </td>
			</tr>
			</table>
		</form>
	</section>
	<%@ include file="./form/footer.jsp"%>
	
	<%
	}
	%>
</body>


</html>