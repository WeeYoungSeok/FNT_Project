<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)마이페이지</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@ include file="./form/header.jsp" %>
    <%@ include file="./form/aside.jsp" %>
    <section>
        <h1>마이페이지</h1>
        <form action="mypage.do">
        <input type="hidden" name="command" value="selectlist"/>
        <input type="hidden" name="memberid" value="<%=memberdto.getMemberid()%>"/>
        <select name="mypageselect">
            <option>내가 쓴 글보기</option>
            <option>찜목록</option>
            <option>주문내역</option>
        </select> 
        <input type="submit" value="조회"/>
        </form>
    </section>
    <%@ include file="./form/footer.jsp" %>
</body>
</html>