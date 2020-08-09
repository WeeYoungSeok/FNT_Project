<%@page import="com.fnt.model.dao.DealBoardDao"%>
<%@page import="com.fnt.model.dao.impl.DealBoardDaoImpl"%>
<%@page import="com.fnt.model.biz.AlertBiz"%>
<%@page import="com.fnt.model.biz.impl.AlertBizImpl"%>
<%@page import="com.fnt.model.dto.AlertDto"%>
<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)알람내역</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="css/section2.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {margin: 0px; padding: 0px;}
section{padding:0px !important;}
h3{text-align: center; font-family: "Arial"; width: 100vw; height: 40px; padding-top: 16px; color: white; background-color: rgba(255,255,255,0.2); position: fixed; z-index: 2;}
#alertlist {padding-top: 56px; font-family: "Arial"; color: white; overflow: auto;}
.alertone {padding-top: 8px; padding-bottom: 8px; display: flex;}
.alertone:nth-child(even){background-color: rgba(255,255,255,0.1);}
</style>
	<%
		//세션에 값이 담긴 memberdto을 받아온다.
		MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
	%>
	<script type="text/javascript">
	
	var memberid = "<%=memberdto.getMemberid()%>";
	
	function closePop(param){
		opener.location.href='dealboard.do?command=alertupdate&dboardno='+param;
		self.close();
	}
	
	function getParameterValues(){
		var queryString = "?command=alert&memberid=" + memberid;
		return queryString;
	}
	
		onload=function(){
		 	//이 창이 load되자마자 mypagecontroller에 memberid값을 전달해줘야한다.
			
			//setInterval(function(){
			//$("#alertlist").empty();
			//console.log("!");
			$.ajax({
				url : "mypage.do" + getParameterValues(),
				dataType : "json",
			
				success : function(data){
					
					$.each(data, function(key, val){
					
						if (val == "") {
							$("#alertlist").append(
								"<div class='alertone'><p style='margin:0px auto;margin-top:10%;'>현재 <b>" + '<%=memberdto.getMembernickname()%>' + "</b>님의 글에 작성된 댓글이 없습니다.</p></div>"		
							);
							
						} else {
							var list = val;
							for(var i = 0; i < list.length; i++) {
								var str = list[i];
								var param = str.dboardno;
								//console.log(param);
								$("#alertlist").append(
									"<div class='alertone'><p style='font-size:14pt;font-weight:bold;margin-top:4px;margin-right:20px;margin-left:30px;'>No. "+ str.alertboardno +"</p><p style='font-size:11pt;'><b>"+ str.dnickname +"</b>님의 <b>"+ str.dtitle +"</b> 에<br/>새로운 댓글이 있습니다.</p></div>"
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
		//}, 1000);
	}
		
	</script>
</head>
<body>
<section>
	<h3><%=memberdto.getMembernickname() %>님의 알림내역</h3>
	
	<div id="alertlist"></div>
</section>
</body>
</html>
