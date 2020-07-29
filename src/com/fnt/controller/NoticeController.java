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

import com.fnt.model.biz.NoticeBoardBiz;
import com.fnt.model.biz.impl.NoticeBoardBizImpl;
import com.fnt.model.dao.NoticeBoardDao;
import com.fnt.model.dao.impl.NoticeBoardDaoImpl;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.util.Paging;

@WebServlet("/notice.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("html/text; charset=UTF-8");

		NoticeBoardBiz noticeboardbiz = new NoticeBoardBizImpl();

		String command = request.getParameter("command");
		System.out.println(command);
		HttpSession session = request.getSession();

		NoticeBoardDao dao = new NoticeBoardDaoImpl();
		
		MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");

		if (command.equals("notice")) {
			int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = noticeboardbiz.getAllCount();

			paging.setTotalcount(count);
			paging.setPage(page);

			List<NoticeBoardDto> noticeboardlist = noticeboardbiz.selectAllMember(paging);

			request.setAttribute("noticeboardlist", noticeboardlist);
			request.setAttribute("paging", paging);

			dispatch("fntnotice.jsp", request, response);

		} else if (command.equals("noticeinsert")) {
			response.sendRedirect("fntnoticeinsert.jsp");

		} else if (command.equals("noticeinsertres")) {
			String id = request.getParameter("id");
			String nbtitle = request.getParameter("nbtitle");
			String nbcontent = request.getParameter("nbcontent");

			int res = noticeboardbiz
					.insert(new NoticeBoardDto(0, id, memberdto.getMembernickname(), nbtitle, nbcontent, null));

			if (res > 0) {
				response.sendRedirect("notice.do?command=notice");
			} else {
				response.sendRedirect("notice.do?command=notice");
			}
		} else if (command.equals("noticedetail")) {
			int nbboardno = Integer.parseInt(request.getParameter("nbboardno"));

			NoticeBoardDto noticeboardlistone = noticeboardbiz.selectOne(nbboardno);

			request.setAttribute("noticeboardlistone", noticeboardlistone);

			dispatch("fntnoticedetail.jsp", request, response);

		} else if (command.equals("noticedelete")) {
			int nbboardno = Integer.parseInt(request.getParameter("nbboardno"));

			int res = noticeboardbiz.delelte(nbboardno);

			if (res > 0) {
				response.sendRedirect("notice.do?command=notice");
			} else {
				response.sendRedirect("notice.do?command=notice");
			}
		} else if (command.equals("noticeupdate")) {
			int nbboardno = Integer.parseInt(request.getParameter("nbboardno"));

			NoticeBoardDto noticeboardlistone = noticeboardbiz.selectOne(nbboardno);

			request.setAttribute("noticeboardlistone", noticeboardlistone);

			dispatch("fntnoticeupdate.jsp", request, response);
		} else if (command.equals("noticeupdateres")) {
			int nbboardno = Integer.parseInt(request.getParameter("nbboardno"));
			String nbtitle = request.getParameter("nbtitle");
			String nbcontent = request.getParameter("nbcontent");
			
			int res = noticeboardbiz
					.update(new NoticeBoardDto(nbboardno, null, null, nbtitle, nbcontent, null));
			
			if (res > 0) {
				response.sendRedirect("notice.do?command=noticedetail&nbboardno="+nbboardno);
			} else {
				response.sendRedirect("notice.do?command=noticedetail&nbboardno="+nbboardno);
			}
		}else if(command.equals("searchnotice")) {
			String searchnotice = request.getParameter("searchnotice");
			int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = dao.getSearchCount(searchnotice);

			paging.setTotalcount(count);
			paging.setPage(page);
			
			List<NoticeBoardDto> list = dao.searchlist(searchnotice,paging);
			request.setAttribute("paging", paging);
			request.setAttribute("searchnotice", searchnotice);
			request.setAttribute("noticeboardlist", list);
			dispatch("fntnotice.jsp", request, response);
		}
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);

		dispatch.forward(request, response);
	}

}
