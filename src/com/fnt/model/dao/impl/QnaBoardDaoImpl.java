package com.fnt.model.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.QnaBoardDao;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.util.Paging;

import static com.fnt.model.dao.SqlMapConfig.*;
public class QnaBoardDaoImpl implements QnaBoardDao {

	private String namespace = "qnaboard.";
	
	public List<QnaBoardDto> selectAllMember(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession session = null;
		List<QnaBoardDto> qnaboardpaging = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			qnaboardpaging = session.selectList(namespace+"qnaselectPaging", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return qnaboardpaging;
	}

	@Override
	public int getAllCount() {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "count");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}

	@Override
	public QnaBoardDto selectOne(int qbboardno) {
		SqlSession session = null;
		QnaBoardDto qnaboardlistone = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			qnaboardlistone = session.selectOne(namespace + "qnaselectListOne", qbboardno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return qnaboardlistone;
	}

	@Override
	public int delete(int qbboardno) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "qnadelete", qbboardno);
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

	@Override
	public int insert(QnaBoardDto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "qnainsert", dto);
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

	@Override
	public int recomment(QnaBoardDto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "qnarecomment", dto);
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

	@Override
	public int update(QnaBoardDto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "qnaupdate", dto);
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
	
	

