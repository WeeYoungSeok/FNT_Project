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

#menutitle {padding-left:31% !important;}

#menubars {margin-top:2% !important; }
.menubar {padding-top:0 !important; width:100% !important; padding-bottom:12%;}
.mtext {padding-left:10% !important;}

section {overflow: auto; z-index: 1;}
#qtable {width: 60%; margin-left: 20%;}
h1 {text-align: left; color: white; margin-bottom: 4%;}
table {margin: 0 auto; margin-top: 3%; width: 100%; height: auto; font-family: "Arial";} 
th {background-color: rgba(255,255,255,0.2); color: white; font-weight: bold; font-size: 12pt; text-align: center;}
td {background-color: rgba(255,255,255,0); color: white; height: 30px; padding: 0px;}
#qbtitle {width: 100%; height: 100%; border: none; background-color: rgba(255,255,255,0); padding-left: 10px;}
#qbtitle::placeholder {color: white;}
.panel {margin: 0px;}
#qbbtn {width: 50px; height: 34px; border: 2px solid rgba(255,255,255,0);
 	border-radius: 4px 4px 4px 4px; cursor: pointer; color: white;
 	background-color: rgba(255,255,255,0.2); margin-top: 2px;}
#qbbtn:hover {font-weight: bold; border: 2px solid rgba(255,255,255,0.5); background-color: rgba(255,255,255,0);}
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
		<div id="qtable">
		<h1>고객센터 글 작성</h1>
		<form action="qna.do" onsubmit="return qnaform();" method="post">
			<input type="hidden" value="qnainsertres" name="command"/>
			<input type="hidden" value="<%=memberdto.getMemberid() %>" name="id"/>
			<table>
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