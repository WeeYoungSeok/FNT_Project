package com.fnt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnt.model.biz.AdminPageBiz;
import com.fnt.model.biz.AlertBiz;
import com.fnt.model.biz.DealBoardBiz;
import com.fnt.model.biz.MyPageBiz;
import com.fnt.model.biz.impl.AdminPageBizImpl;
import com.fnt.model.biz.impl.AlertBizImpl;
import com.fnt.model.biz.impl.DealBoardBizImpl;
import com.fnt.model.biz.impl.MyPageBizImpl;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dao.impl.DealBoardDaoImpl;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.model.dto.WishlistDto;


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
		AlertBiz alertbiz = new AlertBizImpl();
		
		//알람창뜨게하기
		if(command.equals("alert")) {
			String memberid = request.getParameter("memberid");
			List<AlertDto> alertlist = new ArrayList<AlertDto>();
			alertlist = alertbiz.AlertList(memberid);
			
			request.setAttribute("alertlist", alertlist);
			dispatch("fntalert.jsp", request, response);
		}
		
		//마이페이지
		if(command.equals("mypage")) {
			//fntmain.jsp에서 로그인하고 닉네임을 클릭했을 때에 memberid가 넘어오고
			//그 값을 받아서 sell list출력하고 담고 fntmypagesell.jsp에 보내준다.
			if(memberdto.getMemberrole().equals("USER")) {
				String memberid = request.getParameter("memberid");
				List<DealBoardDto> selllist = new ArrayList<DealBoardDto>();
				selllist = mypagebiz.Selllist(memberid);
				
				request.setAttribute("selllist", selllist);
				dispatch("fntmypagesell.jsp", request, response);
			} else if(memberdto.getMemberrole().equals("ADMIN")) {
				response.sendRedirect("admin.do?command=adminpage");
			}
		}else if(command.equals("buylist")) {
			//내가 쓴 구매글 클릭 시
			String memberid = request.getParameter("memberid");
			
			List<DealBoardDto> buylist = new ArrayList<DealBoardDto>();
			buylist = mypagebiz.Buylist(memberid);
			
			request.setAttribute("buylist", buylist);
			dispatch("fntmypagebuy.jsp", request, response);
			
		}else if(command.equals("qnalist")) {
			//내가 쓴 문의글 클릭 시
			String memberid = request.getParameter("memberid");
			
			List<QnaBoardDto> qnalist = new ArrayList<QnaBoardDto>();
			qnalist = mypagebiz.Qnalist(memberid);
			
			request.setAttribute("qnalist", qnalist);
			dispatch("fntmypageqna.jsp", request, response);
			
		}else if(command.equals("wishlist")) {
			//내가 찜한 상품 클릭 시
			String memberid = request.getParameter("memberid");
			
			List<WishlistDto> wishlist = null;
			wishlist = mypagebiz.Wishlist(memberid);
						
			request.setAttribute("wishlist", wishlist);
			dispatch("fntmypagewish.jsp", request, response);
			
			
		}else if(command.equals("orderlist")) {
			String memberid = request.getParameter("memberid");
			
			response.sendRedirect("fntmypageorder.jsp");
			//내가 주문한 상품 클릭 시
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
