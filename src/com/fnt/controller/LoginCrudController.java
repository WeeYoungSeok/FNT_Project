package com.fnt.controller;

import java.io.IOException;


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
				if(memberdto.getMemberenabled().equals("R")) {
					jsResponse("신고된 회원입니다.카카오 채널로 문의 해주세요.카카오 채널 ID: fnt_5", "fntmain.jsp", response);
					session.invalidate();
				} else if (memberdto.getMemberenabled().equals("N")) {
					jsResponse("탈퇴된 회원입니다.카카오 채널로 문의 해주세요.카카오 채널 ID: fnt_5", "fntmain.jsp", response);
					session.invalidate();
				} else {
					jsResponse(memberdto.getMembernickname() + "님 환영합니다.", "fntmain.jsp", response);
				}
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
		}else if(command.equals("cruddetail")) {
			String memberid = request.getParameter("memberid");
			System.out.println(memberid+"어디야 시발련아");
			MemberDto dto = new MemberDto();
			dto = dao.selectOne(memberid);
			System.out.println(dto.toString() + "컨트롤러에서 dto");
			request.setAttribute("dto", dto);
			dispatch("fntcrudmypage.jsp", request, response);
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
