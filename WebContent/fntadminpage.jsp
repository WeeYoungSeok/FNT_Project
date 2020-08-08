 <%@page import="com.fnt.model.dto.ReportDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)관리자페이지</title>
<link href="css/section.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
* {margin:0px; padding:0px;}

#menutitle {padding-left:31% !important;}

h1 {margin-top: 3%; margin-bottom: 2%; text-align: center; font-family: "Arial"; color: white;}

#memchart {margin-left:40px; margin-right:10px;}

#memlank {padding-top:26px;}

#adminmenu {height: 22px; color:white; background-color: rgba(255,255,255,0.1);}

#selectmember {width: 60px; height: 24px; cursor: pointer; color:white; background-color: rgba(255,255,255,0.3); border: 2px solid rgba(255,255,255,0); border-radius: 2px 2px 2px 2px;}

#selectmember:hover {font-weight: bold; background-color: rgba(255,255,255,0); border: 2px solid rgba(255,255,255,0.5);}

span > span {font-family:"Arial"; font-weight:bold; font-size:14pt; margin:0px;}

tr:hover {background-color:rgba(255,255,255,0.1);}

.hovernot:hover {background-color:rgba(255,255,255,0);}

th {background-color: rgba(255,255,255,0); color: rgba(255,255,255,0.5);
	font-weight: bold; height: 30px; font-size: 11pt; text-align: center; padding-top: 0.4%;}

td {height: 28px; font-size: 9pt; color: white; text-align: center;}

#selecttable {width: 90%; margin: 0px auto; text-align: absmiddle; font-family: "Arial";}

#print {width: 90%; margin: 0px auto; overflow: auto;}

#tabletitle {width: 100%; font-family: "Arial";}

#listlast {background-color: rgba(255,255,255,0.5); height: 2px; border:none !impotant;}

.chkbtn {margin: 0px auto; width: 100%; height: 40px; border: none; border-radius: 2px 2px 2px 2px; 
	cursor: pointer; font-size: 10pt; color: black; float: center; font-weight: bold;}

.chkbtn:hover {font-weight: bold; color: white; background-color: black;}

#tabletitle {margin-bottom:5%;}

#tabletitle td {overflow: auto; border-bottom: 1px solid rgba(255,255,255,0.5);}

</style>

<script type="text/javascript">
//일반,신고,탈퇴 회원 조회했을 때 option에서 받아오는 value값을 controller에 넘겨주려고 만든 function
function getParameterValues(){
	var queryString = "?command=select&enabled=" + $("select[name=enabled]").val();
	return queryString;
 }
 //일반, 신고, 회원, 신고당한 회원을 조회하기 위해서 option에서 value값을 controller에 넘겨주려고 만든 function
function enabledValue() {
	var enabled = $("select[name=enabled]").val();
	return enabled;
}

function letGo(){
	   $("#tablethead").empty();
	   $("#tabletbody").empty();
if(enabledValue() == "Y" || enabledValue() == "N" || enabledValue() == "R") {
	   $.ajax({
	      url : "admin.do" + getParameterValues(),
	      dataType : "json",
	      success : function(data) {
	         $("#tablethead").append(
	 	        	"<col width='10%'>"+
		        	"<col width='10%'>"+
		        	"<col width='5%'>"+
		        	"<col width='10%'>"+
		        	"<col width='10%'>"+
		        	"<col width='40%'>"+
		        	"<col width='10%'>"+
		        	"<col width='5%'>"+
	            "<tr class='hovernot' id=title>"+
	               "<th>"+"ID"+"</th>"+
	               "<th>"+"닉네임"+"</th>"+
	               "<th>"+"이름"+"</th>"+
	               "<th>"+"생년월일"+"</th>"+
	               "<th>"+"전화번호"+"</th>"+
	               "<th>"+"주소"+"</th>"+
	               "<th>"+"이메일"+"</th>"+
	               "<th>"+"가입일"+"</th>"+
	            "</tr>" +
		            "<tr class='hovernot'><td id='listlast' colspan='8'></tr>"
	            );
	               if(enabledValue() == "R"){
	 	               $("#title").append( 
	 	            	"<th>처리</th>"
	 	            	);
	 	            }
	         $.each(data, function(key, val){
	         	
	        	 if(val.length != 0){
	               var list = val;
	               for (var i = 0; i < list.length; i++) {
	                  var str = list[i];
	                  if(enabledValue() =="Y"||enabledValue()=="N"){
	                  $("#tabletbody").append(
	                     "<tr id=content>"+
	                        "<td>"+str.memberid+"</td>"+
	                        "<td>"+str.membernickname+"</td>"+
	                        "<td>"+str.membername+"</td>"+
	                        "<td>"+str.memberbirth+"</td>"+
	                        "<td>"+str.memberphone+"</td>"+
	                        "<td>"+str.memberaddr+"</td>"+
	                        "<td>"+str.memberemail+"</td>"+
	                        "<td>"+str.memberregdate+"</td>"+
	                     "</tr>"
	                  );
	                  }
	                  else {
	                	  $("#tabletbody").append(
	     	                     "<tr>"+
	     	                        "<td>"+str.memberid+"</td>"+
	     	                        "<td>"+str.membernickname+"</td>"+
	     	                        "<td>"+str.membername+"</td>"+
	     	                        "<td>"+str.memberbirth+"</td>"+
	     	                        "<td>"+str.memberphone+"</td>"+
	     	                        "<td>"+str.memberaddr+"</td>"+
	     	                        "<td>"+str.memberemail+"</td>"+
	     	                        "<td>"+str.memberregdate+"</td>"+
	     	                       "<td><input type=button value=복귀하기 class=chkbtn  onclick=location.href='admin.do?command=reset&id="+ str.memberid + "'></td>"+
	     	                     "</tr>"
	     	                     
	     	                  );	  
	                  }
	               }
	            } else{
           	  		$("#tabletbody").append(
	                	"<tr><td colspan='9 ' align='center'>-----조회된 회원이 없습니다.-----</td></tr>"	  
	              	);
	              }
	         });
	      },
	      error : function(){
	         alert("회원여부조회페이지 연결 실패");
	      }
	      });
	   	}

	else if(enabledValue() == "REPORT"){
   $.ajax({
	      url : "admin.do" + getParameterValues(),
	      dataType : "json",
	      success : function(data) {
	         $("#tablethead").append(
	            "<tr class='hovernot'>"+
	               "<th>"+"No."+"</th>"+
	               "<th>"+"신고 사유"+"</th>"+
	               "<th>"+"신고자 ID"+"</th>"+
	               "<th>"+"신고자 닉네임"+"</th>"+
	               "<th>"+"대상자 ID"+"</th>"+
	               "<th>"+"대상자 닉네임"+"</th>"+
	               "<th>"+"신고일"+"</th>"+
	               "<th colspan=2>"+"신고 처리"+"</th>"+
			            "</tr>" +
	  		            "<tr class='hovernot'><td id='listlast' colspan='9'></tr>"
			         );
			         $.each(data, function(key, val){
			        	 if(val.length != 0){
			               var list = val;
			               for (var i = 0; i < list.length; i++) {
			                  var str = list[i];
			                  $("#tabletbody").append(
			                     "<tr>"+
			                        "<td>"+str.reportno+"</td>"+
			                        "<td><a href=admin.do?command=reportdetail&reportno=" + str.reportno +">"+str.reporttitle+"</a></td>"+
			                        "<td>"+str.sendid+"</td>"+
			                        "<td>"+str.sendnickname+"</td>"+
			                        "<td>"+str.receiveid+"</td>"+
			                        "<td>"+str.receivenickname+"</td>"+
			                        "<td>"+str.reportregdate+"</td>"+
			                        "<td><input type=button value=차단 class=chkbtn onclick=location.href='admin.do?command=change&receiveid="+ str.receiveid + "'></td>"+
			                     	"<td><input type=button value=거절 class=chkbtn onclick=location.href='admin.do?command=cancel&reportno="+str.reportno+"'></td>" +
			                     "</tr>"
			                  );
			               }
			        	 }  else {
			        		 $("#tabletbody").append(
			        			"<tr><td colspan='8' align='center'>-----신고받은 회원이 없습니다.-----</td></tr>"		 
			        		 );
			        	 } 
			            
			         });  
			      },
			      error : function(){
			         alert("신고 처리페이지 연결 실패");
			      }
			      });
			  	}
			  	else if(enabledValue() == "S"){
			  		$.ajax({
			  			url : "admin.do" + getParameterValues(),
			  			dataType : "json",
			  			success : function(data){
			  		         $("#tablethead").append(
			  		            "<tr class='hovernot'>"+
			  		               "<th>No.</th>"+
			  		               "<th>판매자 ID</th>"+
			  		               "<th>판매자 닉네임</th>"+
			  		               "<th>계좌번호</th>" +
			  		               "<th>판매 글 제목</th>"+
			  		               "<th>가격</th>"+
			  		               "<th>작성일</th>" +
			  		               "<th>구매 확정</th>" + 
			  		            "</tr>" +
			  		            "<tr class='hovernot'><td id='listlast' colspan='8'></tr>"
			  		            );
			  		         $.each(data, function(key, val){
			  		        	if(val.length != 0){
			  		        		var list = val;
			  		        		for(var i = 0; i < list.length; i++){
			  		        			var str = list[i];
			  		        			$("#tabletbody").append(
			  		        				"<tr id=content>" + 
			  		        				"<td>" + str.dboardno + "</td>" +
			  		        				"<td>" + str.did + "</td>" +
			  		        				"<td>" + str.dnickname + "</td>" +
			  		        				"<td>" + str.account + "</td>" +
			  		        				"<td>" + str.dtitle + "</td>" +
			  		        				"<td>" + str.dprice + "원</td>" +
			  		        				"<td>" + str.dregdate + "</td>" +
			  		        				"<td class=chk> 구매 확정 대기</td>" +
			  		        				"</tr>"
			  		        			);
			  		        			if(str.dsellflag=="F"){
			  		        				$(".chk").eq(i).html(
			  		        					"<b style=color:red>구매 확정</b>"		
			  		        				);
			  		        			}
			  		        		}
			  		        	}else {
			  		        		$("#tabletbody").append(
			  		        			"<tr><td colspan='8' align='center'>판매 완료된 글이 없습니다.</td></tr>"		
			  		        		);
			  		        	}
			  		         });
			  		       
			  			},
			  			error : function(){
			  				alert("판매완료 글 조회 실패");
			  			}
			  		});
				}
			}
</script>
<script src="http://d3js.org/d3.v3.js"></script>
<script src="https://www.cssscript.com/demo/simple-typewriter-effect-pure-javascript-typewriterjs/typewriter.js"></script>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function() {
		var width = 70,
			height = 70,
			outerRadius = Math.min(width, height)/2,
			innerRadius = outerRadius * .5,
			color = d3.scale.category20();
			
		var dataset = [
			{name:"일반 회원", value:${yMemCnt}}, 
			{name:"탈퇴 회원", value:${nMemCnt}}, 
			{name:"신고 회원", value:${rMemCnt}}
		];
		var vis = d3.select("#memchart")
			.append("svg:svg")
			.attr("width", width)
			.attr("height", height)
			.append("svg:g")
			.attr("transform", "translate(" + outerRadius + "," + outerRadius + ")")
			.data([dataset]);
		
		var arc = d3.svg.arc().innerRadius(0).outerRadius(outerRadius);
		
		var pie = d3.layout.pie().value(function(d) { return d.value; });
		
		var arcs = vis.selectAll("g.slice")
			.data(pie)
			.enter()
			.append("svg:g")
			.attr("class", "slice");
		
		arcs.append("svg:path")
			.attr("d", arc)
			.attr("fill", function(d, i) { return color(i); });
		
		arcs.append("svg:text")
			.attr("dy", ".2em")
			.attr("text-anchor", "middle")
			.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + angle(d) + ")"; })
		//	.text(function(d) { return d.data.name; })
			;
		
		function angle(d) {
			var a = (d.startAngle + d.endAngle) * 90 / Math.PI - 90;
			return a > 90 ? a - 180 : a;
		}
		
		vis.append("svg:text")
			.attr("dy", ".2em")
			.attr("text-anchor", "middle")
		//	.text("회원 상태 별 회원 수 조회")
			.attr("class", "title");
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
		
		<div style="display:flex;margin-top:4%;margin-left:34%;margin-bottom:1%;">
		
			<h1>관리자페이지</h1>
			
			<div id="memchart"></div>
			
			<p id="memlank"></p>
			<script type="text/javascript">
				var typing = document.getElementById('memlank');
				var typewriter = new Typewriter(typing, { loop: true });
				typing.style.color = "white";
				typewriter.typeString('전체 누적 회원 ${allMemCnt}명').pauseFor(2000).deleteAll()
						  .typeString('일반 회원 ${yMemCnt}명').pauseFor(2000).deleteAll()
						  .typeString('탈퇴한 회원 ${nMemCnt}명').pauseFor(2000).deleteAll()
						  .typeString('신고된 회원 ${rMemCnt}명').pauseFor(2000).deleteAll()
						  .start();
			</script>
			
		</div>
		
		<table id="selecttable">
		<tr class="hovernot">
			<td>
				<select id="adminmenu" name="enabled">
					<optgroup label="선택한 회원 조회">
						<option value="Y">일반회원 조회</option>
						<option value="N">탈퇴회원 조회</option>
						<option value="R">신고회원 조회</option>
					</optgroup>
					<optgroup label="신고된 회원 차단">
						<option value="REPORT">신고 및 차단</option>
					</optgroup>
					<optgroup label="판매완료 글 조회">
						<option value="S">판매완료 글</option>
					</optgroup>
				</select>
		
				<input type="button" value="조회" id="selectmember" onclick="letGo();" />
			</td>
		</tr>
		</table>

		<div id="print">
			<table id="tabletitle">
				<thead id="tablethead"></thead>
				<tbody id="tabletbody"></tbody>
			</table>
		</div>
	</section>
	<%@ include file="./form/footer.jsp"%>
	<%
		}
	%>
</body>
</html>