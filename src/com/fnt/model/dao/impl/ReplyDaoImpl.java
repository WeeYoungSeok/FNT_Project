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
	public List<ReplyDto> selectReply(ReplyDto replydto) {
		SqlSession sqlsession = null;
		List<ReplyDto> list = null;
		
		
		System.out.println("selectReply DAO에서 넣어야하는 replydto : "+replydto);
		
		Map<String,Object> map = new HashMap<>();
		map.put("replyid", replydto.getReplyid());
		map.put("replynickname",replydto.getReplynickname());
		map.put("replyboardno",replydto.getReplyboardno());
		map.put("replytitle",replydto.getReplytitle());
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			list = sqlsession.selectList(namespace+"selectreply",map);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return list;
	}

	@Override
	public int deletereply(int replyno) {
		SqlSession sqlsession = null;
		int res = 0;
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.delete(namespace+"deletereply",replyno);
			
			if(res > 0) {
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
	public int deletereply2(int replyno) {
		SqlSession sqlsession = null;
		int res = 0;
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.update(namespace+"deletereply2",replyno);
			
			if(res > 0) {
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
	public int replyCount(int replyboardno) {
		SqlSession sqlsession = null;
		int count = 0;
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			count = sqlsession.selectOne(namespace+"replyCount",replyboardno);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return count;
	}

	@Override
	public List<Integer> selectGroupnoByNicknameBoardno(String nickname, int boardno) {
		SqlSession sqlsession = null;
		List<Integer> groupnoList = null;
		Map<String, Object> map = new HashMap<>();
		map.put("nickname",nickname);
		map.put("boardno",boardno);
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			groupnoList = sqlsession.selectList(namespace+"selectGroupnoByNicknameBoardno",map);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return groupnoList;
	}
	

	
}
