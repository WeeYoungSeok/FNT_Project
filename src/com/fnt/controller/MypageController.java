package com.fnt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnt.model.biz.AdminPageBiz;
import com.fnt.model.biz.DealBoardBiz;
import com.fnt.model.biz.MyPageBiz;
import com.fnt.model.biz.impl.AdminPageBizImpl;
import com.fnt.model.biz.impl.DealBoardBizImpl;
import com.fnt.model.biz.impl.MyPageBizImpl;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dao.impl.DealBoardDaoImpl;
import com.fnt.model.dto.DealBoardDto;
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
		MyPageBiz mypagebiz = new MyPageBizImpl();
				
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
		//마이페이지에서 선택사항 3개 중 하나를 선택하고 클릭했을 때 오는 컨트롤러.
		}else if(command.equals("selectlist")) {
			String memberid = request.getParameter("memberid");
			List<DealBoardDto> list = new ArrayList<DealBoardDto>();
			list = mypagebiz.Mywriterlist(memberid);
			
			request.setAttribute("mywriterlist", list);
			dispatch("fntmypagewriter.jsp", request, response);
		}
		
		if(memberdto != null) {
			
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
