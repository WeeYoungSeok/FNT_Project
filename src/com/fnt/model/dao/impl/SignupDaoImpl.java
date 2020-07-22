package com.fnt.model.dao.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.SignupDao;
import static com.fnt.model.dao.SqlMapConfig.*;
import com.fnt.model.dto.MemberDto;

public class SignupDaoImpl implements SignupDao {
	
	private String namespace = "signupmapper.";
	
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
}
