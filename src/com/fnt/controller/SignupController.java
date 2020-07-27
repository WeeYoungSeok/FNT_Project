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
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

import com.fnt.controller.LoginCrudController.MyAuthentication;
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
		
		// id 중복 체크
		} else if (command.equals("idchk")) {
			String id = request.getParameter("id");
			MemberDto memberdto = dao.idchk(id);
			boolean idnotused = true;
			if (memberdto != null) {
				idnotused = false;
			}
			response.sendRedirect("idchk.jsp?idnotused=" + idnotused);
	
		// nickname 중복 체크
		} else if (command.equals("nickchk")) {
			String nick = request.getParameter("nick");
			MemberDto memberdto = dao.nickchk(nick);
			boolean nicknotused = true;
			if (memberdto != null) {
				nicknotused = false;
			}
			response.sendRedirect("nickchk.jsp?nicknotused=" + nicknotused);
			
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
		
		} else if (command.equals("emailchk")) {
			Properties props = System.getProperties();
	        props.put("mail.smtp.user", "구글아이디"); // 서버 아이디만 쓰기
			props.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
	           
	        Authenticator auth = new MyAuthentication();
	         
	        //session 생성 및  MimeMessage생성
	        Session session1 = Session.getDefaultInstance(props, auth);
	        MimeMessage msg = new MimeMessage(session1);
	        String real_code = request.getParameter("code_check");
	       
	        try{
	            //편지보낸시간
	            msg.setSentDate(new Date());
	             
	            InternetAddress from = new InternetAddress("qkrwlsdn496@gmail.com") ;             

	            // 이메일 발신자
	            msg.setFrom(from);           
	             
	            // 이메일 수신자
	            String email = request.getParameter("email"); //사용자가 입력한 이메일 받아오기
	            InternetAddress to = new InternetAddress(email);
	            msg.setRecipient(Message.RecipientType.TO, to);
	             
	            // 이메일 제목
	            msg.setSubject("FNT(Feel New Item)에서 보내는 메일 입니다.\n"
	            		+ "아이디를 찾기 위한 인증번호 입니다. 정확하게 입력해 주세요!\n", "UTF-8");
	             
	            // 이메일 내용 

	            String code = request.getParameter("code_check"); //인증번호 값 받기
	            request.setAttribute("code", code);
	            msg.setText(code, "UTF-8");
	             
	            // 이메일 헤더 
	            msg.setHeader("content-Type", "text/html");
	             
	            //메일보내기
	            javax.mail.Transport.send(msg);
	            real_code= code;
	            
	             
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
	        System.out.println(real_code);
	        request.setAttribute("code", real_code);
	        dispatch("fntsignupformemailchk.jsp", request, response);
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
	
	class MyAuthentication extends Authenticator{
		PasswordAuthentication pa;
		
		public MyAuthentication() {
			String id = "qkrwlsdn496@gmail.com" ; 	//구글 id
			String pw = "dkssud496!"; //구글 비밀번호
			
			//id와 비밀번호를 입력한다.
			pa = new PasswordAuthentication(id, pw);
		}
		//시스템에서 사용하는 인증정보
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}

}
