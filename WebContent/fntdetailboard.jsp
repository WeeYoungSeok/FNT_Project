<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 글보기</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

section {
	padding-top: 90px;
	padding-left: 240px;
}
</style>
</head>
<body>
<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>
	<section>
		<table border="1">
			<tr>
				<th>제  목</th>
				<td>${dealboarddto.dtitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dealboarddto.did }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea>${dealboard.dcontent }</textarea></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
		</table>
	</section>
<%@ include file="./form/footer.jsp" %>
</body>
</html>