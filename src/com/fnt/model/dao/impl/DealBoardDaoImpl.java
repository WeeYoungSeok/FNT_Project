package com.fnt.model.dao.impl;
import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.util.Paging;

import sun.security.ec.ECDHKeyAgreement;

public class DealBoardDaoImpl implements DealBoardDao{

	private String namespace = "dealboardmapper.";
	
	
	@Override
	public List<DealBoardDto> selectSaleList(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectsalelist", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return list;
	}
	
	@Override
	public List<DealBoardDto> selectBuylist(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		SqlSession session = null;
		List<DealBoardDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectbuylist", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return list;
	}

	@Override
	public int insertBuyBoard(DealBoardDto dto) {
		SqlSession sqlsession = null;
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.insert(namespace+"insertbuyboard",dto);
			if(res > 0) {
				sqlsession.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		
		return res;
	}

	@Override
	public int insertSaleBoard(DealBoardDto dto) {
		SqlSession sqlsession = null;
		
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.insert(namespace+"insertsaleboard",dto);
			
	
			if(res > 0) {
				sqlsession.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		return res;
	}

	@Override
	public DealBoardDto selectDetail(int dboardno) {
		SqlSession sqlsession = null;
		DealBoardDto dto = null;
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			dto = sqlsession.selectOne(namespace+"selectdetail",dboardno);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		
		return dto;
	}

	@Override
	public int deleteDealBoard(int dboardno) {
		SqlSession sqlsession = null;
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.delete(namespace+"deletedealboard",dboardno);
			
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
	public int updateDealBoard(DealBoardDto dto) {
		SqlSession sqlsession = null;
		int res = 0;
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			res = sqlsession.update(namespace+"updatedealboard",dto);
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
	
	public int getAllCountS() {
		SqlSession session = null;
		int count = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "counts");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}

		return count;
	}
	
	

	
}
