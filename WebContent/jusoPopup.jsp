<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FNT - Addr</title>
<% 
	request.setCharacterEncoding("UTF-8");
	
	// 해당 시스템의 인코딩 타입이 EUC-KR일 경우
	// request.setCharacterEncoding("EUC-KR");
	
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 

%>
</head>

<script language="javascript">
// opener 관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. 
// ("주소입력화면 소스"도 동일하게 적용시켜야 합니다.)
// document.domain = "http://127.0.0.1:8787/FNT_Project/fntsignupform.jsp";

function init() {
	
	var url = location.href;
	
	// 승인키 사용기간 (2020-07-24 ~ 2020-10-22)
	var confmKey = "devU01TX0FVVEgyMDIwMDcyNDA5MjExMjEwOTk4NzU=";
	
	// 도로명주소 검색결과 화면 출력내용 (1:도로명, 2:도로명+지번, 3:도로명+상세건물명, 4:도로명+지번+상세건물명)
	var resultType = "4"; 
	var inputYn= "<%=inputYn%>";
	
	if (inputYn != "Y") {
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do";
		document.form.submit();
		
	} else {
		var memberAddr = "<%=roadFullAddr%>";
		
		opener.jusoCallBack(memberAddr);
		window.close();
		}
}
</script>

<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가-->
		<!-- <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/> -->
	</form>
</body>
</html>