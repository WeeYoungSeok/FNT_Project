package com.fnt.model.biz.impl;

import java.util.List;

import com.fnt.model.biz.ReportPageBiz;
import com.fnt.model.dao.ReportPageDao;
import com.fnt.model.dao.impl.ReportPageDaoImpl;
import com.fnt.model.dto.ReportDto;

public class ReportPageBizImpl implements ReportPageBiz {
	
	ReportPageDao dao = new ReportPageDaoImpl();
	
	public List<ReportDto> selectList(){
		return dao.selectList();
	}
	public ReportDto selectOne(int reportno) {
		return dao.selectOne(reportno);
	}
}
