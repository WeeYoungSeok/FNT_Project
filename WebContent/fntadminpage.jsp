 <%@page import="com.fnt.model.dto.ReportDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)관리자페이지</title>
<link href="css/section.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function getParameterValues(){
	var queryString = "?command=select&enabled=" + $("select[name=enabled]").val();
	return queryString;
 }
function enabledValue() {
	var enabled = $("select[name=enabled]").val();
	return enabled;
} 

function letGo(){
	   $("table").removeAttr("border");
	   $("thead").empty();
	   $("tbody").empty();
if(enabledValue() == "Y" || enabledValue() == "N" || enabledValue() == "R") {
	   $.ajax({
	      url : "admin.do" + getParameterValues(),
	      dataType : "json",
	      success : function(data) {
	         $("table").attr("border", 1);
	         $("thead").append(
	            "<tr id=title>"+
	               "<th>"+"아이디"+"</th>"+
	               "<th>"+"닉네임"+"</th>"+
	               "<th>"+"이름"+"</th>"+
	               "<th>"+"생년월일"+"</th>"+
	               "<th>"+"전화번호"+"</th>"+
	               "<th>"+"주소"+"</th>"+
	               "<th>"+"이메일"+"</th>"+
	               "<th>"+"가입날짜"+"</th>"+
	            "</tr>"
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
	                  $("tbody").append(
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
	                	  $("tbody").append(
	     	                     "<tr>"+
	     	                        "<td>"+str.memberid+"</td>"+
	     	                        "<td>"+str.membernickname+"</td>"+
	     	                        "<td>"+str.membername+"</td>"+
	     	                        "<td>"+str.memberbirth+"</td>"+
	     	                        "<td>"+str.memberphone+"</td>"+
	     	                        "<td>"+str.memberaddr+"</td>"+
	     	                        "<td>"+str.memberemail+"</td>"+
	     	                        "<td>"+str.memberregdate+"</td>"+
	     	                       "<td><input type=button value=복귀하기 onclick=location.href='admin.do?command=reset&id="+ str.memberid + "'></td>"+
	     	                     "</tr>"
	     	                     
	     	                  );	  
	                  }
	               }
	            } else{
              	  $("tbody").append(
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

	   	else{
		   $.ajax({
			      url : "admin.do" + getParameterValues(),
			      dataType : "json",
			      success : function(data) {
			         $("table").attr("border", 1);
			         $("thead").append(
			            "<tr>"+
			               "<th>"+"신고번호"+"</th>"+
			               "<th>"+"신고사유"+"</th>"+
			               "<th>"+"신고자 아이디"+"</th>"+
			               "<th>"+"신고자 닉네임"+"</th>"+
			               "<th>"+"신고받는사람 아이디"+"</th>"+
			               "<th>"+"신고받는사람 닉네임"+"</th>"+
			               "<th>"+"신고날짜"+"</th>"+
			               "<th>"+"처리"+"</th>"+
			            "</tr>"
			         );
			         $.each(data, function(key, val){
			        	 if(val.length != 0){
			               var list = val;
			               for (var i = 0; i < list.length; i++) {
			                  var str = list[i];
			                  $("tbody").append(
			                     "<tr>"+
			                        "<td>"+str.reportno+"</td>"+
			                        "<td><a href=admin.do?command=reportdetail&reportno=" + str.reportno +">"+str.reporttitle+"</a></td>"+
			                        "<td>"+str.sendid+"</td>"+
			                        "<td>"+str.sendnickname+"</td>"+
			                        "<td>"+str.receiveid+"</td>"+
			                        "<td>"+str.receivenickname+"</td>"+
			                        "<td>"+str.reportregdate+"</td>"+
			                        "<td><input type=button value=차단하기 onclick=location.href='admin.do?command=change&receiveid="+ str.receiveid + "'></td>"+
			                     "</tr>"
			                  );
			               }
			        	 }  else {
			        		 $("tbody").append(
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
}
			
</script>

</head>
<body>
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	
	
		<section>
		<h1>관리자페이지</h1>
		<select name="enabled">
			<optgroup label="선택한 회원 조회">
				<option value="Y">일반회원 조회</option>
				<option value="N">탈퇴회원 조회</option>
				<option value="R">신고회원 조회</option>
			</optgroup>
			<optgroup label="신고된 회원 차단">
				<option value="report">신고 및 차단</option>
			</optgroup>
		</select>
		<input type="button" value="조회" id="selectmember" onclick="letGo();" />

		<div id="print">
			<table>
				<thead></thead>
				<tbody></tbody>
			</table>
		</div>
	</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>