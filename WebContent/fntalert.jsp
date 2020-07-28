<%@page import="com.fnt.model.dto.AlertDto"%>
<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람내역</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	.alertone:nth-child(even){
		background-color : gray;
	}
</style>
	<%
		//세션에 값이 담긴 memberdto을 받아온다.
		MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
		//List<AlertDto> alertlist = (List<AlertDto>)request.getAttribute("alertlist"); 
	%>
	<script type="text/javascript">
	
	var memberid = "<%=memberdto.getMemberid()%>";
	
	function closePop(param){
		opener.location.href='dealboard.do?command=detailboard&dboardno='+param;
		self.close();
	}
	
	function getParameterValues(){
		var queryString = "?command=alert&memberid=" + memberid;
		return queryString;
	}
	
		onload=function(){
			//이 창이 load되자마자 mypagecontroller에 meㄷmberid값을 전달해줘야한다.
			//setInterval(function(){
			//$("#alertlist").empty();
			console.log("!");
			$.ajax({
				url : "mypage.do" + getParameterValues(),
				dataType : "json",
			
				success : function(data){
					
					$.each(data, function(key, val){
					
						if(val == "") {
							$("#alertlist").append(
								"<p class='alertone'>현재 <b>" + '<%=memberdto.getMembernickname()%>' + "</b>님이 올린 글에 달린 댓글이 없습니다.</p>"		
							);
						}
						else{
							var list = val;
							for(var i = 0; i < list.length; i++){
								var str = list[i];
								var param = str.dboardno;
								console.log(param);
								$("#alertlist").append(
									"<p class=alertone>"+ str.alertboardno +"번글. <b>"+ str.dnickname +"</b>님이 올린 <b>"+ str.dtitle +"</b> 에 댓글이 달렸습니다.</p>"
								);
								//$(".alertone").eq(i).attr('onclick', "opener.location.href='dealboard.do?command=detailboard&dboardno="+param+"'");
								$(".alertone").eq(i).attr('onclick', 'closePop('+param+');');
							}
							
						} 
					
					});
				},
				error : function(){
					alert("연결 실패");
				}
			});
		//}, 30000);
	}
		
	</script>
</head>
<body>
	<h3><%=memberdto.getMembernickname() %>님의 알림내역</h3>
	
	<div id="alertlist"></div>
	
</body>
</html>
