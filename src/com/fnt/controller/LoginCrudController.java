package com.fnt.controller;

import java.io.IOException;
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



import com.fnt.model.dao.LoginCrudDao;
import com.fnt.model.dao.impl.LoginCrudDaoImpl;
import com.fnt.model.dto.MemberDto;

  

@WebServlet("/LoginCrudController")
public class LoginCrudController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginCrudController() {
    	 
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		LoginCrudDao dao = new LoginCrudDaoImpl();
		
		HttpSession session = request.getSession();
		
		
		if(command.equals("login")) {
			String memberid = request.getParameter("id");
			String memberpw = request.getParameter("pw");
			
			MemberDto memberdto = dao.login(memberid, memberpw);
			
			
			if(memberdto != null) {	//id 랑 pw가 있다면
				session.setAttribute("memberdto", memberdto);
				if(memberdto.getMemberenabled().equals("R")) {
					jsResponse("신고된 회원입니다.카카오 채널로 문의 해주세요.카카오 채널 ID: fnt_5", "fntmain.jsp", response);
					session.invalidate();
				} else if (memberdto.getMemberenabled().equals("N")) {
					jsResponse("탈퇴된 회원입니다.카카오 채널로 문의 해주세요.카카오 채널 ID: fnt_5", "fntmain.jsp", response);
					session.invalidate();
				} else {
					jsResponse(memberdto.getMembernickname() + "님 환영합니다.", "fntmain.jsp", response);
				}
			}else {
				jsResponse("아이디 또는 비밀번호를 확인해주세요", "fntlogincrud.jsp", response);
			}
			//id찾기 눌렀을 때 찾는 폼으로 이동
		}else if(command.equals("logincrudsearchid")) {
			
			
		jsResponse("이동!", "fntlogincrudsearchid.jsp", response);;
			
		}else if(command.equals("logout")) {
			session.invalidate();
			jsResponse("로그아웃 되었습니다.", "fntmain.jsp", response);
		}else if(command.equals("searchid")) {
			
			String membername = request.getParameter("name");
			String memberemail = request.getParameter("email");
			
			
			
			
			MemberDto dto = dao.searchId(membername, memberemail);
			
			if(dto != null) {
				request.setAttribute("dto", dto);
				dispatch("fntlogincrudsearchidres.jsp", request, response);
				
			}else {
				jsResponse("잘못된 정보 입니다", "fntlogincrudsearchid.jsp", response);
			}
			
		}else if(command.equals("logincrudsearchpw")) {
			jsResponse("pw찾기", "fntlogincrudsearchpw.jsp", response);
		}else if(command.equals("searchpw")) {
			String memberid = request.getParameter("id");
			String membername = request.getParameter("name");
			String memberemail = request.getParameter("email");
			String memberphone = request.getParameter("phone");
			
			MemberDto dto = dao.searchPw(memberid, membername, memberemail, memberphone);
			
			if(dto != null) {
				request.setAttribute("dto", dto);
				dispatch("fntlogincrudsearchpwres.jsp", request, response);
			}else {
				jsResponse("잘못된 정보 입니다", "fntlogincrudsearchpw.jsp", response);
			}
		}else if(command.equals("cruddetail")) {
			
			
			MemberDto dto = (MemberDto) session.getAttribute("memberdto");
			System.out.println(dto.toString() + "컨트롤러에서 dto");
			
			dispatch("fntcrudmypage.jsp", request, response);
			//update폼으로 이동
		}else if(command.equals("crudupdate")) {
			String memberid = request.getParameter("memberid");
			request.setAttribute("memberid", memberid);
			dispatch("fntcrudupdate.jsp", request, response);
			//update 하기
		}else if(command.equals("crudupdateres")) {
			String memberpw = request.getParameter("memberpw");
			String memberemail = request.getParameter("memberemail");
			String memberid = request.getParameter("memberid");
			System.out.println("컨트롤러에서 받아온 비밀번호 : " +memberpw +   "컨트롤러에서 받아온 이메일" + memberemail);
			
			MemberDto dto = dao.selectOne(memberid);
			dto.setMemberpw(memberpw);
			dto.setMemberpwchk(memberpw);
			dto.setMemberemail(memberemail);
			System.out.println("컨트롤러에서 dto 값 : "+dto);
			int res = dao.update(dto);
			
			session.setAttribute("memberdto", dto);
			
			if(res > 0) {
				jsResponse("내 정보 수정 성공!", "LoginCrudController?command=cruddetail", response);
			//	dispatch("fntcrudmypage.jsp", request, response);
			}else {
				jsResponse("내 정보 수정 실패ㅜ", "LoginCrudController?command=crudupdate", response);
			}
			
			
		}else if(command.equals("outmember")) {
			String memberid = request.getParameter("memberid");
			String memberenabled = request.getParameter("memberenabled");
			
			
			
			int res = dao.updateoutmember(new MemberDto(memberid, null,null ,null ,null ,null ,null ,null,null,null , memberenabled,null));
			
			if(res > 0) {
				jsResponse("회원 탈퇴가 성공되었습니다.", "LoginCrudController?command=main", response);
			}else {
				jsResponse("회원 탈퇴 실패 ㅠ", "LoginCrudController?command=crudupdate", response);
			}
		}else if(command.equals("main")) {
			dispatch("fntmain.jsp", request, response);
			//메일 보내기 
		}else if(command.equals("emailchk")) {
			Properties props = System.getProperties();
			props.put("mail.smtp.user", "구글아이디");	//서버 아이디만 쓰기
			props.put("mail.smtp.host", "smtp.gmail.com");	//구글 SMTP
			props.put("mail.smtp.prot", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocket Factory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			
			Authenticator auth = new MyAuthentication();
			
			Session session1 = Session.getDefaultInstance(props, auth);
			MimeMessage msg = new MimeMessage(session1);
			
			try {
				msg.setSentDate(new Date());
				
				InternetAddress from = new InternetAddress("보내는 사람");
				
				//이메일 발신자
				msg.setFrom(from);
				
				//이메일 수신자
				String email = request.getParameter("email");	//사용자가 입력한 이메일 받아오기
				
				InternetAddress to = new InternetAddress(email);
				msg.setRecipient(Message.RecipientType.TO, to);
				
				//이메일 제목
				msg.setSubject("비밀번호 인증번호", "UTF-8");
				
				//이메일 내용
				String code = request.getParameter("code_check");	//인증번호 값 받기
				
				request.setAttribute("code", code);
				msg.setText(code, "UTF-8");
				
				//이메일 헤더
				msg.setHeader("content-Type", "text/html");
				
				//메일보내기
				javax.mail.Transport.send(msg);
				System.out.println("보냄!!");
				
			}catch(AddressException addr_e){
				addr_e.printStackTrace();
				
			} catch (MessagingException msg_e) {
				// TODO Auto-generated catch block
				msg_e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("인증번호 확인하는 페이지");
			rd.forward(request, response);
			
		}
           
		
	
	}
	class MyAuthentication extends Authenticator{
		PasswordAuthentication pa;
		
		public MyAuthentication() {
			String id = "구글id" ; 	//구글 id
			String pw = "구글 비밀번호"; //구글 비밀번호
			
			//id와 비밀번호를 입력한다.
			pa = new PasswordAuthentication(id, pw);
		}
		//시스템에서 사용하는 인증정보
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + 
					"alert('" + msg + "');" +
					"location.href='" + url + "';" +
					"</script>";
		
		response.getWriter().append(s);
		 
	}

}
