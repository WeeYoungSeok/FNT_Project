package com.fnt.model.dao.impl;

import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.ReplyDao;
import com.fnt.model.dto.ReplyDto;

public class ReplyDaoImpl implements ReplyDao {

	private String namespace = "replymapper.";
	@Override
	public List<ReplyDto> selectReplyList() {
		SqlSession sqlsession = null;
		List<ReplyDto> list = null;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			list = sqlsession.selectList(namespace+"selectreplylist");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return list;
	}
	
}
