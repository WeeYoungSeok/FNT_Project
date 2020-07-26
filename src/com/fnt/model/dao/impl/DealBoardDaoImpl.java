package com.fnt.model.dao.impl;
import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.DealBoardDao;
import com.fnt.model.dto.DealBoardDto;

import sun.security.ec.ECDHKeyAgreement;

public class DealBoardDaoImpl implements DealBoardDao{

	private String namespace = "dealboardmapper.";
	
	
	@Override
	public List<DealBoardDto> selectSaleList() {
		SqlSession sqlsession = null;
		List<DealBoardDto> list = null;
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			list = sqlsession.selectList(namespace+"selectsalelist");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		
		return list;
	}
	
	@Override
	public List<DealBoardDto> selectBuylist() {
		SqlSession sqlsession = null;
		List<DealBoardDto> list = null;		
		
		try {
			sqlsession = getSqlSessionFactory().openSession(false);
			list = sqlsession.selectList(namespace+"selectbuylist");
			

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlsession.close();
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
	

	
}
