package com.fnt.model.dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import static com.fnt.model.dao.SqlMapConfig.*;
import com.fnt.model.dao.MyPageDao;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;

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

	//내가쓴 글 보기
	@Override
	public List<DealBoardDto> Mywriterlist(String memberid) {
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"mywriterlist", memberid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	//찜목록
	public List<DealBoardDto> Mywishlist(String memberid) {
		return null;
	}

	//주문내역
	@Override
	public List<DealBoardDto> Myorderlist(String memberid) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
