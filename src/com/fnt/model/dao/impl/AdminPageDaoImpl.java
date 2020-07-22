package com.fnt.model.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import static com.fnt.model.dao.SqlMapConfig.*;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dto.MemberDto;

public class AdminPageDaoImpl implements AdminPageDao {

	private String namespace="select.";
	
	//전체회원조회
	@Override
	public List<MemberDto> selectAll(String enabled) {
		SqlSession session = null;
		List<MemberDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectall", enabled);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	//탈퇴회원조회
	@Override
	public List<MemberDto> deleteAll() {
		return null;
	}

	//신고회원조회
	@Override
	public List<MemberDto> reportAll() {
		return null;
	}
}
