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

import com.fnt.model.biz.DealBoardBiz;
import com.fnt.model.biz.impl.DealBoardBizImpl;
import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dao.impl.DealBoardDaoImpl;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.MemberDto;


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
      
      String command = request.getParameter("command");
      System.out.println("["+command+"]");
      
   
      if(command.equals("fntsaleboard")) { //판매게시판         
         List<DealBoardDto> list = dao.selectSaleList();
         request.setAttribute("list", list);
         
         dispatch("fntsaleboard.jsp", request, response);
         
      }else if(command.equals("fntbuyboard")) { //구매게시판
         List<DealBoardDto> list = dao.selectBuylist();
         request.setAttribute("list", list);
         
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
         MemberDto memberdto =(MemberDto)session.getAttribute("memberdto");
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
         
         String [] str = coords.split(",");
         String dlongitude = str[0].substring(1);
         
         int last = str[1].length()-1;
         
         String dlatitude = str[1].substring(0,last);
         
         MemberDto memberdto =(MemberDto)session.getAttribute("memberdto");

         String memberid = memberdto.getMemberid();
         String membernickname = memberdto.getMembernickname();
         
         DealBoardDto dealboarddto = new DealBoardDto();
         
         dealboarddto.setDid(memberid);
         dealboarddto.setDnickname(membernickname);
         dealboarddto.setDtitle(dtitle);
         dealboarddto.setDcategory(dcategory);
         dealboarddto.setDcontent(dcontent);
         dealboarddto.setDprice(dprice);
         dealboarddto.setDfilename("none");
         dealboarddto.setDlongitude(dlongitude);
         dealboarddto.setDlatitude(dlatitude);
         

         
         int res = dao.insertSaleBoard(dealboarddto); 
         
         if(res > 0) {
            jsResponse("작성 성공", "dealboard.do?command=fntsaleboard", response);
                  
         }else {
            jsResponse("작성 실패", "dealboard.do?command=insertsaleboard", response);
         }
         
      }else if(command.equals("detailboard")) { // 구매글 자세히보기
         int dboardno = Integer.parseInt(request.getParameter("dboardno"));
         DealBoardDto dealboarddto = dao.selectDetail(dboardno);
         
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
          
      }else if(command.equals("detailsaleboard")) { // 판매글 보기
    	  int dboardno = Integer.parseInt(request.getParameter("dboardno"));
    	  DealBoardDto dealboarddto = dao.selectDetail(dboardno);
    	  
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