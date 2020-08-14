package com.fnt.model.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import static com.fnt.model.dao.SqlMapConfig.*;
import com.fnt.model.dao.MyPageDao;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.OrderlistDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.model.dto.WishlistDto;

public class MyPageDaoImpl implements MyPageDao {
	
	private String namespace = "mypage.";

	//알림내역
	public List<AlertDto> Allalert(){
		SqlSession session = null;
		List<AlertDto> list = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"alert");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	//내가쓴 판매글 보기
	@Override
	public List<DealBoardDto> Selllist(String memberid) {
		SqlSession session = null;
		List<DealBoardDto> selllist = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			selllist = session.selectList(namespace+"selllist", memberid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return selllist;
	}
	//내가쓴구매글
	@Override
	public List<DealBoardDto> Buylist(String memberid) {
		SqlSession session = null;
		List<DealBoardDto> buylist = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			buylist = session.selectList(namespace+"buylist", memberid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return buylist;
	}
	//내가 쓴 문의글
	@Override
	public List<QnaBoardDto> Qnalist(String memberid) {
		SqlSession session = null;
		List<QnaBoardDto> qnalist = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			qnalist = session.selectList(namespace+"qnalist", memberid);
		} catch (Exception e) {
			e.printStackTrace();
 		} finally {
 			session.close();
 		}
		return qnalist;
	}
	
	//찜목록
	public List<WishlistDto> Wishlist(String memberid) {
		SqlSession session = null;
		List<WishlistDto> wishlist = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			wishlist = session.selectList(namespace+"wishlist", memberid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return wishlist;
	}

	//주문내역
	@Override
	public List<OrderlistDto> Orderlist(String memberid) {
		SqlSession session = null;
		List<OrderlistDto> orderlist = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			orderlist = session.selectList(namespace+"orderlist", memberid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return orderlist;
	}

	
}
