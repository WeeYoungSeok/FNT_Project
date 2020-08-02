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
	//신고받은 회원 중 말도안되는 신고가 들어왔을 때 차단거절 누르면 report테이블에서 삭제
		public int deleteReport(int reportno) {
			SqlSession session = null;
			int deleteres = 0;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				deleteres = session.delete(namespace + "deletereport", reportno);
				
				if(deleteres > 0) {
					session.commit();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return deleteres;
		}
}
