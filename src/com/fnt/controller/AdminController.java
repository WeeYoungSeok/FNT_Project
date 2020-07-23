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
			}else {
				List<MemberDto> list = new ArrayList<MemberDto>();
				list = adminpagebiz.selectAll(enabled);
				request.setAttribute("list", list);
				dispatch("fntadminpageselect.jsp",request,response);
			}
			//json으로 바꿔준다.
			
			
			
			/*
			 * ajax
			 * System.out.println(list.toString()); PrintWriter out = response.getWriter();
			 * out.println(list.get(0));
			 */
			
			//신고내용 자세히 보기
		} else if(command.equals("reportdetail")) {
			int reportno = Integer.parseInt(request.getParameter("reportno"));
			ReportDto dto = new ReportDto();
			dto = reportpagebiz.selectOne(reportno);
			request.setAttribute("reportdto", dto);
			dispatch("fntadminpagereportdetail.jsp", request, response);
			
			//처리버튼 누르면 enabled를 r로 바꿔주기.
		} else if(command.equals("change")) {
			String receiveid = request.getParameter("receiveid");
			int res = adminpagebiz.updateRole(receiveid);
			if(res > 0) {
				jsResponse("신고처리가 완료되었습니다.", "admin.do?command=adminpage", response);
			}
		}
		//회원상태조회에서 복귀버튼 누르면 enabled를 y로 변경
		else if(command.equals("reset")) {
			String id = request.getParameter("id");
			System.out.println(id + "컨트롤러에서 찍힌 id");
			int res = adminpagebiz.restEnabled(id);
			if(res > 0) {
				jsResponse("복귀처리가 완료되었습니다.", "admin.do?command=adminpage", response);
			}
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
