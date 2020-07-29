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
<link href="css/section.css" rel="stylesheet" type="text/css" />
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
<style type="text/css">th{text-align:center;}.panel{margin-bottom: 0px;}</style>
</head>
<body>
	
	<%@ include file="./form/header.jsp"%>
	
	<aside>
		<div id="menubars">
			<div class="menubar"><p onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>
	
	<section>
		<div id="ntable">
		<form action="notice.do" method="post">
			<input type="hidden" value="noticeinsertres" name="command"/>
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<table border="1">
			<col width="100">
			<col width="1000">
			<tr>
				<th>제목</th>
				<td><input type="text" id="nbtitle" name="nbtitle" placeholder="제목을 입력해주세요."/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="nbcontent" id="summernote" ></textarea></td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input id="nbbtn" type="button" value="취소" onclick="location.href='notice.do?command=notice'" />
					<input id="nbbtn" type="submit" value="완료" />
				</td>
			</tr>
			</table>
		</form>
		</div>
	</section>
	
	<%@ include file="./form/footer.jsp"%>
	
</body>
</html>