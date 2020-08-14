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
import com.fnt.model.dao.QnaBoardDao;
import com.fnt.model.dao.impl.QnaBoardDaoImpl;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.util.Paging;

@WebServlet("/qna.do")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QnaController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		QnaBoardBiz qnaboardbiz = new QnaBoardBizImpl();
		QnaBoardDao dao = new QnaBoardDaoImpl();
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");
		if (command.equals("qna")) {
			int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = qnaboardbiz.getAllCount();

			paging.setPage(page);
			paging.setTotalcount(count);

			List<QnaBoardDto> qnaboardlist = qnaboardbiz.selectAllMember(paging);

			request.setAttribute("qnaboardlist", qnaboardlist);
			request.setAttribute("paging", paging);

			dispatch("fntqna.jsp", request, response);
		} else if (command.equals("qnadetail")) {
			int qbboardno = Integer.parseInt(request.getParameter("qbboardno"));

			QnaBoardDto qnaboardlistone = qnaboardbiz.selectOne(qbboardno);

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


			int res = qnaboardbiz.insert(new QnaBoardDto(0, id, memberdto.getMembernickname(), qbtitle, qbcontent,
					qbsecret, null, null, null));

			if (res > 0) {
				response.sendRedirect("qna.do?command=qna");
			} else {
				response.sendRedirect("qna.do?command=qna");
			}

		} else if (command.equals("qnarecomment")) {
			
			int qbboardno = Integer.parseInt(request.getParameter("qbboardno"));

			QnaBoardDto qnaboardlistone = qnaboardbiz.selectOne(qbboardno);

			request.setAttribute("qnaboardlistone", qnaboardlistone);
			
			dispatch("fntqnarecomment.jsp", request, response);
		} else if (command.equals("qnarecommnetres")) {
			int qbboardno = Integer.parseInt(request.getParameter("qbboardno"));
			String qbcontent = request.getParameter("qbcontent");
			
			int res = qnaboardbiz.recomment(new QnaBoardDto(qbboardno,null,null,null,qbcontent,null,null,null,null));
			
			if(res > 0) {
				response.sendRedirect("qna.do?command=qnadetail&qbboardno="+qbboardno);
			} else {
				response.sendRedirect("qna.do?command=qnadetail&qbboardno="+qbboardno);
			}
		} else if (command.equals("qnaupdate")) {
			int qbboardno = Integer.parseInt(request.getParameter("qbboardno"));

			QnaBoardDto qnaboardlistone = qnaboardbiz.selectOne(qbboardno);

			request.setAttribute("qnaboardlistone", qnaboardlistone);
			
			dispatch("fntqnaupdate.jsp", request, response);
		} else if (command.equals("qnaupdateres")) {
			int qbboardno = Integer.parseInt(request.getParameter("qbboardno"));
			String qbtitle = request.getParameter("qbtitle");
			String qbcontent = request.getParameter("qbcontent");
			
			int res = qnaboardbiz.update(new QnaBoardDto(qbboardno, null, null, qbtitle, qbcontent, null, null, null, null));
			
			if (res > 0) {
				response.sendRedirect("qna.do?command=qnadetail&qbboardno="+qbboardno);
			} else {
				response.sendRedirect("qna.do?command=qnadetail&qbboardno="+qbboardno);
			}
		} else if (command.equals("qnadelete")) {
			
		}else if(command.equals("searchqna")) {
			String searchqna = request.getParameter("searchqna");
			String selectlist = request.getParameter("selectlist");
			
			if(selectlist.equals("T")) {
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.getTitleCount(searchqna);

				paging.setPage(page);
				paging.setTotalcount(count);
				List<QnaBoardDto> list = dao.searchList(searchqna,paging);
				request.setAttribute("paging", paging);
				request.setAttribute("qnaboardlist", list);
				request.setAttribute("selectlist", selectlist);
				request.setAttribute("searchqna", searchqna);
				
				dispatch("fntqna.jsp", request, response);
				
			}else {
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.getWriterCount(searchqna);

				paging.setPage(page);
				paging.setTotalcount(count);
				List<QnaBoardDto> list = dao.searchWriter(searchqna,paging);
				request.setAttribute("paging", paging);
				request.setAttribute("qnaboardlist", list);
				request.setAttribute("selectlist", selectlist);
				request.setAttribute("searchqna", searchqna);
				
				dispatch("fntqna.jsp", request, response);
			}
			
		}
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);

		dispatch.forward(request, response);
	}

}
