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
	        height: 300,
	        //width: 1000,
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
* {margin:0px;padding:0px;}
.menubar:nth-child(1) {opacity:0.7;}
#ntable {float: center; margin-top: 3%;}
h1 {text-align: center;}
table {margin: 0 auto; margin-top: 3%; width: 80%; height: auto; font-family: "Arial";} 
th {background-color: #dddddd; font-size: 14pt; text-align: center; height: 30px; font-weight: bold; padding-top: 2px;}
td {height: 24px; font-size:12pt;}
#nbtitle {width: 100%; height: 100%; border: none; padding-left: 10px;}
.panel {margin: 0px;}
#nbbtn {width: 50px; height: 34px; border: none; border-radius: 4px 4px 4px 4px; cursor: pointer; background-color: #cccccc; margin-top: 2px;}
#nbbtn:hover {font-weight: bold; background-color: #bbbbbb;}
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
	<div id="ntable">
	<h1>공지사항 글 수정</h1>
	<form action="notice.do" onsubmit="return noticeform();" method="post">
		<input type="hidden" value="noticeupdateres" name="command"/>
		<input type="hidden" value="<%=noticeboardlistone.getNbboardno() %>" name="nbboardno"/>
		<table border="1" style="border: solid white;"> 
		<col width="100px">
		<col width="750px">
			<tr>
				<th>제목</th>
				<td><input type="text" value="<%=noticeboardlistone.getNbtitle() %>" name="nbtitle" id="nbtitle" required="required"/></td>
			<tr>
			<tr>
				<th>내용</th>
				<td><textarea id="summernote" name="nbcontent"><%=noticeboardlistone.getNbcontent() %></textarea></td>
	
		<%
			if (memberdto.getMemberrole().equals("ADMIN")) {
		%>
		<tr>
		<td align="right" colspan="2">
			<input id="nbbtn" type="submit" value="완료"/>
			<input id="nbbtn" type="button" value="취소" onclick="location.href='notice.do?command=noticedetail&nbboardno=<%=noticeboardlistone.getNbboardno()%>'"/>
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
		</div>
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