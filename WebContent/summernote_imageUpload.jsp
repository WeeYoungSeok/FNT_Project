<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sun.imageio.plugins.common.ImageUtil"%>
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
	System.out.println("realpath : " +realpath);
    
    System.out.println("[이미지 업로드 하는중]");
//	String uploadPath = "D:/Project/FNT_Project/WebContent/upload/";
    int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
	
	String fileName = ""; // 파일명
	
	try{
        // 파일업로드 및 업로드 후 파일명 가져옴
		MultipartRequest multi = new MultipartRequest(request, realpath+"/upload", size, "utf-8", new DefaultFileRenamePolicy());
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
//	System.out.println(realpath);
//	response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
	System.out.println("[이미지 업로드 완료]");

	/*
		realPath가 .metadate안에 들어가는 경로인데
		이 프로젝트의 실제경로를 타고가기 위해서는 metadate의 경로안에있는 wtpwebapps안에있는 프로젝트가 우리의 실제경로이다
		localhost:8787/프로젝트명을 실행하면 실제경로인 리얼패쓰를 타고들어가 wtpwebapps안에있는 프로젝트를 실행시키는것임
		결국 리얼패쓰 = localhost:8787/프로젝트명인데 그 안에있는 upload이기때문에 ./upload로 경로를 찾아가야 한다.
		리얼패쓰를 불러올때는 절대경로로 불러오면 안된다 그러면 자기 자신의 로컬 절대경로이기때문에 누구든 내 컴퓨터를 들어올수가있기때문에 굉장히 위험하다
		그래서 String realpath =  request.getSession().getServletContext().getRealPath("/"); 이거를 통해서 localhost:8787/프로젝트명 = 리얼패쓰를
		내부적으로 알아서 불러오게해야지 내 로컬에 침투가 안되고 리얼패쓰에 들어간다.
		
		--------------
		현재 프로젝트는 C:나 D: 밑에 있는 프로젝트가 실제 경로가 아니라 metadate의 경로안에있는 wtpwebapps안에 있는 프로젝트가 실제경로(= localhost:8787/프로젝트명)이다.
		(C:나 D: 밑에 있는 프로젝트는 리얼패스에서 가져온 복사본)
		사진을 업로드 할때 다른 사람들도 다 보기 위해서는 로컬에 저장해서는 안되기 때문에 realpath에 있는 upload파일을 찾아서 보여주어야 한다.
		String realpath =  request.getSession().getServletContext().getRealPath("/"); <- realpath를 알 수 있는 메소드

		
	*/
	String pattern = fileName.substring(fileName.indexOf(".")+1); // gif, png 확장자 자르기
	String headName = fileName.substring(0,fileName.indexOf(".")); // 확장자 자른 진짜 파일 이름
	
	
	
	
/* 	String imagePath = "./upload/"+fileName; 
	String thumbnail ="./upload/"+headName+"_small."+pattern;
	File dest = new File(thumbnail); // 섬네일 사진 만들기 완료
	
	List<String> list = new ArrayList<>();
	list.add(imagePath);
	list.add(thumbnail);
	JSONObject obj = new JSONObject();
	for(int i=0; i<list.size(); i++){
		obj.put(i,list.get(i));
	}
	
	Gson gson = new Gson();
	String jsonobj = gson.toJson(obj); */
	
	out.print("./upload/"+fileName); // 상대경로 입력해주기
	
%>