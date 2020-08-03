package com.fnt.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.fnt.model.dao.OrderListDao;
import com.fnt.model.dao.ReplyDao;
import com.fnt.model.dao.WishlistDao;
import com.fnt.model.dao.impl.DealBoardDaoImpl;
import com.fnt.model.dao.impl.OrderListDaoImpl;
import com.fnt.model.dao.impl.ReplyDaoImpl;
import com.fnt.model.dao.impl.WishlistDaoImpl;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.OrderlistDto;
import com.fnt.model.dto.ReplyDto;
import com.fnt.model.dto.WishlistDto;
import com.fnt.util.Paging;

@WebServlet("/dealboard.do")
@MultipartConfig
public class DealBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		DealBoardDao dao = new DealBoardDaoImpl();
		DealBoardBiz biz = new DealBoardBizImpl();
		WishlistDao wishlistdao = new WishlistDaoImpl();
		ReplyDao replydao = new ReplyDaoImpl();
		AlertBiz alertbiz = new AlertBizImpl();
		OrderListDao orderlistdao = new OrderListDaoImpl();
		MemberDto memberdto = (MemberDto) session.getAttribute("memberdto");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		if (command.equals("fntsaleboard")) { // 판매게시판
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

		} else if (command.equals("fntbuyboard")) { // 구매게시판
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

		} else if (command.equals("insertbuyboard")) { // 구매글작성form
			response.sendRedirect("fntinsertbuyboardform.jsp");

		} else if (command.equals("insertsaleboard")) { // 판매글작성form
			response.sendRedirect("fntinsertsaleboardform.jsp");

		} else if (command.equals("insertbuyboardres")) { // 구매글 작성완료
			String dtitle = request.getParameter("dtitle");
			String dcategory = request.getParameter("dcategory");
			String dcontent = request.getParameter("dcontent");
			int dprice = biz.removecomma((request.getParameter("dprice")));

			if (memberdto == null) {
				jsResponse("로그인 해주세요", "dealboard.do?command=insertbuyboard", response);
			}

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

			if (res > 0) {
				jsResponse("작성 성공", "dealboard.do?command=fntbuyboard", response);

			} else {
				jsResponse("작성 실패", "dealboard.do?command=insertbuyboard", response);

			}

		} else if (command.equals("insertsaleboardres")) { // 판매글 작성완료
			String dtitle = request.getParameter("dtitle");
			String dcategory = request.getParameter("dcategory");
			String dcontent = request.getParameter("dcontent");
			int dprice = biz.removecomma((request.getParameter("dprice")));
			String coords = request.getParameter("coords");
			String roadname = request.getParameter("roadname");
			
			System.out.println("지도 : "+coords);
			System.out.println("길 이름 : "+roadname);

			DealBoardDto dealboarddto = new DealBoardDto();

			if (coords.equals("undefined")) {
				dealboarddto.setDlongitude("");
				dealboarddto.setDlatitude("");
			} else {
				String[] str = coords.split(",");
				String dlongitude = str[0].substring(1);

				int last = str[1].trim().length()-1;
				
				String dlatitude = str[1].trim().substring(0, last);
				System.out.println("dlatitude :" + dlatitude);

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
			dealboarddto.setDfilename(roadname); //원래 roadname 컬럼 만들어야하는데 일단 dfilename 사용중

			int res = dao.insertSaleBoard(dealboarddto);

			if (res > 0) {
				jsResponse("작성 성공", "dealboard.do?command=fntsaleboard", response);

			} else {
				jsResponse("작성 실패", "dealboard.do?command=insertsaleboard", response);
			}

		} else if (command.equals("detailboard")) { // 구매글 자세히보기
			int dboardno = Integer.parseInt(request.getParameter("dboardno"));
			DealBoardDto dealboarddto = dao.selectDetail(dboardno);
			List<ReplyDto> replylist = replydao.selectReplyList(dboardno);

			request.setAttribute("replylist", replylist);
			request.setAttribute("dealboarddto", dealboarddto);
			
			dispatch("fntdetailboard.jsp", request, response);

		} else if (command.equals("deletebuyboard")) { // 구매 글 삭제하기
			int dboardno = Integer.parseInt(request.getParameter("dboardno"));
			int res = dao.deleteDealBoard(dboardno);
			

			if (res > 0) {
				jsResponse("삭제되었습니다.", "dealboard.do?command=fntbuyboard", response);
			} else {
				jsResponse("삭제 실패", "dealboard.do?command=detailboard&dboardno=" + dboardno, response);
			}
		} else if (command.equals("deletesaleboard")) { // 판매 글 삭제하기
			int dboardno = Integer.parseInt(request.getParameter("dboardno"));
			int res = dao.deleteDealBoard(dboardno);

			if (res > 0) {
				jsResponse("삭제되었습니다.", "dealboard.do?command=fntsaleboard", response);
			} else {
				jsResponse("삭제 실패", "dealboard.do?command=detailboard&dboardno=" + dboardno, response);
			}

		} else if (command.equals("updatebuyboard")) { // 구매글 수정하기
			int dboardno = Integer.parseInt(request.getParameter("dboardno"));
			DealBoardDto dealboarddto = dao.selectDetail(dboardno);
			request.setAttribute("dealboarddto", dealboarddto);

			dispatch("fntupdatebuyform.jsp", request, response);

		} else if (command.equals("updatebuyboardres")) { // 구매글 수정완료
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
			dealboarddto.setDfilename("none");
			dealboarddto.setDlongitude("0");
			dealboarddto.setDlatitude("0");
			

			int res = dao.updateDealBoard(dealboarddto);

			if (res > 0) {
				jsResponse("수정되었습니다.", "dealboard.do?command=fntbuyboard", response);

			} else {
				jsResponse("수정되지 않았습니다.", "dealboard.do?command=updatebuyboard&dboardno=" + dboardno, response);
			}

		} else if (command.equals("detailsaleboard")) { // 판매글 자세히보기
			int dboardno = Integer.parseInt(request.getParameter("dboardno"));
			System.out.println("dealboardcontroller에서 alert_flag를 제대로 출력");
			DealBoardDto dealboarddto = dao.selectDetail(dboardno);
			List<ReplyDto> replylist = replydao.selectReplyList(dboardno);
			String memberid = "";
			String invoice = orderlistdao.selectInvoiceByBoardno(dboardno);
			
			
			if (memberdto == null) {

			} else {
				memberid = memberdto.getMemberid();
			}

			String wlsellnickname = dealboarddto.getDnickname();

			WishlistDto wishlistdto = wishlistdao.selectOneWishlist(memberid, wlsellnickname, dboardno);
			
			request.setAttribute("invoice", invoice);
			request.setAttribute("replylist", replylist);
			request.setAttribute("wishlistdto", wishlistdto);
			request.setAttribute("dealboarddto", dealboarddto);
			dispatch("fntdetailsaleboard.jsp", request, response);
			
		} else if (command.equals("searchdeal")) { // 통합검색
			String searchdeal = request.getParameter("searchdeal");
			String orderlist = request.getParameter("orderlist");
			String categorylist = request.getParameter("categorylist");
			System.out.println(categorylist + " " + orderlist + " " + searchdeal);
			System.out.println("여기옴?");
			int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = dao.getAllCountsearch(searchdeal);
			System.out.println("여기sms?");
			paging.setTotalcount(count);
			paging.setPage(page);

			List<DealBoardDto> list = dao.searchList(searchdeal,paging);
			System.out.println("여기얌");
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);
			request.setAttribute("searchdeal", searchdeal);
			request.setAttribute("orderlist", orderlist);
			request.setAttribute("categorylist", categorylist);

			dispatch("fntsearchdeal.jsp", request, response);
			
		} else if (command.equals("searchlist")) { // 통합검색 연쇄작용

			String orderlist = request.getParameter("orderlist");
			String categorylist = request.getParameter("categorylist");
			
			System.out.println("오더" + orderlist);
			System.out.println("카테" + categorylist);

			List<DealBoardDto> list = null;
			if (orderlist.equals("D") && categorylist.equals("CHECK")) {
				// 전체 출력 DESC
				String searchdeal = request.getParameter("searchdeal");
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("categorylist", categorylist);
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.getAllCountsearch(searchdeal);

				paging.setTotalcount(count);
				paging.setPage(page);

				list = dao.searchList(searchdeal,paging);

				request.setAttribute("paging", paging);
				request.setAttribute("list", list);
				request.setAttribute("searchdeal", searchdeal);

				dispatch("fntsearchdeal.jsp", request, response);
				
			} else if ((orderlist.equals("D")) && (categorylist.equals("F") || categorylist.equals("C")
					|| categorylist.equals("D") || categorylist.equals("A") || categorylist.equals("S"))) {
				// 최근순 + 카테고리 적용 페이징까지
				String searchdeal = request.getParameter("searchdeal");
				System.out.println(searchdeal);
				
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("categorylist", categorylist);
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.getAllCountsearchCate(searchdeal,categorylist);

				paging.setTotalcount(count);
				paging.setPage(page);

				
				
				list = dao.desccate(searchdeal, categorylist , paging);
				request.setAttribute("paging", paging);
				request.setAttribute("list", list);
				request.setAttribute("searchdeal", searchdeal);
				dispatch("fntsearchdeal.jsp", request, response);

			} else if (orderlist.equals("A") && categorylist.equals("CHECK")) {
				// 오래된순 + 전체글 
				String searchdeal = request.getParameter("searchdeal");
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("categorylist", categorylist);
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.getAllCountsearch(searchdeal);

				paging.setTotalcount(count);
				paging.setPage(page);

				list = dao.ascorder(searchdeal,paging);
				
				request.setAttribute("paging", paging);
				request.setAttribute("searchdeal", searchdeal);
				request.setAttribute("list", list);
				dispatch("fntsearchdeal.jsp", request, response);
				
			} else if ((orderlist.equals("A")) && (categorylist.equals("F") || categorylist.equals("C")
					|| categorylist.equals("D") || categorylist.equals("A") || categorylist.equals("S"))) {
				String searchdeal = request.getParameter("searchdeal");
				
				request.setAttribute("orderlist", orderlist);
				request.setAttribute("categorylist", categorylist);
				
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.getAllCountsearchCate(searchdeal,categorylist);

				paging.setTotalcount(count);
				paging.setPage(page);

				System.out.println(searchdeal);
				list = dao.asccate(searchdeal, categorylist, paging);
				request.setAttribute("paging", paging);
				request.setAttribute("list", list);
				request.setAttribute("searchdeal", searchdeal);
				dispatch("fntsearchdeal.jsp", request, response);
			}


		} else if (command.equals("buysearchlist")) { // 구매글 카테고리(페이징 적용)
			String categorylist = request.getParameter("categorylist");
			String search = request.getParameter("search");

			List<DealBoardDto> list = null;
			int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = dao.buyGetAllCount(categorylist);

			paging.setTotalcount(count);
			paging.setPage(page);
			if (categorylist.equals("CHECK")) {
				response.sendRedirect("dealboard.do?command=fntbuyboard");
			} else {
				list = dao.buysearchList(categorylist, paging);
				request.setAttribute("search", search);
				request.setAttribute("categorylist", categorylist);
				request.setAttribute("list", list);
				request.setAttribute("paging", paging);
				dispatch("fntbuyboard.jsp", request, response);
			}
		} else if (command.equals("search")) { // 구매글 검색(페이징 적용)
			String search = request.getParameter("search");
			String selecttw = request.getParameter("selecttw");
			String categorylist = request.getParameter("categorylist");
			List<DealBoardDto> list = null;
			if (selecttw.equals("T")) {
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.buysearchTitleCount(search);

				paging.setTotalcount(count);
				paging.setPage(page);
				list = dao.searchdealtitle(search,paging);
				
				request.setAttribute("categorylist", categorylist);
				request.setAttribute("paging", paging);
				request.setAttribute("list", list);
				request.setAttribute("search", search);
				request.setAttribute("selecttw", selecttw);
				dispatch("fntbuyboard.jsp", request, response);
				
			} else {
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.buysearchNicknameCount(search);

				paging.setTotalcount(count);
				paging.setPage(page);
				list = dao.searchdealwriter(search,paging);
				
				request.setAttribute("categorylist", categorylist);
				request.setAttribute("paging", paging);
				request.setAttribute("list", list);
				request.setAttribute("search", search);
				request.setAttribute("selecttw", selecttw);
				
				dispatch("fntbuyboard.jsp", request, response); 
			}
			
			
		} else if (command.equals("salesearchlist")) { //판매글 카테고리 (페이징 적용)

			String categorylist = request.getParameter("categorylist");
			String salesearch = request.getParameter("salesearch");

			List<DealBoardDto> list = null;
			int page = 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			Paging paging = new Paging();
			int count = dao.saleGetAllCount(categorylist);

			paging.setTotalcount(count);
			paging.setPage(page);
			
			if (categorylist.equals("CHECK")) {
				response.sendRedirect("dealboard.do?command=fntsaleboard");
			} else {
				list = dao.salesearchList(categorylist,paging);
				request.setAttribute("salesearch", salesearch);
				request.setAttribute("paging", paging);
				request.setAttribute("list", list);
				request.setAttribute("categorylist", categorylist);

				dispatch("fntsaleboard.jsp", request, response);
			}

		} else if (command.equals("salesearch")) {	// 판매글 검색 (페이징 적용)
			String salesearch = request.getParameter("salesearch");
			String salelist = request.getParameter("salelist");
			String categorylist = request.getParameter("categorylist");

			if (salelist.equals("T")) {
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.salesearchTitleCount(salesearch);

				paging.setTotalcount(count);
				paging.setPage(page);
				
				List<DealBoardDto> list = dao.salesearchtitle(salesearch,paging);
				request.setAttribute("paging", paging);
				request.setAttribute("categorylist", categorylist);
				request.setAttribute("list", list);
				request.setAttribute("salelist", salelist);
				request.setAttribute("salesearch", salesearch);

				dispatch("fntsaleboard.jsp", request, response);
			} else {
				int page = 1;

				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				Paging paging = new Paging();
				int count = dao.salesearchNicknameCount(salesearch);

				paging.setTotalcount(count);
				paging.setPage(page);
				
				List<DealBoardDto> list = dao.salesearchnick(salesearch,paging);
				request.setAttribute("paging", paging);
				request.setAttribute("categorylist", categorylist);
				request.setAttribute("list", list);
				request.setAttribute("salelist", salelist);
				request.setAttribute("salesearch", salesearch);

				dispatch("fntsaleboard.jsp", request, response);
			}
			
		} else if(command.equals("popnick")) { //팝업 띄우서 D닉네임 가져가기 (판매글)
            String dnickname = request.getParameter("membernickname");
            List<DealBoardDto> list = dao.popNick(dnickname);
            
            
            request.setAttribute("popnick", dnickname);
            request.setAttribute("list", list);
            dispatch("fntsaleboard.jsp", request, response);
            
         }else if(command.equals("updatesaleboard")){ /* 판매글 수정하기 */
        	 int dboardno = Integer.parseInt(request.getParameter("dboardno"));
 			DealBoardDto dealboarddto = dao.selectDetail(dboardno);
 			
 			request.setAttribute("dealboarddto", dealboarddto);
 			dispatch("fntupdatesaleform.jsp", request, response);
        	 
         }else if(command.equals("updatesaleboardres")) { /* 판매글 수정완료 */
        	int dboardno = Integer.parseInt(request.getParameter("dboardno"));
 			String dtitle = request.getParameter("dtitle");
 			String dcategory = request.getParameter("dcategory");
 			String dcontent = request.getParameter("dcontent");
 			int dprice = biz.removecomma((request.getParameter("dprice")));
			String coords = request.getParameter("coords");
			String roadname = request.getParameter("roadname");
			
			System.out.println("지도 : "+coords);
			System.out.println("길 이름 : "+roadname);

			DealBoardDto dealboarddto = new DealBoardDto();

			if (coords.equals("undefined")) {
				dealboarddto.setDlongitude("");
				dealboarddto.setDlatitude("");
			} else {
				String[] str = coords.split(",");
				String dlongitude = str[0].substring(1);

				int last = str[1].trim().length()-1;
				
				String dlatitude = str[1].trim().substring(0, last);
				System.out.println("dlatitude :" + dlatitude);

				dealboarddto.setDlongitude(dlongitude);
				dealboarddto.setDlatitude(dlatitude);
			}

			String memberid = memberdto.getMemberid();
			String membernickname = memberdto.getMembernickname();
			
			dealboarddto.setDboardno(dboardno);
			dealboarddto.setDid(memberid);
			dealboarddto.setDnickname(membernickname);
			dealboarddto.setDtitle(dtitle);
			dealboarddto.setDcategory(dcategory);
			dealboarddto.setDcontent(dcontent);
			dealboarddto.setDprice(dprice);
			dealboarddto.setDfilename(roadname); //원래 roadname 컬럼 만들어야하는데 일단 dfilename 사용중

			int res = dao.updateDealBoard(dealboarddto);
			
			if (res > 0) {
				jsResponse("수정 성공", "dealboard.do?command=fntsaleboard", response);

			} else {
				jsResponse("수정 실패", "dealboard.do?command=updatesaleboard&dboardno="+dboardno, response);
			}
         } else if (command.equals("cash")) {
        	 int dboardno = Integer.parseInt(request.getParameter("dboardno"));
        	 DealBoardDto dto = dao.cashselect(dboardno);
        	 
        	 request.setAttribute("dto", dto);
        	 dispatch("kakaocash.jsp", request, response);
         } else if (command.equals("cashupdate")) {
        	 int dboardno = Integer.parseInt(request.getParameter("dboardno"));
        	 DealBoardDto dto = dao.cashselect(dboardno);
        	 
        	 int insertres = orderlistdao.insert(new OrderlistDto(0,memberdto.getMemberid(),dto.getDnickname(),"",dboardno));
        	 int updateres = dao.updatesellflag(dboardno);
        	 
        	 if(insertres + updateres > 1) {
        	 String msg = "결제가 완료되었습니다";
        	 PrintWriter out = response.getWriter();
             out.append("<script type='text/javascript'>" + 
                   "alert('" + msg + "');"
                   		+ "opener.location.reload();" +
                   "self.close();" +
                   "</script>");
        	 } 
          
        	 //alert을 확인하면 alert_flag를 Y에서 N으로 변경
         } else if(command.equals("alertupdate")) {
        	 int dboardno = Integer.parseInt(request.getParameter("dboardno"));
        	 int alertres = alertbiz.updateAlert(dboardno);
	        	 if(dao.selectDetail(dboardno).getDflag().equals("S")) {
	        		 response.sendRedirect("dealboard.do?command=detailsaleboard&dboardno="+dboardno);
	        	 } else {
	        		 response.sendRedirect("dealboard.do?command=detailboard&dboardno="+dboardno);
	        	 }
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