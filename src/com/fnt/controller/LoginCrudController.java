package com.fnt.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.fnt.model.biz.AlertBiz;
import com.fnt.model.biz.impl.AlertBizImpl;
import com.fnt.model.dao.LoginCrudDao;
import com.fnt.model.dao.impl.LoginCrudDaoImpl;
import com.fnt.model.dto.MemberDto;
import com.google.gson.Gson;

  

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
			
			System.out.println("로그인컨트롤러에서 id : " + memberid);
			
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
			
			
		jsResponse("FNT ID 찾기 페이지로 이동!", "fntlogincrudsearchid.jsp", response);;
			
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
			jsResponse("FNT PW 찾기 페이지로 이동!", "fntlogincrudsearchpw.jsp", response);
		}else if(command.equals("searchpw")) {
			String memberid = request.getParameter("id");
			String membername = request.getParameter("name");
			String memberemail = request.getParameter("email");
			
			
			MemberDto dto = dao.searchPw(memberid, membername, memberemail);
			
			if(dto != null) {
				request.setAttribute("dto", dto);
				dispatch("fntlogincrudsearchpwres.jsp", request, response);
			}else {
				jsResponse("잘못된 정보 입니다", "fntlogincrudsearchpw.jsp", response);
			}
		}else if(command.equals("cruddetail")) {
			
			
			MemberDto dto = (MemberDto) session.getAttribute("memberdto");
			
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
			
			MemberDto dto = dao.selectOne(memberid);
			dto.setMemberpw(memberpw);
			dto.setMemberpwchk(memberpw);
			dto.setMemberemail(memberemail);
			int res = dao.update(dto);
			
			session.setAttribute("memberdto", dto);
			
			if(res > 0) {
				jsResponse("내 정보 수정 성공!", "LoginCrudController?command=cruddetail", response);
			//	dispatch("fntcrudmypage.jsp", request, response);
			}else {
				jsResponse("내 정보 수정 실패", "LoginCrudController?command=crudupdate", response);
			}
			
			
		}else if(command.equals("outmember")) {
			String memberid = request.getParameter("memberid");
			String memberenabled = request.getParameter("memberenabled");
			
			
			
			int res = dao.updateoutmember(new MemberDto(memberid, null,null ,null ,null ,null ,null ,null,null,null , memberenabled,null));
			
			if(res > 0) {
				session.invalidate();
				jsResponse("회원 탈퇴가 성공되었습니다.", "fntmain.jsp", response);
			}else {
				jsResponse("회원 탈퇴 실패 ", "LoginCrudController?command=crudupdate", response);
			}
		}else if(command.equals("main")) {
			dispatch("fntmain.jsp", request, response);
			//메일 보내기 
		}else if(command.equals("emailchk")) {
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
		          
		            
		             
		        }catch (AddressException addr_e) {
		            addr_e.printStackTrace();
		        }catch (MessagingException msg_e) {
		            msg_e.printStackTrace();
		        }
		        // 위의코드는 우리가 받아온 이메일에 난수를 보내주는 코드
		        
		        
		        PrintWriter out = response.getWriter();
		        out.print("1");
		        // else if문이 실행이 되고나서
		        // out.print 괄호안에있는 값을 
		        // ajax function 괄호안에있는 데이타에 넘겨준다.
		        
		        
		} else if (command.equals("real")) {
			
			
			
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			MemberDto dto = dao.findId(email, name);
			// null을 검사해줄때는
			// 만약 dto가 null이면 dto.get으로 불러오는 함수들은 전부 nullpoint에러남
			// 그것을 방지하기 위해서 dto.get의 null을 검사하는게 아니라
			// dto 객체 자체의 null값을 검사해야함
			
			// 존재하지 않는 or 비회원같은것을 검사할때는 꼭 dto의 객체의 null을 검사하자.
			if(dto != null) {
			String id = dto.getMemberid();
			PrintWriter out = response.getWriter(); 
			out.print(id);
			/*
			 * JSONObject ob = new JSONObject(); ob.put("id", id); Gson gson = new Gson();
			 * String jsonPlace = gson.toJson(ob); System.out.println(jsonPlace);
			 * PrintWriter out = response.getWriter(); out.print(jsonPlace);
			 */
			} else {
				PrintWriter out = response.getWriter(); 
				out.print("1");
			}
		}else if(command.equals("findpw")) {
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
		            		+ "비밀번호를 찾기 위한 인증번호 입니다. 정확하게 입력해 주세요!\n", "UTF-8");
		             
		            // 이메일 내용 

		            String code = request.getParameter("code_check"); //인증번호 값 받기
		            request.setAttribute("code", code);
		            msg.setText(code, "UTF-8");
		             
		            // 이메일 헤더 
		            msg.setHeader("content-Type", "text/html");
		             
		            //메일보내기
		            javax.mail.Transport.send(msg);
		          
		            
		             
		        }catch (AddressException addr_e) {
		            addr_e.printStackTrace();
		        }catch (MessagingException msg_e) {
		            msg_e.printStackTrace();
		        }
		        // 위의코드는 우리가 받아온 이메일에 난수를 보내주는 코드
		        
		        
		        PrintWriter out = response.getWriter();
		        out.print("2");
		        // else if문이 실행이 되고나서
		        // out.print 괄호안에있는 값을 
		        // ajax function 괄호안에있는 데이타에 넘겨준다.
		}else if(command.equals("real2")) {
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			MemberDto dto = dao.findPw(id, email);
			
			// null을 검사해줄때는
			// 만약 dto가 null이면 dto.get으로 불러오는 함수들은 전부 nullpoint에러남
			// 그것을 방지하기 위해서 dto.get의 null을 검사하는게 아니라
			// dto 객체 자체의 null값을 검사해야함
			
			// 존재하지 않는 or 비회원같은것을 검사할때는 꼭 dto의 객체의 null을 검사하자.
			if(dto != null) {
			String pw = dto.getMemberpw();
			PrintWriter out = response.getWriter(); 
			out.print(pw);
			/*
			 * JSONObject ob = new JSONObject(); ob.put("id", id); Gson gson = new Gson();
			 * String jsonPlace = gson.toJson(ob); System.out.println(jsonPlace);
			 * PrintWriter out = response.getWriter(); out.print(jsonPlace);
			 */
			} else {
				PrintWriter out = response.getWriter(); 
				out.print("2");
			}
		}else if(command.equals("updatepw")) {
			String memberid = request.getParameter("memberid");
			
			request.setAttribute("memberid", memberid);
			System.out.println("컨트롤러에서 memberid : "+memberid);
			dispatch("fntcrudupdatepw.jsp", request, response);
		}else if(command.equals("updatepwres")) {
			String memberid = request.getParameter("memberid");
			String memberpw = request.getParameter("memberpw");
			String memberpwchk = request.getParameter("memberpwchk");
			System.out.println("id : " + memberid);
			System.out.println("pw : "+memberpw + "pwchk : " + memberpwchk);
			MemberDto dto = new MemberDto();
			int res = dao.updatepw(memberpw, memberpwchk,memberid);
			
			if(res > 0) {
				jsResponse("비밀번호 변경 완료! \\n 로그인 페이지로 이동합니다!", "fntlogincrud.jsp", response);
				//가끔 alert에서 역슬래쉬 하나 안먹을 때, 있으니까 안되면 꼭 2번 써보자!!!
			}else {
				jsResponse("비밀번호가 맞는지 확인해주세요!", "LoginCrudController?command=updatepw", response);
			}
		} else if(command.equals("report")) {
			String membernickname = request.getParameter("membernickname");
			System.out.println("컨트롤러에서 nick : " + membernickname);
			request.setAttribute("membernickname", membernickname);
			dispatch("fntreportform.jsp", request, response);
		} else if(command.equals("reportform")) {
			//신고당한 사람의 닉네임
			String membernickname = request.getParameter("membernickname");
			String reporttitle = request.getParameter("reporttitle");
			String reportcontent = request.getParameter("reportcontent");
			
			//신고당한 사람의 닉네임으로 id를 가져와서 String에 담아줌.
			MemberDto memberdto = dao.receivenickname(membernickname);
			String receiveid = memberdto.getMemberid();
			
			
			//로그인한 아이디를 가져오기 위한 객체생성
			MemberDto memberdto1 = (MemberDto)session.getAttribute("memberdto");
			String sendid = memberdto1.getMemberid();
			String sendnickname = memberdto1.getMembernickname();
			int res = dao.reportinsert(membernickname, reporttitle, reportcontent, receiveid, sendid, sendnickname);
			
			PrintWriter out = response.getWriter();
			String msg = "신고 접수가 완료되었습니다.";
			out.append("<script type='text/javascript'>" + 
					"alert('" + msg + "');" +
					"self.close();" +
					"</script>");
			
			
			
			
		}else if(command.equals("report2")) {
			String membernickname = request.getParameter("membernickname");
			System.out.println("컨트롤러에서 nick : " + membernickname);
			request.setAttribute("membernickname", membernickname);
			dispatch("fntreportform2.jsp", request, response);
		}else if(command.equals("reportform2")) {
			//신고당한 사람의 닉네임
			String membernickname = request.getParameter("membernickname");
			String reporttitle = request.getParameter("reporttitle");
			String reportcontent = request.getParameter("reportcontent");
			
			//신고당한 사람의 닉네임으로 id를 가져와서 String에 담아줌.
			MemberDto memberdto = dao.receivenickname(membernickname);
			String receiveid = memberdto.getMemberid();
			
			
			//로그인한 아이디를 가져오기 위한 객체생성
			MemberDto memberdto1 = (MemberDto)session.getAttribute("memberdto");
			String sendid = memberdto1.getMemberid();
			String sendnickname = memberdto1.getMembernickname();
			int res = dao.reportinsert(membernickname, reporttitle, reportcontent, receiveid, sendid, sendnickname);
			
			PrintWriter out = response.getWriter();
			String msg = "신고 접수가 완료되었습니다.";
			out.append("<script type='text/javascript'>" + 
					"alert('" + msg + "');" +
					"self.close();" +
					"</script>");
		}
		
	
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
