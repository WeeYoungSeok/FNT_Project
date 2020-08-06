<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style type="text/css">
	
	h2{
		background-color: black;
		color : white;
		text-align : center;
		 width: 100vw;
		 padding-top: 16px;
		 padding-bottom : 10px;
		}
	table{
		border : 1px solid black;
		margin : auto;
		text-align : center;
		margin-top : 50px;
	}
	#title{
		border : none;
	}
	.content{
		height : 50px;
	}
	th{
		background-color: #cccccc;
	}
</style>

</head>
<body>
<%
	String membernickname = (String)request.getAttribute("membernickname");
%>
	<h2 style="font-family: 'Arial;'"><%=membernickname %>님 신고하기</h2>
	<form action="LoginCrudController" method="post">
	<input type="hidden" name="command" value="reportform2">
	<input type="hidden" name="membernickname" value="<%=membernickname%>">
	<table border="1" style="border : solid white;">
		<tr>
			<td colspan="4"></td>
		</tr>
		<tr class="content">
			<td></td>
			<th>신고 제목</th>
			<td><input id="title" style="width : 500px" type="text" required="required" 
				placeholder="ex)허위매물 게시, 판매상품과 다른 상품 배송, 입금후 연락두절 등 "
				name="reporttitle" id="reporttitle"></td>
			<td></td>
		</tr>
		<tr class="content">
			<td></td>
			<th>신고 내용</th>
			<td>
			<textarea style="margin: 0px; width: 501px; height: 148px;" name="reportcontent" id="summernote"></textarea>
			</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" align="right">
				<input class="btn" type="submit" value="신고접수" id="suma">
				<input class="btn" type="button" value="뒤로가기" onclick="goBack();">
			</td>
			<td></td>
		</tr>
	</table>
	</form>
<script type="text/javascript">

	function goBack(){
		location.href = "fntpopnick.jsp?popnick="+"<%=membernickname%>";
	}
	$(document).ready(function(){
	    $('#summernote').summernote({
	      placeholder: '내용을 자세히 적어주세요.',
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
</body>
</html>