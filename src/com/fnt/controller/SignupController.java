package com.fnt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup.do")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SignupController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		if (command.equals("signup")) {
			String memberid = request.getParameter("memberid");
			String memberpw = request.getParameter("memberpw");
			String memberpwchk = request.getParameter("memberpwchk");
			String membernickname = request.getParameter("membernickname");
			String membername = request.getParameter("membername");
			String memberbirth = request.getParameter("memberbirth");
			String memberphone = request.getParameter("memberphone");
			String memberaddr = request.getParameter("memberaddr");
			String memberemail = request.getParameter("memberemail");
			String memberrole = request.getParameter("memberrole");
			String enabled = request.getParameter("enabled");
			String regdate = request.getParameter("regdate");
			
			response.sendRedirect("logincrud.jsp");
		}
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href = '" + url + "';"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.append(s);
	}

}
