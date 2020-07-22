package com.fnt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fnt.model.biz.AdminPageBiz;
import com.fnt.model.biz.impl.AdminPageBizImpl;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dto.MemberDto;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

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
		AdminPageDao adminpagedao = new AdminPageDaoImpl();
		AdminPageBiz adminpagebiz = new AdminPageBizImpl();
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		//header에 role를 클릭하면 adminpage로 이동한다.
		if(command.equals("adminpage")) {
			response.sendRedirect("fntadminpage.jsp");
		}		
		//adminpage에서 "전체회원조회"를 클릭하면
		if(command.equals("select")) {
			String enabled = request.getParameter("enabled");
			List<MemberDto> list = new ArrayList<MemberDto>();
			list = adminpagebiz.selectAll(enabled);
			//json으로 바꿔준다.
			
			
			
			System.out.println(list.get(0));
			PrintWriter out = response.getWriter();
			out.println(list.get(0));
			 
			
			
			//request.setAttribute("list", adminpagebiz.selectAll(enabled));
			//System.out.println(enabled + "잘 들어왔니?");
			//dispatch("fntadminpage.jsp",request,response);
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
