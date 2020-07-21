package com.fnt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnt.model.dto.MemberDto;


@WebServlet("/mypage.do")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MypageController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		//세션 객체 만들어준다.
		HttpSession session = request.getSession();
		
		MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
		System.out.println(memberdto.getMembername());		
				
		//알람창뜨게하기
		if(command.equals("alert")) {
			response.sendRedirect("fntalert.jsp");
		}
		
		//마이페이지
		if(command.equals("mypage")) {
			if(memberdto.getMemberrole().equals("USER")) {
			response.sendRedirect("fntmypage.jsp");
			} else if(memberdto.getMemberrole().equals("ADMIN")) {
				response.sendRedirect("admin.do?command=adminpage");
			}
		}
		
		if(memberdto != null) {
			
		}
		
	}

}
