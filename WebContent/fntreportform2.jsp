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
<link href="css/section2.css" rel="stylesheet" type="text/css"/>

<style type="text/css">
* {margin: 0px; padding: 0px;}
section {margin: 0px; padding: 0px;}
h2 {background-color: rgba(255,255,255,0.2); color: white; font-weight: bold; font-family: "Arial"; text-align: center; width: 100vw; padding-top: 16px; padding-bottom: 10px; margin: 0px;}
table {margin: auto; text-align : center; margin-top : 50px;}
#title {border: none; width: 100%; height: 50px; padding-left: 20px; background-color: rgba(255,255,255,0);}
#title::placeholder {color: white;}
.content {height: 50px;}
.panel {padding: 0px; margin:0px;}
th {background-color: rgba(255,255,255,0.2); color: white; font-size: 12pt; font-weight: bold; width: 70px; text-align: center;}
td {color: white;}
.btn {margin-top: 4px; background-color: rgba(255,255,255,0.2); border: 2px solid rgba(255,255,255,0);}
.btn:hover {background-color: rgba(255,255,255,0); border: 2px solid rgba(255,255,255,0.5); color: white; font-weight: bold;}
</style>

</head>
<body>
<section>
<%
	String membernickname = (String)request.getAttribute("membernickname");
%>
	<h2><%=membernickname %>님 신고하기</h2>
	<form action="LoginCrudController" method="post">
	<input type="hidden" name="command" value="reportform2">
	<input type="hidden" name="membernickname" value="<%=membernickname%>">
	<table>
		<tr>
			<td colspan="4"></td>
		</tr>
		<tr class="content">
			<td></td>
			<th>신고 제목</th>
			<td>
				<input id="title" type="text" required="required" placeholder="ex) 허위 매물 게시, 판매 상품과 다른 상품 배송, 입금 후 연락두절 등" name="reporttitle" id="reporttitle">
			</td>
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
</section>
</body>
</html>