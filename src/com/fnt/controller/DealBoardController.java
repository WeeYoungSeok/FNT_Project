package com.fnt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnt.model.biz.AlertBiz;
import com.fnt.model.biz.DealBoardBiz;
import com.fnt.model.biz.impl.AlertBizImpl;
import com.fnt.model.biz.impl.DealBoardBizImpl;
import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dao.ReplyDao;
import com.fnt.model.dao.WishlistDao;
import com.fnt.model.dao.impl.DealBoardDaoImpl;
import com.fnt.model.dao.impl.ReplyDaoImpl;
import com.fnt.model.dao.impl.WishlistDaoImpl;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.ReplyDto;
import com.fnt.model.dto.WishlistDto;
import com.fnt.util.Paging;



@WebServlet("/dealboard.do")
@MultipartConfig
public class DealBoardController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      HttpSession session = request.getSession();
      DealBoardDao dao = new DealBoardDaoImpl();
      DealBoardBiz biz = new DealBoardBizImpl();
      WishlistDao wishlistdao = new WishlistDaoImpl();
      ReplyDao replydao = new ReplyDaoImpl();
      AlertBiz alertbiz = new AlertBizImpl();
      
      MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");
      
      String command = request.getParameter("command");
      System.out.println("["+command+"]");
      
   
      if(command.equals("fntsaleboard")) { //판매게시판         
    	  int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = dao.getAllCountS();

			paging.setTotalcount(count);
			paging.setPage(page);

			List<DealBoardDto> list = dao.selectSaleList(paging);

			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			dispatch("fntsaleboard.jsp", request, response);
         
      }else if(command.equals("fntbuyboard")) { //구매게시판
    	  int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = dao.getAllCount();

			paging.setTotalcount(count);
			paging.setPage(page);

			List<DealBoardDto> list = dao.selectBuylist(paging);

			request.setAttribute("list", list);
			request.setAttribute("paging", paging);

			dispatch("fntbuyboard.jsp", request, response);
         
      }else if(command.equals("insertbuyboard")) { //구매글작성form
         response.sendRedirect("fntinsertbuyboardform.jsp");
         
      }else if(command.equals("insertsaleboard")) { //판매글작성form
         response.sendRedirect("fntinsertsaleboardform.jsp");
  

      }else if(command.equals("insertbuyboardres")) { // 구매글 작성완료
         String dtitle = request.getParameter("dtitle"); 
         String dcategory = request.getParameter("dcategory");
         String dcontent = request.getParameter("dcontent");
         int dprice = biz.removecomma((request.getParameter("dprice")));
         
         String memberid = memberdto.getMemberid();
         String membernickname = memberdto.getMembernickname();
         
         DealBoardDto dealboarddto = new DealBoardDto();
         dealboarddto.setDid(memberid);
         dealboarddto.setDnickname(membernickname);
         dealboarddto.setDtitle(dtitle);
         dealboarddto.setDcategory(dcategory);
         dealboarddto.setDcontent(dcontent);
         dealboarddto.setDprice(dprice);
         dealboarddto.setDfilename("None");
         dealboarddto.setDlatitude("0");
         dealboarddto.setDlongitude("0");
         
         
         int res = dao.insertBuyBoard(dealboarddto);
         
         if(res > 0) {
            jsResponse("작성 성공", "dealboard.do?command=fntbuyboard", response);
                  
         }else {
            jsResponse("작성 실패", "dealboard.do?command=insertbuyboard", response);

         }
            
      }else if(command.equals("insertsaleboardres")) { //판매글 작성완료
         String dtitle = request.getParameter("dtitle");
         String dcategory = request.getParameter("dcategory");
         String dcontent = request.getParameter("dcontent");
         int dprice = biz.removecomma((request.getParameter("dprice")));
         String coords = request.getParameter("coords");

         DealBoardDto dealboarddto = new DealBoardDto();

         if(coords.equals("undefined")) {
        	 dealboarddto.setDlongitude("");
             dealboarddto.setDlatitude("");
         }else {
        	 String [] str = coords.split(",");
        	 String dlongitude = str[0].substring(1);
        	 
        	 int last = str[1].length()-1;
        	 String	dlatitude = str[1].substring(0,last);
        	 System.out.println("dlatitude : "+dlatitude);
        	 
        	 dealboarddto.setDlongitude(dlongitude);
        	 dealboarddto.setDlatitude(dlatitude);
         }
         

         String memberid = memberdto.getMemberid();
         String membernickname = memberdto.getMembernickname();
         
         dealboarddto.setDid(memberid);
         dealboarddto.setDnickname(membernickname);
         dealboarddto.setDtitle(dtitle);
         dealboarddto.setDcategory(dcategory);
         dealboarddto.setDcontent(dcontent);
         dealboarddto.setDprice(dprice);
         dealboarddto.setDfilename("none");

         int res = dao.insertSaleBoard(dealboarddto); 
         
         if(res > 0) {
            jsResponse("작성 성공", "dealboard.do?command=fntsaleboard", response);
                  
         }else {
            jsResponse("작성 실패", "dealboard.do?command=insertsaleboard", response);
         }
         
      }else if(command.equals("detailboard")) { // 구매글 자세히보기
         int dboardno = Integer.parseInt(request.getParameter("dboardno"));
         //알람창에서 구매글 자세히보기로 들어왔을 때 alert_flag를 안읽음(Y)에서 읽음(N)으로 변경
         System.out.println("DealBoardController에서 받아온 dboardno" + dboardno);
         int alertres = alertbiz.updateAlert(dboardno);
         System.out.println("DealBoardController에서 처리된 alertres : " + alertres);
         
         DealBoardDto dealboarddto = dao.selectDetail(dboardno);
         List<ReplyDto> replylist = replydao.selectReplyList(dboardno);
         
         
         request.setAttribute("replylist", replylist);
         request.setAttribute("dealboarddto", dealboarddto);
         dispatch("fntdetailboard.jsp", request, response);
         
      }else if(command.equals("deletebuyboard")) { // 구매 글 삭제하기
    	  int dboardno = Integer.parseInt(request.getParameter("dboardno"));
    	  int res = dao.deleteDealBoard(dboardno);
    	  
    	  if(res > 0) {
    		  jsResponse("삭제되었습니다.", "dealboard.do?command=fntbuyboard", response);
    	  }else {
    		  jsResponse("삭제 실패", "dealboard.do?command=detailboard&dboardno="+dboardno, response);
    	  }
      }else if(command.equals("deletesaleboard")) { // 판매 글 삭제하기
    	  int dboardno = Integer.parseInt(request.getParameter("dboardno"));
    	  int res = dao.deleteDealBoard(dboardno);
    	  
    	  if(res > 0) {
    		  jsResponse("삭제되었습니다.", "dealboard.do?command=fntsaleboard", response);
    	  }else {
    		  jsResponse("삭제 실패", "dealboard.do?command=detailboard&dboardno="+dboardno, response);
    	  }
    	  
      }else if(command.equals("updatebuyboard")) { // 구매글 수정하기
    	  int dboardno = Integer.parseInt(request.getParameter("dboardno"));
    	  DealBoardDto dealboarddto = dao.selectDetail(dboardno);
    	  request.setAttribute("dealboarddto", dealboarddto);
    	  
    	  dispatch("fntupdatebuyform.jsp", request, response);
      
      }else if(command.equals("updatebuyboardres")) { //구매글 수정완료
          String dtitle = request.getParameter("dtitle");
          String dcategory = request.getParameter("dcategory");
          String dcontent = request.getParameter("dcontent");
          int dprice = biz.removecomma((request.getParameter("dprice")));
          int dboardno = Integer.parseInt(request.getParameter("dboardno"));
          
          DealBoardDto dealboarddto = new DealBoardDto();
          
          dealboarddto.setDboardno(dboardno);
          dealboarddto.setDtitle(dtitle);
          dealboarddto.setDcategory(dcategory);
          dealboarddto.setDcontent(dcontent);
          dealboarddto.setDprice(dprice);
          
          int res = dao.updateDealBoard(dealboarddto);
          
          if(res > 0) {
              jsResponse("수정되었습니다.", "dealboard.do?command=fntbuyboard", response);
                    
           }else {
              jsResponse("수정되지 않았습니다.", "dealboard.do?command=updatebuyboard&dboardno="+dboardno, response);
           }
          
      }else if(command.equals("detailsaleboard")) { // 판매글 자세히보기
    	  int dboardno = Integer.parseInt(request.getParameter("dboardno"));
    	  //지후 : alert_flag를 y에서 n으로 바꿔주는.
    	  int alertres = alertbiz.updateAlert(dboardno);
    	  DealBoardDto dealboarddto = dao.selectDetail(dboardno);
    	  String memberid="";
    	  if(memberdto == null) {
    		  
    	  }else {
    		 memberid =  memberdto.getMemberid();
    	  }
    	  
    	  String wlsellnickname = dealboarddto.getDnickname();
 
    	  WishlistDto wishlistdto = wishlistdao.selectOneWishlist(memberid, wlsellnickname, dboardno);

    	  request.setAttribute("wishlistdto", wishlistdto);
    	  request.setAttribute("dealboarddto", dealboarddto);
    	  dispatch("fntdetailsaleboard.jsp", request, response);
      }
      
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
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