<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	NoticeBoardDto noticeboardlistone = (NoticeBoardDto)request.getAttribute("noticeboardlistone");
%>
<title>FNT(Feel New Item) : <%=noticeboardlistone.getNbtitle() %></title>
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

.menubar:nth-child(1) {
	opacity:0.7;
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
	<form action="notice.do" onsubmit="return noticeform();" method="post">
		<input type="hidden" value="noticeupdateres" name="command"/>
		<input type="hidden" value="<%=noticeboardlistone.getNbboardno() %>" name="nbboardno"/>
		<table border="1"> 
			<tr>
				<td>공지사항 > 
				<button onclick="location.href='notice.do?command=notice'">목록</button></td>
			<tr>
			<tr>
				<td><input type="text" value="<%=noticeboardlistone.getNbtitle() %>" name="nbtitle" required="required"/></td>
			</tr>
			<tr>
				<td><%=noticeboardlistone.getNbnickname() %></td>
			</tr>
			<tr>
				<td width="400" height="200"><textarea id="summernote" name="nbcontent" style="resize: none"><%=noticeboardlistone.getNbcontent() %></textarea></td>
			</tr>
	
		
		<%
			if (memberdto.getMemberrole().equals("ADMIN")) {
		%>
		<tr>
		<td align="right">
			<input type="submit" value="완료"/>
			<input type="button" value="취소" onclick="location.href='notice.do?command=noticedetail&nbboardno=<%=noticeboardlistone.getNbboardno()%>'"/>
		</td>
		</tr>
		<%
			} else if (memberdto.getMemberrole().equals("USER")) {
		%>
			
		<%
			}
		}
	
		%>
		</table>
		</form>
	</section>
	<%@ include file="./form/footer.jsp" %>
		<script type="text/javascript">
		var noticeform = function(){
			if($("textarea[name='nbcontent']").val() == "") {
				alert("내용을 입력하세요.");
				return false;
			}
		}
	</script>
</body>
</html>