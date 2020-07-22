package com.fnt.model.dao.impl;

import com.fnt.model.dao.LoginCrudDao;
import com.fnt.model.dto.MemberDto;

import static com.fnt.model.dao.SqlMapConfig.*;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
public class LoginCrudDaoImpl implements LoginCrudDao {

	private String namespace = "logincrud.";
	
	public MemberDto login(String memberid, String memberpw) {
		SqlSession session = null;
		MemberDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("memberpw", memberpw);
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectmemberbyidandpw",map);
			if(dto != null) {
				session.commit();
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	
	//id 분실시 id찾기
	public MemberDto searchId(String membername, String memberemail, String memberphone) {
		SqlSession session = null;
		MemberDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
   		map.put("membername", membername);
		map.put("memberemail", memberemail);
		map.put("memberphone", memberphone);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"searchid",map);
			
			if(dto != null) {
				session.commit();
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}
	//pw 분실 시 pw 찾기
	public MemberDto searchPw(String memberid, String membername, String memberemail, String memberphone) {
		SqlSession session = null;
		MemberDto dto = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("membername", membername);
		map.put("memberemail", memberemail);
		map.put("memberphone", memberphone);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"searchpw", map);
			
			if(dto != null) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}

}
