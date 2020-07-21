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

}
