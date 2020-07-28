package com.fnt.model.dao.impl;

import static com.fnt.model.dao.SqlMapConfig.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.AlertDao;
import com.fnt.model.dto.AlertDto;

public class AlertDaoImpl implements AlertDao {
	
	private String namespace = "alert.";

	@Override
	public int insertAlert(AlertDto alertdto) {
		SqlSession session = null;
		int alertres = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			alertres = session.insert(namespace+"alertinsert", alertdto);
			
			if(alertres > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return alertres;
	}
	
	public List<AlertDto> AlertList(String memberid) {
		SqlSession session = null;
		List<AlertDto> alertlist = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			alertlist = session.selectList(namespace+"alertlist", memberid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return alertlist;
	}
	
	public int updateAlert(int dboardno) {
		SqlSession session = null;
		int alertres = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			alertres = session.update(namespace+"alertupdate",dboardno);
		
			if(alertres > 0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return alertres;
	}

}
