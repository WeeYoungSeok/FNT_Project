package com.fnt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnt.model.dao.LoginCrudDao;
import com.fnt.model.dao.impl.LoginCrudDaoImpl;
import com.fnt.model.dto.MemberDto;
  

@WebServlet("/LoginCrudController")
public class LoginCrudController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginCrudController() {
    	 
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		LoginCrudDao dao = new LoginCrudDaoImpl();
		
		HttpSession session = request.getSession();
		
		
		if(command.equals("login")) {
			String memberid = request.getParameter("id");
			String memberpw = request.getParameter("pw");
			
			MemberDto memberdto = dao.login(memberid, memberpw);
			
			
			if(memberdto != null) {	//id 랑 pw가 있다면
				session.setAttribute("memberdto", memberdto);
				response.sendRedirect("fntmain.jsp");
				
			}else {
				jsResponse("아이디 또는 비밀번호를 확인해주세요", "fntlogincrud.jsp", response);
			}
			//id찾기 눌렀을 때 찾는 폼으로 이동
		}else if(command.equals("logincrudsearchid")) {
			
			jsResponse("id찾기", "fntlogincrudsearchid.jsp", response);
			
		}else if(command.equals("logout")) {
			session.invalidate();
			jsResponse("로그아웃 되었습니다.", "fntmain.jsp", response);
		}else if(command.equals("searchid")) {
			
			String membername = request.getParameter("name");
			String memberemail = request.getParameter("email");
			String memberphone = request.getParameter("phone");
			
			
			
			MemberDto dto = dao.searchId(membername, memberemail, memberphone);
			
			if(dto != null) {
				request.setAttribute("dto", dto);
				dispatch("fntlogincrudsearchidres.jsp", request, response);
				
			}else {
				jsResponse("잘못된 정보 입니다", "fntlogincrudsearchid.jsp", response);
			}
			
		}else if(command.equals("logincrudsearchpw")) {
			jsResponse("pw찾기", "fntlogincrudsearchpw.jsp", response);
		}else if(command.equals("searchpw")) {
			String memberid = request.getParameter("id");
			String membername = request.getParameter("name");
			String memberemail = request.getParameter("email");
			String memberphone = request.getParameter("phone");
			
			MemberDto dto = dao.searchPw(memberid, membername, memberemail, memberphone);
			
			if(dto != null) {
				request.setAttribute("dto", dto);
				dispatch("fntlogincrudsearchpwres.jsp", request, response);
			}else {
				jsResponse("잘못된 정보 입니다", "fntlogincrudsearchpw.jsp", response);
			}
		}
		
		
	}
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + 
					"alert('" + msg + "');" +
					"location.href='" + url + "';" +
					"</script>";
		
		response.getWriter().append(s);
		
	}

}
