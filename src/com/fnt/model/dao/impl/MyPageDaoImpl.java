package com.fnt.model.dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import static com.fnt.model.dao.SqlMapConfig.*;
import com.fnt.model.dao.MyPageDao;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.QnaBoardDto;

public class MyPageDaoImpl implements MyPageDao {
	
	private String namespace = "mypage.";

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
	public List<DealBoardDto> Wishlist(String memberid) {
		return null;
	}

	//주문내역
	@Override
	public List<DealBoardDto> Orderlist(String memberid) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
