package com.fnt.model.dao.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.SignupDao;
import com.fnt.model.dao.SqlMapConfig;
import com.fnt.model.dto.MemberDto;

public abstract class SignupDaoImpl extends SqlMapConfig implements SignupDao {
	
private String namespace = "com.fnt.model.mapper.";
	
	public int insert(String memberid, String memberpw, String memberpwchk, String membernickname, String membername, Date memberbirth, String memberphone, String memberaddr, String memberemail) {
		
		SqlSession session = null;
		int res = 0;
		MemberDto memberdto = null;
		memberdto.setMemberid(memberid);
		memberdto.setMemberpw(memberpw);
		memberdto.setMemberpwchk(memberpwchk);
		memberdto.setMembernickname(membernickname);
		memberdto.setMemberbirth(memberbirth);
		memberdto.setMemberphone(memberphone);
		memberdto.setMemberaddr(memberaddr);
		memberdto.setMemberemail(memberemail);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", memberdto);
			
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
