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
<title>FNT(Feel New Item) : 공지사항 글 작성</title>
<link href="css/fntnoticeinsert.css" rel="stylesheet" type="text/css" />
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
</head>
<body>
	
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	
	<section>
	

		<form action="notice.do" method="post">
			<input type="hidden" value="noticeinsertres" name="command"/>
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<table>
			<col width="100">
			<col width="1000">
				<tr>
				<td>
				제목
				</td>
				<td>
				<input type="text" name="nbtitle"/>
				</td>
			</tr>
			<tr>
				<td>
				내용
				</td>
				<td><textarea name="nbcontent" id="summernote" ></textarea></td>
			</tr>
			<tr>
			<td align="right" colspan="2">
				<input type="button" value="취소"
					onclick="location.href='notice.do?command=notice'" />
					 <input type="submit" value="완료" />
					 </td>
			</tr>
			</table>
		</form>
	</section>
	<%@ include file="./form/footer.jsp"%>
	
	
</body>
</html>