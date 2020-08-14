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
	        placeholder: '공지사항 내용을 자유롭게 입력해주세요.',
	        height: 300,
	        //width: 750,
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
<link href="css/section.css" rel="stylesheet" type="text/css" />
<style type="text/css">
* {margin:0px;padding:0px;}
#menutitle {padding-left:31% !important;}

#ntable {margin-left: 4%; float: center; margin: 0px auto; width: 70%; margin-top: 3%;}
h2 {font-family:"Arial"; text-align:left; color: white; margin-bottom: 1%;}
table {width: 100%; height: auto; font-family: "Arial";}
th {font-size: 13pt; width: 100px; text-align: center; height: 30px; background-color: rgba(255,255,255,0.1); color: rgba(255,255,255,1); font-weight: bold;}
td {font-size: 12pt; color: white;}
#nbtitle {width: 100%; height: 30px; color: white; border: none; padding-left: 10px; background-color: rgba(255,255,255,0);}
#nbtitle::placeholder {color: white;}
.panel {margin: 0px;}
#nbbtn {width: 50px; height: 26px; border: 2px solid rgba(255,255,255,0); margin-top: 6px; margin-left: 10px; border-radius: 2px 2px 2px 2px; cursor: pointer; color: white; background-color: rgba(255,255,255,0.3);}
#nbbtn:hover {font-weight: bold; border: 2px solid rgba(255,255,255,0.5); background-color: rgba(255,255,255,0);}
</style>

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
		</script>
	<%
		} else {
	%>
		<div id="ntable">
		<h2>공지사항 글 작성</h2>
		<form action="notice.do" onsubmit="return noticeform();" method="post">
			<input type="hidden" value="noticeinsertres" name="command"/>
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<table>
			<col width="100px">
			<col width="750px">
			<tr>
				<th>제목</th>
				<td><input type="text" id="nbtitle" name="nbtitle" placeholder="제목을 입력해주세요." required="required"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="nbcontent" id="summernote"></textarea></td>
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
	<%
		}
	%>
	
	<script type="text/javascript">
		var noticeform = function(){
			if($("textarea[name=nbcontent]").val() == "") {
				alert("내용을 입력하세요.");
				return false;
			}
		}
	</script>
</body>
</html>