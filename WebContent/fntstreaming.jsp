<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="css/section.css" rel="stylesheet" type="text/css" />
<body>
	<script
		src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
	<script
		src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
	<%@ include file="./form/headerstreaming.jsp"%>
	<%
		if(memberdto == null) {
	%>
		<script type="text/javascript">
			alert("로그인 후 이용이 가능합니다.")
			self.close();
		</script>
	<%
		}
	%>
	<section>
	<br/>
	<br/>
		<button id="btn-open">만들기</button>
		<button id="btn-join">입장</button>
		<div id="localvideo"></div>
		<div id="remotevideo"></div>
		<input type="text" id="roomid" placeholder="방 이름을 입력해주세요"  required="required"/>
		<script type="text/javascript" src="./real.js"></script>
	</section>
</body>
</html>

