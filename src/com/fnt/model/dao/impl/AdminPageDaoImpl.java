package com.fnt.model.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import static com.fnt.model.dao.SqlMapConfig.*;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.ReportDto;

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

	@Override
	public int updateRole(String receiveid) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateRole", receiveid);
			System.out.println(res + "여기입니다.");
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public int restEnabled(String id) {
		SqlSession session = null;
		int res = 0;
		System.out.println(id + "dao에서 찍힌 id");
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"resetenabled", id);
			System.out.println(res + "dao에서 찍힌 res");
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
}
