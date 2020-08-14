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
import com.fnt.model.biz.ReplyBiz;
import com.fnt.model.biz.impl.AlertBizImpl;
import com.fnt.model.biz.impl.ReplyBizImpl;
import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dao.ReplyDao;
import com.fnt.model.dao.impl.DealBoardDaoImpl;
import com.fnt.model.dao.impl.ReplyDaoImpl;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;
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
      AlertBiz alertbiz = new AlertBizImpl();
      DealBoardDao dealboarddao = new DealBoardDaoImpl();
      
      MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");
      
      String command = request.getParameter("command");
      System.out.println("["+command+"]");
      
      /* 댓글 등록*/
      if(command.equals("insertreply")) {
    	 if(memberdto == null) {
    		 jsResponse("로그인 해주세요", "fntlogincrud.jsp", response);
    	 }
         String replyid = memberdto.getMemberid();
         String replynickname = request.getParameter("replynickname");
         String replytitle = request.getParameter("replytitle");
         //replyboardno = dealboardno
         //replyid = memberid
         int replyboardno = Integer.parseInt(request.getParameter("replyboardno"));
         

         ReplyDto replydto = new ReplyDto(replyid, replynickname, replyboardno, replytitle);
         
         //댓글을 달았을 때 ALERT테이블에 INSERT해주는 것.
         DealBoardDto dealboarddto1 = dealboarddao.selectDetail(replyboardno);
         String alertid = dealboarddto1.getDid();
         int alertres = alertbiz.insertAlert(new AlertDto(0, alertid, replyboardno, "Y"));
         //insert에 성공한 selectList를 여기서 출력해서 그 결과값을 fntalert.jsp에
         //setAttribute해서 보내고 fntalert.jsp에서 받아서 출력해준다.
         //어차피 session에 나의 id가 있으니까(memberid)
         //작성자가(memberid) 글작성한사람이고(did) 알람받을 사람이라면 alertid
         //3단조인 해야하나??
         //근데 did나 alertid 전부 외래키가 memberid야
         //int res = replybiz.replyProc(replydto);
        
        
         int res = replydao.insertReply(replydto);
			/*
			 * ReplyDto returnReplyDto = null; List<ReplyDto> list =
			 * replydao.selectReply(replydto);
			 * 
			 * JSONObject obj = new JSONObject(); obj.put("replyno",
			 * list.get(list.size()-1).getReplyno()); obj.put("replyid",
			 * list.get(list.size()-1).getReplyid()); obj.put("replynickname",
			 * list.get(list.size()-1).getReplynickname()); obj.put("replyboardno",
			 * list.get(list.size()-1).getReplyboardno()); obj.put("replygroupno",
			 * list.get(list.size()-1).getReplygroupno()); obj.put("replygroupnoseq",
			 * list.get(list.size()-1).getReplygroupnoseq()); obj.put("replytitletab",
			 * list.get(list.size()-1).getReplytitletab()); obj.put("replytitle",
			 * list.get(list.size()-1).getReplytitle()); obj.put("replyregdate",
			 * list.get(list.size()-1).getReplyregdate());
			 * 
			 * Gson gson = new Gson(); String gsonobj = gson.toJson(obj);
			 * 
			 * if(res > 0) { response.getWriter().print(gsonobj);
			 * 
			 * }else { response.getWriter().append("FAILD"); }
			 */
         
         DealBoardDto dealboarddto = dealboarddao.selectDetail(replyboardno);
         if(dealboarddto.getDflag().equals("B")) {
        	 if(res>0) {
        		 jsResponse("등록되었습니다", "dealboard.do?command=detailboard&dboardno="+replyboardno, response);
        	 } else {
        		 jsResponse("등록실패", "dealboard.do?command=detailboard&dboardno="+replyboardno, response);
        	 }
        	 
         }else {
        	 if(res>0) {
        		 jsResponse("등록되었습니다", "dealboard.do?command=detailsaleboard&dboardno="+replyboardno, response);
        	 }else {
        		 jsResponse("등록실패", "dealboard.do?command=detailsaleboard&dboardno="+replyboardno, response);
        	 }
         }
         
         
         
        

        /* 대댓글 등록 */
      }else if(command.equals("insertRereply")) {
         if(memberdto == null) {
    		 jsResponse("로그인 해주세요", "fntlogincrud.jsp", response);
    	 }
         String replyid = memberdto.getMemberid();
         String replynickname = request.getParameter("replynickname");
         String replytitle = request.getParameter("rereplytitle");
        
         int replyno = Integer.parseInt(request.getParameter("replyno"));
         int replyboardno = Integer.parseInt(request.getParameter("replyboardno"));
         
         ReplyDto replydto = new ReplyDto(replyno, replyid, replynickname, replyboardno, replytitle);
         
         int res = replybiz.replyProc(replydto);
         
			/*
			 * List<ReplyDto> list = replydao.selectReply(replydto);
			 * 
			 * for(int i =0; i<list.size(); i++) {
			 * System.out.println(list.get(i).toString()); }
			 * 
			 * JSONObject obj = new JSONObject();
			 * 
			 * obj.put("replyno", list.get(0).getReplyno()); obj.put("replyid",
			 * list.get(0).getReplyid()); obj.put("replynickname",
			 * list.get(0).getReplynickname()); obj.put("replyboardno",
			 * list.get(0).getReplyboardno()); obj.put("replygroupno",
			 * list.get(0).getReplygroupno()); obj.put("replygroupnoseq",
			 * list.get(0).getReplygroupnoseq()); obj.put("replytitletab",
			 * list.get(0).getReplytitletab()); obj.put("replytitle",
			 * list.get(0).getReplytitle()); obj.put("replyregdate",
			 * list.get(0).getReplyregdate());
			 * 
			 * Gson gson = new Gson(); String gsonobj = gson.toJson(obj);
			 * 
			 * if(res > 0) { response.getWriter().print(gsonobj); }else {
			 * response.getWriter().append("FAILD"); }
			 */
         DealBoardDto dealboarddto = dealboarddao.selectDetail(replyboardno);
         if(dealboarddto.getDflag().equals("B")) {
        	 if(res>0) {
        		 jsResponse("등록되었습니다", "dealboard.do?command=detailboard&dboardno="+replyboardno, response);
        	 } else {
        		 jsResponse("등록실패", "dealboard.do?command=detailboard&dboardno="+replyboardno, response);
        	 }
        	 
         }else {
        	 if(res>0) {
        		 jsResponse("등록되었습니다", "dealboard.do?command=detailsaleboard&dboardno="+replyboardno, response);
        	 }else {
        		 jsResponse("등록실패", "dealboard.do?command=detailsaleboard&dboardno="+replyboardno, response);
        	 }
         }
         
         
         /* 댓글 삭제 */
      }else if(command.equals("deletereply")) { //완전 댓글 삭제하는 거
    	  int replyno = Integer.parseInt(request.getParameter("replyno"));
    	  int dboardno = Integer.parseInt(request.getParameter("dboardno"));
    	  
    	  int res = replydao.deletereply(replyno);
    	  
    	  if(res>0) {
    		  jsResponse("삭제 완료", "dealboard.do?command=detailboard&dboardno="+dboardno, response);
    	  }else {
    		  jsResponse("삭제 실패","dealboard.do?command=detailboard&dboardno="+dboardno, response);
    	  }
    	  
      }else if(command.equals("deletereply2")) { // 댓글 groupno를 0으로 만들어서 '삭제된 댓글입니다' 라고 보여주기
    	  int replyno = Integer.parseInt(request.getParameter("replyno"));
    	  int dboardno = Integer.parseInt(request.getParameter("dboardno"));
    	  
    	  int res = replydao.deletereply2(replyno);
          DealBoardDto dealboarddto = dealboarddao.selectDetail(dboardno);
          if(dealboarddto.getDflag().equals("B")) {
         	 if(res>0) {
         		 jsResponse("삭제되었습니다", "dealboard.do?command=detailboard&dboardno="+dboardno, response);
         	 } else {
         		 jsResponse("삭제실패", "dealboard.do?command=detailboard&dboardno="+dboardno, response);
         	 }
         	 
          }else {
         	 if(res>0) {
         		 jsResponse("삭제되었습니다", "dealboard.do?command=detailsaleboard&dboardno="+dboardno, response);
         	 }else {
         		 jsResponse("삭제실패", "dealboard.do?command=detailsaleboard&dboardno="+dboardno, response);
         	 }
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