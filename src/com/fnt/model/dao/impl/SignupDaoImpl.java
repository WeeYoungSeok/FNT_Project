package com.fnt.model.dao.impl;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.SignupDao;
import com.fnt.model.dao.SqlMapConfig;
import com.fnt.model.dto.MemberDto;

public abstract class SignupDaoImpl extends SqlMapConfig implements SignupDao {
	
private String namespace = "com.fnt.model.mapper.";
	
	public int insert(MemberDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", dto);
			
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
