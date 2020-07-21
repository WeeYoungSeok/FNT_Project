package com.fnt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnt.model.biz.AdminPageBiz;
import com.fnt.model.biz.impl.AdminPageBizImpl;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dto.MemberDto;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminController() {
    	 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		MemberDto memberdto = new MemberDto();
		AdminPageDao adminpageado = new AdminPageDaoImpl();
		AdminPageBiz adminpagebiz = new AdminPageBizImpl();
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		//header에 role를 클릭하면 adminpage로 이동한다.
		if(command.equals("adminpage")) {
			response.sendRedirect("fntadminpage.jsp");
		}
		
		//adminpage에서 "전체회원조회"를 클릭하면
		if(command.equals("select")) {
			List<MemberDto> list = adminpagebiz.selectAll();
			request.setAttribute("list", list);
			RequestDispatcher dispatch = request.getRequestDispatcher("fntadminpage.jsp");
			dispatch.forward(request, response);
		}
	}

}
