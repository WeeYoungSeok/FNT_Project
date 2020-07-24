<%@page import="com.fnt.model.dto.QnaBoardDto"%>
<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	QnaBoardDto qnaboardlistone = (QnaBoardDto)request.getAttribute("qnaboardlistone");
%>
<title>FNT(Feel New Item) : <%=qnaboardlistone.getQbtitle() %></title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
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
	.notice{
		margin-left: 300px;
		margin-top: 200px;
		border: 1px solid gray;
		width: 600px;
	}
	.nickname{
		margin-bottom: 30px;
	}
	.button{
		margin-left: 300px;
		
	}



</style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	
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
		<form action="qna.do" method="post">
		<input type="hidden" name="command" value="qnarecommnetres"/>
		<input type="hidden" name="qbboardno" value="<%=qnaboardlistone.getQbboardno()%>"/>
		<table border="1"> 
		<col width="70px"/>
		
			<tr>
			<td>게시판</td>
				<td>고객센터 > 
				<button onclick="location.href='qna.do?command=qna'">목록</button></td>
			<tr>
			<tr>
				<td>제목</td>
				<td><%=qnaboardlistone.getQbtitle() %></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><%=qnaboardlistone.getQbnickname() %></td>
			</tr>
			<tr>
			
				<td colspan="2"><textarea cols="54" rows="13" name="qbcontent" style="resize: none" id="summernote"><%=qnaboardlistone.getQbcontent() %></textarea></td>
			</tr>
	
	
		<tr>
		<td align="right" colspan="2">
			<input type="submit" value="완료">
			<button onclick="location.href='qna.do?command=qnadelete&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">삭제</button>
		</td>
		</tr>
		
		</table>
		</form>
		<%
		}
		%>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>