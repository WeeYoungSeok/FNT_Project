package com.fnt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fnt.model.biz.AlertBiz;
import org.json.simple.JSONObject;
import com.fnt.model.biz.ReplyBiz;
import com.fnt.model.biz.impl.AlertBizImpl;
import com.fnt.model.biz.impl.ReplyBizImpl;
import com.fnt.model.dao.ReplyDao;
import com.fnt.model.dao.impl.ReplyDaoImpl;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.ReplyDto;
import com.google.gson.Gson;

@WebServlet("/reply.do")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      HttpSession session = request.getSession();
      ReplyDao replydao = new ReplyDaoImpl();
      ReplyBiz replybiz = new ReplyBizImpl();
      AlertBiz alertbiz = new AlertBizImpl();
      
      MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");
      
      String command = request.getParameter("command");
      System.out.println("["+command+"]");
      
      /* 댓글 등록*/
      if(command.equals("insertreply")) {
    	  String replyid = memberdto.getMemberid();
    	  String replynickname = request.getParameter("replynickname");
    	  String replytitle = request.getParameter("replytitle");
    	  //replyboardno = dealboardno
    	  //replyid = memberid
    	  int replyboardno = Integer.parseInt(request.getParameter("replyboardno"));
    	  
    	  

    	  ReplyDto replydto = new ReplyDto(replyid, replynickname, replyboardno, replytitle);
    	  
    	  
    	  
    	  //insert를 해준다.
    	  int alertres = alertbiz.insertAlert(new AlertDto(0, replyid, replyboardno, null));
    	  System.out.println("replycontroller에서 받은 alertres : " + alertres);
    	  
    	  //insert에 성공한 selectList를 여기서 출력해서 그 결과값을 fntalert.jsp에
    	  //setAttribute해서 보내고 fntalert.jsp에서 받아서 출력해준다.
    	  //어차피 session에 나의 id가 있으니까(memberid)
    	  //작성자가(memberid) 글작성한사람이고(did) 알람받을 사람이라면 alertid
    	  //3단조인 해야하나??
    	  //근데 did나 alertid 전부 외래키가 memberid야
    	  //int res = replybiz.replyProc(replydto);
    	 
    	 
    	  int res = replydao.insertReply(replydto);
    	  ReplyDto returnReplyDto = null;
    	  returnReplyDto = replydao.selectReply(replydto);
    	  System.out.println("컨트롤러에서 replydto : "+replydto);
    	
			/*
			 * Map<String,Object>map = new HashMap<>(); map.put()
			 */
    	  
    	  JSONObject obj = new JSONObject();
    	  obj.put("replyno", returnReplyDto.getReplyno());
    	  obj.put("replyid", returnReplyDto.getReplyid());
    	  obj.put("replynickname", returnReplyDto.getReplynickname());
    	  obj.put("replyboardno", returnReplyDto.getReplyboardno());
    	  obj.put("replygroupno", returnReplyDto.getReplygroupno());
    	  obj.put("replygroupnoseq", returnReplyDto.getReplygroupnoseq());
    	  obj.put("replytitletab", returnReplyDto.getReplytitletab());
    	  obj.put("replytitle", returnReplyDto.getReplytitle());
    	  obj.put("replyregdate", returnReplyDto.getReplyregdate());
    	  
    	  Gson gson = new Gson();
    	  String gsonobj = gson.toJson(obj);
    	  System.out.println(gsonobj);
    		  
    	  
    	  System.out.println("컨트롤러에서 obj : "+obj);
    	  if(res > 0) {
    		  System.out.println("성공?");
    		 response.getWriter().print(gsonobj);
    		 
    		  
    	  }else {
    		  System.out.println("실패");
    		  response.getWriter().append("FAILD");
    	  }

    	 /* 대댓글 등록 */
      }else if(command.equals("insertRereply")) {
    	  String replyid = memberdto.getMemberid();
    	  String replynickname = request.getParameter("replynickname");
    	  String replytitle = request.getParameter("replytitle");
    	  int replyno = Integer.parseInt(request.getParameter("replyno"));
    	  int replyboardno = Integer.parseInt(request.getParameter("replyboardno"));
    	  
    	  ReplyDto replydto = new ReplyDto(replyno, replyid, replynickname, replyboardno, replytitle);
    	  int res = replybiz.replyProc(replydto);
    	  
    	  ReplyDto returnReplyDto = null;
    	  returnReplyDto = replydao.selectReply(replydto);
    	  
    	  System.out.println("컨트롤러 returnReplyDto : "+returnReplyDto);
    	  
    	  JSONObject obj = new JSONObject();
    	  obj.put("replyno", returnReplyDto.getReplyno());
    	  obj.put("replyid", returnReplyDto.getReplyid());
    	  obj.put("replynickname", returnReplyDto.getReplynickname());
    	  obj.put("replyboardno", returnReplyDto.getReplyboardno());
    	  obj.put("replygroupno", returnReplyDto.getReplygroupno());
    	  obj.put("replygroupnoseq", returnReplyDto.getReplygroupnoseq());
    	  obj.put("replytitletab", returnReplyDto.getReplytitletab());
    	  obj.put("replytitle", returnReplyDto.getReplytitle());
    	  obj.put("replyregdate", returnReplyDto.getReplyregdate());
    	  
    	  Gson gson = new Gson();
    	  String gsonobj = gson.toJson(obj);
    	  
    	  if(res > 0) {
    		  System.out.println("db등록 성공");
     		 response.getWriter().print(gsonobj);
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
