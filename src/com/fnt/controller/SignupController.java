package com.fnt.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fnt.model.dto.MemberDto;
import com.fnt.model.util.DatetimeUtil;
import com.sun.glass.ui.Window;
import com.sun.javafx.scene.control.skin.Utils;

import javafx.stage.Popup;

import com.fnt.model.dao.SignupDao;
import com.fnt.model.util.DatetimeUtil;
import com.fnt.model.dao.impl.SignupDaoImpl;

@WebServlet("/signup.do")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SignupController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		SignupDao dao = new SignupDaoImpl() ;
		
		HttpSession session = request.getSession();
		
		// 메인 페이지로 보내기
		if (command.contentEquals("main")) {
			response.sendRedirect("fntmain.jsp");
		
		// 회원가입 폼으로 보내기
		} else if (command.equals("signup")) {
			response.sendRedirect("fntsignupform.jsp");
		
		// 아이디 중복 체크
		} else if (command.equals("idchk")) {
			String id = request.getParameter("id");
			MemberDto memberdto = dao.idchk(id);
			boolean idnotused = true;
			if (memberdto != null) {
				idnotused = false;
			}
			response.sendRedirect("idchk.jsp?idnotused=" + idnotused);
			
		// 회원가입 폼에서 member 테이블로 insert
		} else if (command.contentEquals("signupform")) {
			String memberid = request.getParameter("memberid");
			String memberpw = request.getParameter("memberpw");
			String memberpwchk = request.getParameter("memberpwchk");
			String membernickname = request.getParameter("membernickname");
			String membername = request.getParameter("membername");
			String prebirth = request.getParameter("memberbirth");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date memberbirth = null;
			try {
				memberbirth = sdf.parse(prebirth);
			} catch (ParseException e) {
				System.out.println("[error] memberbirth");
				e.printStackTrace();
			}
			
			String memberphone = request.getParameter("memberphone");
			String memberaddr = request.getParameter("memberaddr");
			String memberemail = request.getParameter("memberemail");

			int res = dao.signup(new MemberDto(memberid, memberpw, memberpwchk, membernickname, membername, memberbirth, memberphone, memberaddr, memberemail, null, null, null));
			
			if (res > 0) {
				response.sendRedirect("signup.do?command=main");
			} else {
				dispatch("signup.do?command=signup", request, response);
			}
		
		// 주소 검색
		} else if (command.equals("juso")) {
			PrintWriter out = response.getWriter();
				out.println("<html><body>");
				out.println("<script type=\"text/javascript\">");
				out.println("var popwin = window.open(\"jusotest/jusoPopup.jsp\")");
				out.println("</script>");
				out.println("</body></html>");
		
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
		String s = "<script type='text/javascript'>" + 
				   "alert('" + msg + "');" + 
				   "location.href = '" + url + "';" + 
				   "</script>";
		PrintWriter out = response.getWriter();
		out.append(s);
	}

}
