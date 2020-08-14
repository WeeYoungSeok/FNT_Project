<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
// opener 관련 오류 발생 시 아래 주석을 해지하고, 사용자의 도메인정보를 입력
// ("팝업API 호출 소스"도 동일하게 적용시켜야 함)
// document.domain = "http://127.0.0.1:8787/FNT_Project/fntsignupform.jsp";

function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출
	// 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출
	var pop = window.open("./jusoPopup.jsp",
						  "pop",
						  "width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr) {
		// jusoPopup에서 주소입력한 정보를 받아서, 현재 페이지에 정보를 등록
		document.form.roadFullAddr.value = roadFullAddr;
}
</script>
<title>주소 입력 샘플</title></head><body>
<form name="form" id="form" method="post">
	<input type="button" onClick="goPopup();" value="팝업_domainChk"/>
	<div id="list"></div>
	<div id="callBackDiv">
		<table>
			<tr>
				<td>도로명주소 전체(포멧)</td>
				<td><input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" required="required"/></td>
			</tr>
		</table>
	</div>
</form>
</body></html>