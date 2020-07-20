package com.fnt.model.dao.impl;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.NoticeBoardDao;
import com.fnt.model.dto.NoticeBoardDto;
import static com.fnt.model.dao.SqlMapConfig.*;

public class NoticeBoardDaoImpl implements NoticeBoardDao {
	
	private String namespace = "noticeboard.";
	
	public int insert(NoticeBoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert",dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

}
