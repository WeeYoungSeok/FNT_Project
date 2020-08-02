package com.fnt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fnt.model.biz.AlertBiz;
import com.fnt.model.biz.MyPageBiz;
import com.fnt.model.biz.impl.AlertBizImpl;
import com.fnt.model.biz.impl.MyPageBizImpl;
import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dao.InvoiceDao;
import com.fnt.model.dao.impl.DealBoardDaoImpl;
import com.fnt.model.dao.impl.InvoiceDaoImpl;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.OrderlistDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.model.dto.WishlistDto;
import com.google.gson.Gson;

import net.sf.json.JSONException;


@WebServlet("/mypage.do")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MypageController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		
		//세션 객체 만들어준다.
		HttpSession session = request.getSession();
		
		
		MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
		MyPageBiz mypagebiz = new MyPageBizImpl();
		AlertBiz alertbiz = new AlertBizImpl();
		DealBoardDao dealboarddao = new DealBoardDaoImpl();
		InvoiceDao invoicedao = new InvoiceDaoImpl();
		
		
		//알람창뜨게하기
		if(command.equals("alert")) {
			String memberid = request.getParameter("memberid");
			List<AlertDto> alertlist = new ArrayList<>();
			alertlist = alertbiz.AlertList(memberid);
			
			
			JSONObject obj = new JSONObject();
			try {
				JSONArray jArray = new JSONArray();
			 
			for(int i = 0; i < alertlist.size(); i++) {
				
				JSONObject sObject = new JSONObject();
				sObject.put("dtitle",alertlist.get(i).getDealboarddto().getDtitle());
				sObject.put("alertno",alertlist.get(i).getAlertno()); 
				sObject.put("dnickname",alertlist.get(i).getDealboarddto().getDnickname());
				sObject.put("dboardno",alertlist.get(i).getDealboarddto().getDboardno());
				sObject.put("alertboardno",alertlist.get(i).getAlertboardno()); 
				jArray.add(sObject);
				
			}
			
			obj.put("ALERTLIST", jArray);
			
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
			Gson gson = new Gson();
			String jsonPlace = gson.toJson(obj);
			
			System.out.println("controller에서 ajax로 보내기 전 : " + jsonPlace);
			//request.setAttribute("alertlist", alertlist);
			
			
			PrintWriter out = response.getWriter();
			out.print(jsonPlace);
			
			 
			
			//request.setAttribute("alertlist", alertlist);
			//dispatch("fntalert.jsp", request, response);
			
			
			//request.setAttribute("alertlist", alertlist);
		}
		
		//마이페이지
		if(command.equals("mypage")) {
			//fntmain.jsp에서 로그인하고 닉네임을 클릭했을 때에 memberid가 넘어오고
			//그 값을 받아서 sell list출력하고 담고 fntmypagesell.jsp에 보내준다.
			if(memberdto.getMemberrole().equals("USER")) {
				String memberid = request.getParameter("memberid");
				
				List<DealBoardDto> selllist = new ArrayList<DealBoardDto>();
				selllist = mypagebiz.Selllist(memberid);
				
				
				request.setAttribute("selllist", selllist);
				dispatch("fntmypagesell.jsp", request, response);
			} else if(memberdto.getMemberrole().equals("ADMIN")) {
				response.sendRedirect("admin.do?command=adminpage");
			}
		}else if(command.equals("buylist")) {
			//내가 쓴 구매글 클릭 시
			String memberid = request.getParameter("memberid");
			
			List<DealBoardDto> buylist = new ArrayList<DealBoardDto>();
			buylist = mypagebiz.Buylist(memberid);
			
			request.setAttribute("buylist", buylist);
			dispatch("fntmypagebuy.jsp", request, response);
			
		}else if(command.equals("qnalist")) {
			//내가 쓴 문의글 클릭 시
			String memberid = request.getParameter("memberid");
			
			List<QnaBoardDto> qnalist = new ArrayList<QnaBoardDto>();
			qnalist = mypagebiz.Qnalist(memberid);
			
			request.setAttribute("qnalist", qnalist);
			dispatch("fntmypageqna.jsp", request, response);
			
		}else if(command.equals("wishlist")) {
			//내가 찜한 상품 클릭 시
			String memberid = request.getParameter("memberid");
			
			List<WishlistDto> wishlist = null;
			wishlist = mypagebiz.Wishlist(memberid);
						
			request.setAttribute("wishlist", wishlist);
			dispatch("fntmypagewish.jsp", request, response);
			
			
		}else if(command.equals("orderlist")) {
			String memberid = request.getParameter("memberid");
			
			List<OrderlistDto> orderlist = null;
			orderlist = mypagebiz.Orderlist(memberid);
			
			request.setAttribute("orderlist", orderlist);
			dispatch("fntmypageorder.jsp", request, response);
			
			//내가 주문한 상품 클릭 시
		}else if(command.equals("invoicechk")) {
			response.sendRedirect("fntinvoicecheck.jsp");
		} else if(command.equals("invoiceinsert")) {
			String invoice = request.getParameter("invoice");
			System.out.println("마이페이지에서 받아온 invoice : "+invoice);
			int olboardno = Integer.parseInt(request.getParameter("olboardno"));
			System.out.println("마이페이지컨트롤러에서 받아온 olboardno : " + olboardno);
			DealBoardDto dealboarddto = dealboarddao.selectDetail(olboardno);
			String membernickname = dealboarddto.getDnickname();
			System.out.println("마이페이지컨트롤로에서 로그인 한 id출력 : " + membernickname);
			
			int updateinvoice = invoicedao.updateinvoice(invoice, membernickname, olboardno);
			System.out.println("마이페이지에서 받아온 invoice로 mapper실행한 결과값 : " + updateinvoice);
			
			jsResponse("송장번호 입력성공", "fntmain.jsp", response);
		} else if(command.equals("changesellflag")) {
			//구매확정 글 눌렀을 때 넘어오는 command
			int dboardno = Integer.parseInt(request.getParameter("dboardno"));
			System.out.println("mypagecontroller에서 받아온 changesellflag : "+ dboardno);
			int changesellflag = dealboarddao.changesellflag(dboardno);
			System.out.println("mypagecontroller에서 update를 성공한 결과값 : " + changesellflag);
			jsResponse("구매확정이 완료되었습니다.", "mypage.do?command=orderlist&memberid="+ memberdto.getMemberid(), response);
			
		}
		
	}
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);

		dispatch.forward(request, response);
	}
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {

		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href = '" + url + "';"
				+ "</script>";

		PrintWriter out = response.getWriter();
		out.append(s);
	}

}
