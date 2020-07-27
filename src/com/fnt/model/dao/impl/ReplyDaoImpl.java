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
	public List<ReplyDto> selectReplyList(int replyboardno) {
		SqlSession sqlsession = null;
		List<ReplyDto> list = null;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			list = sqlsession.selectList(namespace+"selectreplylist",replyboardno);
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
	public int updateReplyseq(int replyboardno, int replyno) {
		SqlSession sqlsession = null;
		int res = 0;
		Map<String,Object>map = new HashMap<>();
		map.put("replyboardno",replyboardno);
		map.put("replyno",replyno);
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.update(namespace+"updatereply",map);
			
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

	@Override
	public int insertReReply(ReplyDto replydto) {
		SqlSession sqlsession = null;
		int res = 0;
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("parentreplyno",replydto.getReplyno());
		System.out.println("dao에서 replyno : "+replydto.getReplyno());
		map.put("replyid", replydto.getReplyid());
		map.put("replynickname",replydto.getReplynickname());
		map.put("replyboardno",replydto.getReplyboardno());
		map.put("replytitle",replydto.getReplytitle());
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.insert(namespace+"insertrereply",map);
			if (res > 0){
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
	public ReplyDto selectReply(ReplyDto replydto) {
		SqlSession sqlsession = null;
		ReplyDto returnreplydto = null;
		
		Map<String,Object> map = new HashMap<>();
		map.put("replyid", replydto.getReplyid());
		map.put("replynickname",replydto.getReplynickname());
		map.put("replyboardno",replydto.getReplyboardno());
		map.put("replytitle",replydto.getReplytitle());
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			returnreplydto = sqlsession.selectOne(namespace+"selectreply",map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return returnreplydto;
	}
	
	

	
}
