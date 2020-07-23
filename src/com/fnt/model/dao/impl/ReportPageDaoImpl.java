package com.fnt.model.dao.impl;

import static com.fnt.model.dao.SqlMapConfig.getSqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fnt.model.dao.ReportPageDao;
import com.fnt.model.dto.ReportDto;

public class ReportPageDaoImpl implements ReportPageDao {
	
	private String namespace = "report.";
	
	public List<ReportDto> selectList(){
			SqlSession session = null;
			List<ReportDto> list = null;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				list = session.selectList(namespace+"reportlist");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
	
		return list;
	}
	public ReportDto selectOne(int reportno) {
 		SqlSession session = null;
		ReportDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"reportdetail", reportno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	
	public int update(String rece) {
		return 0;
	}
}
