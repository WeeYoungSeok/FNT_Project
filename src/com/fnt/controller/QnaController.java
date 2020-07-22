package com.fnt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnt.model.biz.QnaBoardBiz;
import com.fnt.model.biz.impl.QnaBoardBizImpl;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.util.Paging;

@WebServlet("/qna.do")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnaController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		QnaBoardBiz qnaboardbiz = new QnaBoardBizImpl();
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		HttpSession session = request.getSession();
		MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");
		
		if (command.equals("qna")) {
			int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = qnaboardbiz.getAllCount();

			paging.setTotalcount(count);
			paging.setPage(page);

			List<QnaBoardDto> qnaboardlist = qnaboardbiz.selectAllMember(paging);

			request.setAttribute("qnaboardlist", qnaboardlist);
			request.setAttribute("paging", paging);

			dispatch("fntqna.jsp", request, response);
		} else if (command.equals("qnadetail")) {
			int qbboardno = Integer.parseInt(request.getParameter("qbboardno"));
			
			QnaBoardDto qnaboardlistone = qnaboardbiz.selectOne(qbboardno);
			System.out.println("dd" +qnaboardlistone.getQbid());
			
			request.setAttribute("qnaboardlistone", qnaboardlistone);
			
			dispatch("fntqnadetail.jsp", request, response);
		} else if (command.equals("qnadelete")) {
			int qbboardno = Integer.parseInt(request.getParameter("qbboardno"));
			
			int res = qnaboardbiz.delete(qbboardno);
			
			if (res > 0) {
				response.sendRedirect("qna.do?command=qna");
			} else {
				response.sendRedirect("qna.do?command=qna");
			}
		} else if (command.equals("qnainsert")) {
			response.sendRedirect("fntqnainsert.jsp");
		} else if (command.equals("qnainsertres")) {
			String id = request.getParameter("id");
			String qbtitle = request.getParameter("qbtitle");
			String qbcontent = request.getParameter("qbcontent");
			String qbsecret = request.getParameter("qbsecret");
			
			if (qbsecret == null) {
				qbsecret = "N";
			}
			
			System.out.println("시크릿 값" + qbsecret);
			
			int res = qnaboardbiz.insert(new QnaBoardDto(0,id,memberdto.getMembernickname(),0,0,0,qbtitle,qbcontent,qbsecret,null));
			
			if (res > 0) {
				response.sendRedirect("qna.do?command=qna");
			} else {
				response.sendRedirect("qna.do?command=qna");
			}
			
			
			
		}
	}
	
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);

		dispatch.forward(request, response);
	}

}
