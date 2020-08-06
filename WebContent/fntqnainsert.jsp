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
      placeholder: '문의글을 자유롭게 작성해주세요.',
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
* {margin:0px; padding:0px;}

aside {position:fixed; align:left; width:14%; height:100vh; box-shadow:1px 0px 6px black; z-index:2;}

#menubars {margin-top:50% !important; height:94.5%;}
.menubar {padding-top:12% !important; background-color:#3d3d3d; color:white; width:100% !important; height:10%; text-align:left; font:16pt "Arial" !important; font-weight:bold !important; cursor:pointer !important; opacity:0.5;}
.mtext {padding-left:10% !important;}
.menubar:hover {opacity:0.6;}
.menubar_x {background-color:#3d3d3d; width:100%; height:100%; opacity:0.5;}

.menubar:nth-child(4) {opacity:0.7;}
#qtable {float: center; margin-top: 3%;}
h1 {text-align: center;}
table {margin: 0 auto; margin-top: 3%; width: 80%; height: auto; font-family: "Arial";} 
th {background-color: #dddddd; font-size: 14pt; text-align: center; height: 30px; font-weight: bold; padding-top: 2px;}
td {height: 24px; font-size:12pt;}
#qbtitle {width: 100%; height: 100%; border: none; padding-left: 10px;}
.panel {margin: 0px;}
#qbbtn {width: 50px; height: 34px; border: none; border-radius: 4px 4px 4px 4px; cursor: pointer; background-color: #cccccc; margin-top: 2px;}
#qbbtn:hover {font-weight: bold; background-color: #bbbbbb;}
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
	
</script>
</head>
<body>
	
	<%@ include file="./form/header.jsp"%>
<aside>
		<div id="menubars">
			<div class="menubar"><p class="mtext" onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p class="mtext" onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar"><p class="mtext" onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p class="mtext" onclick="location.href='qna.do?command=qna'">고객센터</p></div>
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
		<div id="qtable">
		<h1>고객센터 글 작성</h1>
		<form action="qna.do" onsubmit="return qnaform();" method="post">
			<input type="hidden" value="qnainsertres" name="command"/>
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<table border="1" style="border: solid white;">
				<col width="100">
				<col width="750">
				<tr>
					<th>제목</th>
					<td style="display:flex; border:none;">
						<input type="text" id="qbtitle" name="qbtitle" placeholder="제목을 입력해주세요." style="width:90%;" required="required"/>
						<input type="checkbox" name="qbsecret" id="chk" value="N" style="margin-right:10px;"/>비밀글
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="50" rows="5" name="qbcontent" id="summernote"></textarea></td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<input id="qbbtn" type="button" value="취소" onclick="location.href='qna.do?command=qna'" />
						<input id="qbbtn" type="submit" value="완료" />
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