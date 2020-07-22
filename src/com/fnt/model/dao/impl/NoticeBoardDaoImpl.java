package com.fnt.model.dao.impl;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.NoticeBoardDao;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.util.Paging;

import static com.fnt.model.dao.SqlMapConfig.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NoticeBoardDaoImpl implements NoticeBoardDao {
	
	private String namespace = "noticeboard.";
	
	public List<NoticeBoardDto> selectList() {
		SqlSession session = null;
		List<NoticeBoardDto> noticeboardlist = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			noticeboardlist = session.selectList(namespace + "noticeselectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return noticeboardlist;
	}
	
	public int insert(NoticeBoardDto noticeboarddto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"noticeinsert",noticeboarddto);
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
	public NoticeBoardDto selectOne(int nbboardno) {
		SqlSession session = null;
		NoticeBoardDto noticeboardlistone = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			noticeboardlistone = session.selectOne(namespace + "noticeselectListOne",nbboardno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return noticeboardlistone;
	}

	@Override
	public List<NoticeBoardDto> selectAllMember(Paging paging) {
		int startNum = paging.getStartNum();
		System.out.println("start" + startNum);
		int endNum = paging.getEndNum();
		System.out.println("end" +endNum);
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession session = null;
		List<NoticeBoardDto> noticeboardpaging = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			noticeboardpaging = session.selectList(namespace + "noticeselectPaging",map);
			System.out.println("noticeboardpaging의 사이즈" + noticeboardpaging);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		System.out.println("스타트넘 : " + startNum);
		System.out.println("엔드넘 : " + endNum);
		
		return noticeboardpaging;
	}

	@Override
	public int getAllCount() {
		SqlSession session = null;
		int count = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "count");
			System.out.println("count의 값" + count);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;
	}

	@Override
	public int delete(int nbboardno) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"noticedelete",nbboardno);
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
