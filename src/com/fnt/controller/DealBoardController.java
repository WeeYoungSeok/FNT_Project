package com.fnt.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.fnt.model.biz.DealBoardBiz;
import com.fnt.model.biz.impl.DealBoardBizImpl;
import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dao.impl.DealBoardDaoImpl;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/dealboard.do")
@MultipartConfig
public class DealBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		DealBoardDao dao = new DealBoardDaoImpl();
		DealBoardBiz biz = new DealBoardBizImpl();
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
	
		if(command.equals("fntsaleboard")) { //판매게시판			
			List<DealBoardDto> list = dao.selectSaleList();
			request.setAttribute("list", list);
			
			dispatch("fntsaleboard.jsp", request, response);
			
		}else if(command.equals("fntbuyboard")) { //구매게시판
			List<DealBoardDto> list = dao.selectBuylist();
			request.setAttribute("list", list);
			
			dispatch("fntbuyboard.jsp", request, response);
			
		}else if(command.equals("insertbuyboard")) { //구매글작성form
			response.sendRedirect("fntinsertbuyboardform.jsp");
			
		}else if(command.equals("insertsaleboard")) { //판매글작성form
			response.sendRedirect("fntinsertsaleboardform.jsp");
			
		}else if(command.equals("insertimage")) {  // 이미지 업로드
		    // 이미지 업로드할 경로
			String uploadPath = "D://Project//FNT_Project//WebContent//upload";
		    int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
			
			String fileName = ""; // 파일명
			
			try {
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames();
				String file = (String)files.nextElement(); 
				fileName = multi.getFilesystemName(file); 
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
			uploadPath =  uploadPath + fileName;
			
		    // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
			JSONObject jobj = new JSONObject();
			jobj.put("url", uploadPath);
			
			response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
			response.getWriter().print(jobj.toJSONString());				
			
		}else if(command.equals("insertbuyboardres")) {
			String dtitle = request.getParameter("dtitle");
			String dcategory = request.getParameter("dcategory");
			String dcontent = request.getParameter("dcontent");
			int dprice = biz.removecomma((request.getParameter("dprice")));
			MemberDto memberdto =(MemberDto)session.getAttribute("memberdto");
			String memberid = memberdto.getMemberid();
			String membernickname = memberdto.getMembernickname();
			
			System.out.println("Dcontent : "+dcontent);
			
			DealBoardDto dealboarddto = new DealBoardDto();
			dealboarddto.setDid(memberid);
			dealboarddto.setDnickname(membernickname);
			dealboarddto.setDtitle(dtitle);
			dealboarddto.setDcategory(dcategory);
			dealboarddto.setDcontent(dcontent);
			dealboarddto.setDprice(dprice);
			dealboarddto.setDfilename("None");
			
			
			
			int res = dao.insertSaleBoard(dealboarddto);
			
			if(res > 0) {
				jsResponse("작성 성공", "dealboard.do?command=fntbuyboard", response);
						
			}else {
				jsResponse("작성 실패", "dealboard.do?command=insertbuyboard", response);

			}
				
		}else if(command.equals("insertsaleboardres")) { //판매글 입력완료
			String dtitle = request.getParameter("dtitle");
			String dcategory = request.getParameter("dcategory");
			String dcontent = request.getParameter("dcontent");
			int dprice = biz.removecomma((request.getParameter("dprice")));
//			String [] dfilename = request.getParameterValues("dfilename");
			
			MemberDto memberdto =(MemberDto)session.getAttribute("memberdto");
			String memberid = memberdto.getMemberid();
			String membernickname = memberdto.getMembernickname();
			
			
			DealBoardDto dealboarddto = new DealBoardDto();
//			String dfilenameres = biz.Caldfilename(dfilename);
			
			dealboarddto.setDid(memberid);
			dealboarddto.setDnickname(membernickname);
			dealboarddto.setDtitle(dtitle);
			dealboarddto.setDcategory(dcategory);
			dealboarddto.setDcontent(dcontent);
			dealboarddto.setDprice(dprice);
//			dealboarddto.setDfilename(dfilenameres);
			
			int res = dao.insertSaleBoard(dealboarddto);
			
			if(res > 0) {
				jsResponse("작성 성공", "dealboard.do?command=fntsaleboard", response);
						
			}else {
				jsResponse("작성 실패", "dealboard.do?command=insertsaleboard", response);

			}
		}else if(command.equals("detailboard")) { //글 자세히보기
			int dboardno = Integer.parseInt(request.getParameter("dboardno"));
			DealBoardDto dealboarddto = dao.selectDetail(dboardno);
			
			request.setAttribute("dealboarddto", dealboarddto);
			dispatch("fntdetailboard.jsp", request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";

		response.getWriter().append(s);
	}
/*
	public JsonObject uploadSummernoteImageFile(MultipartFile multipartFile) {
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
*/
}
