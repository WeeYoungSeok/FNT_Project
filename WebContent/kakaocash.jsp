	<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto memberdto = (MemberDto)session.getAttribute("memberdto"); 
	DealBoardDto dto = (DealBoardDto)request.getAttribute("dto");
%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>kakao</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
    	//결제하기 버튼 누르면
  
        var IMP = window.IMP;
        IMP.init("imp74386888");

        // IMP.request_pay(param, callback) 호출
        IMP.request_pay({ // param
           
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "merchant-"+new Date().getTime(),
          name : '<%=dto.getDtitle()%>',
          amount : <%=dto.getDprice()%>,
          buyer_email : '<%=memberdto.getMemberemail()%>',
          buyer_name : '<%=memberdto.getMembername()%>',
          buyer_tel : '<%=memberdto.getMemberphone()%>',
          buyer_addr : '<%=memberdto.getMemberaddr()%>',
          buyer_postcode : '123-456',
        }, function (rsp) { // callback
          if (rsp.success) {
           // jQuery로 HTTP 요청
              jQuery.ajax({
                  url: "https://www.myservice.com/payments/complete", // 가맹점 서버
                  method: "POST",
                  headers: { "Content-Type": "application/json" },
                  data: {
                      imp_uid: rsp.imp_uid,
                      merchant_uid: rsp.merchant_uid
                  }
              }).done(function (data) {
                // 가맹점 서버 결제 API 성공시 로직
            	
              })
              location.href= "dealboard.do?command=cashupdate&dboardno="+<%=dto.getDboardno()%>;
            } else {
              alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
            }
          });

        
    });
    
  
    </script> 
 
</body>
</html>