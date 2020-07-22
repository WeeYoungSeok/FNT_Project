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
import com.fnt.model.biz.ReportPageBiz;
import com.fnt.model.biz.impl.AdminPageBizImpl;
import com.fnt.model.biz.impl.ReportPageBizImpl;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.ReportDto;
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
		AdminPageBiz adminpagebiz = new AdminPageBizImpl();
		ReportPageBiz reportpagebiz = new ReportPageBizImpl();
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		//header에 role를 클릭하면 adminpage로 이동한다.
		if(command.equals("adminpage")) {
			response.sendRedirect("fntadminpage.jsp");
		}		
		//adminpage에서 "전체회원조회"를 클릭하면
		if(command.equals("select")) {
			String enabled = request.getParameter("enabled");
			
			//enabled가 report이면 reportdto로 전체출력해주고 뿌려줘야한다.
			if(enabled.equals("report")) {
				//response.sendRedirect("fntadminpagereport.jsp");
				List<ReportDto> list = new ArrayList<ReportDto>();
				list = reportpagebiz.selectList();
				request.setAttribute("reportlist", list);
				dispatch("fntadminpagereport.jsp", request, response);
				System.out.println("report로 들어옴");
			}else {
				List<MemberDto> list = new ArrayList<MemberDto>();
				list = adminpagebiz.selectAll(enabled);
				request.setAttribute("list", list);
				System.out.println(enabled + "잘 들어왔니?");
				dispatch("fntadminpageselect.jsp",request,response);
			}
			//json으로 바꿔준다.
			
			
			
			/*
			 * ajax
			 * System.out.println(list.toString()); PrintWriter out = response.getWriter();
			 * out.println(list.get(0));
			 */
		} else if(command.equals("reportdetail")) {
			int reportno = Integer.parseInt(request.getParameter("reportno"));
			ReportDto dto = new ReportDto();
			dto = reportpagebiz.selectOne(reportno);
			request.setAttribute("reportdto", dto);
			dispatch("fntadminpagereportdetail.jsp", request, response);
		} else if(command.equals("change")) {
			String receiveid = request.getParameter("receiveid");
			System.out.println(receiveid+"ㅎㅎ");
			
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
