package com.fnt.model.dao.impl;

import java.security.SecureRandom;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.SignupDao;
import static com.fnt.model.dao.SqlMapConfig.*;
import com.fnt.model.dto.MemberDto;

public class SignupDaoImpl implements SignupDao {
	
	private String namespace = "signupmapper.";
	
	// db에 있는 id 전부 불러오는 용도
	public List<MemberDto> selectidall() {
		
		SqlSession session = null;
		List<MemberDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectidall");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	// id 중복 체크
	public MemberDto idchk(String id) {
		SqlSession session = null;
		MemberDto memberdto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			memberdto = session.selectOne(namespace + "selectidall", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return memberdto;
	}
	
	// 회원가입 폼에 넣은 정보들 db에 입력
	public int signup(MemberDto memberdto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "signup", memberdto);
			
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			session.close();
		}
		return res;
	}

	// naver 로그인으로 가져온 정보에 추가로 받아서 db에 입력 
	public int naverSignup(MemberDto memberdto) {

		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "naversignup", memberdto);
			
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			session.close();
		}
		return res;
	}

	// kakao 로그인으로 가져온 정보에 추가로 받아서 db에 입력 
	public int kakaoSignup(MemberDto memberdto) {

		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "signup", memberdto);
			
			if (res > 0) {
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
