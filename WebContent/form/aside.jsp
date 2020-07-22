<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/aside.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<aside>
	
		<p class="menubar" onclick="location.href='notice.do?command=notice'">공지사항</p>
		<p class="menubar" onclick="">구매게시판</p>
		<p class="menubar" onclick="">판매게시판</p>
		<p class="menubar" onclick="">고객센터</p>
		
	</aside>

</body>
</html>