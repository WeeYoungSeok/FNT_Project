package com.fnt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnt.model.dao.WishlistDao;
import com.fnt.model.dao.impl.WishlistDaoImpl;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.WishlistDto;

@WebServlet("/wishlist.do")
public class WishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      HttpSession session = request.getSession();
      
      String command = request.getParameter("command");
      System.out.println("["+command+"]");
      
      WishlistDao dao = new WishlistDaoImpl();
      MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");
      
      if(command.equals("selectOnewishlist")) {
    	  String wlid = request.getParameter("memberid");
    	  String wlsellnickname = request.getParameter("dnickname");
    	  int wldboardno = Integer.parseInt(request.getParameter("dboardno"));
    	  
    	 int whno= dao.selectOneWishlistBymemberid(wlid, wlsellnickname, wldboardno);
    	  
    	  System.out.println("wishlist컨트롤러에서 dto : "+whno);
    	  
    	  String result = "";
    	  
    	  if(whno==0) {
    		  WishlistDto wishlistdto2 = new WishlistDto(0, wlid, wlsellnickname, wldboardno);
    		  int res = dao.insertWishlist(wishlistdto2);
    		  if(res > 0) {
    			  result = "INSERT";
    		  }
    	  }else {
    		  int res = dao.deleteWishlist(whno);
    		  if(res > 0) {
    			  result = "DELETE";
    		  }
    	  }
    	  
    	  response.getWriter().append(result);
    	  
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
