<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
    // 이미지 업로드할 경로
   // getrealpath
    
   String realpath =  request.getSession().getServletContext().getRealPath("/");
    
    System.out.println("[이미지 업로드 하는중]");
//	String uploadPath = "D:/Project/FNT_Project/WebContent/upload/";
    int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
	
	String fileName = ""; // 파일명
	
	try{
        // 파일업로드 및 업로드 후 파일명 가져옴
		MultipartRequest multi = new MultipartRequest(request, realpath+"upload", size, "utf-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement(); 
		fileName = multi.getFilesystemName(file); 
		
	}catch(Exception e){
		e.printStackTrace();
	}

    
/* 	File f = new File(uploadPath);
	if (!f.exists()) {
		f.mkdirs();
	}
     */
    
/* 	
    // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
	JSONObject jobj = new JSONObject();
	jobj.put("url", uploadPath);
*/
//	response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
	System.out.println("[이미지 업로드 완료]");
	out.print("./upload/"+fileName); // 상대경로 입력해주기
	
%>