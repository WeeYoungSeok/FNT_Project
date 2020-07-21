package com.fnt.model.dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import static com.fnt.model.dao.SqlMapConfig.*;
import com.fnt.model.dao.MyPageDao;
import com.fnt.model.dto.AlertDto;

public class MyPageImpl implements MyPageDao {
	
	private String namespace = "alert.";

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
	
}
