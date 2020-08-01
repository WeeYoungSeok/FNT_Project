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
<link href="css/section.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">

$(document).ready(function(){
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
	
</script>
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
		<form action="qna.do" onsubmit="return qnaform();" method="post">
			<input type="hidden" value="qnainsertres" name="command"/>
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<table border="1">
				<col width="100">
				<col width="1000">
				<tr>
					<th>제목</th>
					<td style="display:flex;">
						<input type="text" id="nbtitle" name="qbtitle" placeholder="제목을 입력해주세요." style="width:90%;" required="required"/>
						<input type="checkbox" name="qbsecret" id="chk" value="N" style="margin-right:10px;"/>비밀글
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="50" rows="5" name="qbcontent" id="summernote"></textarea></td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<input id="nbbtn" type="button" value="취소"
							onclick="location.href='qna.do?command=qna'" />
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
		var qnaform = function(){
			if($("textarea[name='qbcontent']").val() == "") {
				alert("내용을 입력하세요.");
				return false;
			}
		}
	</script>
</body>


</html>