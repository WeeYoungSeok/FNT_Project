package com.fnt.model.biz.impl;

import java.util.List;

import com.fnt.model.biz.AlertBiz;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.AlertDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dao.impl.AlertDaoImpl;
import com.fnt.model.dto.AlertDto;

public class AlertBizImpl implements AlertBiz {
	
	AlertDao dao = new AlertDaoImpl();

	@Override
	public int insertAlert(AlertDto alertdto) {
		// TODO Auto-generated method stub
		return dao.insertAlert(alertdto);
	}

	@Override
	public List<AlertDto> AlertList(String memberid) {
		// TODO Auto-generated method stub
		return dao.AlertList(memberid);
	}

}
