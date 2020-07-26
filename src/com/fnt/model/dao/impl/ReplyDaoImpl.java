package com.fnt.model.dao.impl;

import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public int insertReply(ReplyDto replydto) {
		SqlSession sqlsession = null;
		int res = 0;
		
		Map<String,Object> map = new HashMap<>();
		map.put("replyid", replydto.getReplyid());
		map.put("replynickname",replydto.getReplynickname());
		map.put("replyboardno",replydto.getReplyboardno());
		map.put("replytitle",replydto.getReplytitle());
		
		System.out.println("DAO에서 map : "+map);
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.insert(namespace+"insertreply",map);
			if(res>0) {
				sqlsession.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return res;
	}

	@Override
	public int updateReplyseq(int replyboardno) {
		SqlSession sqlsession = null;
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.update(namespace+"updatereply",replyboardno);
			
			if(res>0) {
				sqlsession.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.clearCache();
		}
		return res;
	}
	

	
}
