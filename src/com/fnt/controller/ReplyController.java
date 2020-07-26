package com.fnt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnt.model.biz.ReplyBiz;
import com.fnt.model.biz.impl.ReplyBizImpl;
import com.fnt.model.dao.ReplyDao;
import com.fnt.model.dao.impl.ReplyDaoImpl;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.ReplyDto;

@WebServlet("/reply.do")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      HttpSession session = request.getSession();
      ReplyDao replydao = new ReplyDaoImpl();
      ReplyBiz replybiz = new ReplyBizImpl();
      
      MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");
      
      String command = request.getParameter("command");
      System.out.println("["+command+"]");
      
      if(command.equals("insertreply")) {
    	  String replyid = memberdto.getMemberid();
    	  String replynickname = request.getParameter("replynickname");
    	  String replytitle = request.getParameter("replytitle");
    	  int replyboardno = Integer.parseInt(request.getParameter("replyboardno"));
    	  
    	  ReplyDto replydto = new ReplyDto(replyid, replynickname, replyboardno, replytitle);
    	  
    	  System.out.println("컨트롤러에서 replydto : "+replydto);
    	 
    	  int res = replydao.insertReply(replydto);
    //	  int res = replybiz.replyProc(replydto);
    	 
    	  if(res > 0) {
    		  response.getWriter().append("COMPLETE");
    	  }else {
    		  response.getWriter().append("FAILD");
    	  }

    	  
      }
      
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
   public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	      RequestDispatcher dispatch = request.getRequestDispatcher(url);
	      dispatch.forward(request, response);
	   }

   public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
      String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
            + "</script>";

      response.getWriter().append(s);
   }

}
