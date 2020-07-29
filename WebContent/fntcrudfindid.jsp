<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.fnt.model.dto.MemberDto"%>
<%@page import="com.fnt.model.dao.impl.LoginCrudDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)아이디찾기</title>
</head>
<body>

<%
	LoginCrudDaoImpl dao = new LoginCrudDaoImpl();
	String email = request.getParameter("email");
	MemberDto dto = dao.findId(email);
	String id = dto.getMemberid();
	System.out.println("email");
	System.out.println("id");
	System.out.println(email);
	JSONObject ob = new JSONObject();
	ob.put("id", id);
	Gson gson = new Gson();
    String jsonPlace = gson.toJson(ob);
    System.out.println(jsonPlace);
	out.print(jsonPlace);
%>

</body>
</html>