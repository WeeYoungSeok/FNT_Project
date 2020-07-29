<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#reportcontent{
		resize: none;
	}
</style>
</head>
<body>
<%
	String membernickname = (String)request.getAttribute("membernickname");
	System.out.println("신고폼 : " + membernickname);
%>
	<h2><%=membernickname %>님 신고하기</h2>
	<form action="LoginCrudController" method="post">
	<input type="hidden" name="command" value="reportform">
	<input type="hidden" name="membernickname" value="<%=membernickname%>">
	<table border="1">
		<tr>
			<th>신고 제목</th>
			<td><input style="width : 500px" type="text" required="required" 
				placeholder="ex)허위매물 게시, 판매상품과 다른 상품 배송, 입금후 연락두절 등 "
				name="reporttitle" id="reporttitle"></td>
		</tr>
		<tr>
			<th>신고 내용</th>
			<td>
			<textarea style="margin: 0px; width: 501px; height: 148px;" name="reportcontent" id="reportcontent"
						placeholder="내용을 자세히 적어주세요."></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="뒤로가기" onclick="">
				<input type="submit" value="신고접수">
			</td>
		</tr>
	</table>
	</form>
	


</body>
</html>