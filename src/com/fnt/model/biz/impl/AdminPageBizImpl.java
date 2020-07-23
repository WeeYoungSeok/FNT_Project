package com.fnt.model.biz.impl;

import java.util.List;

import com.fnt.model.biz.AdminPageBiz;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.ReportDto;

public class AdminPageBizImpl implements AdminPageBiz {

	AdminPageDao dao = new AdminPageDaoImpl();
	
	//전체회원조회 biz
	public List<MemberDto> selectAll(String enabled){
		return dao.selectAll(enabled);
	}
	//탈퇴회원조회 biz
	public List<MemberDto> deleteAll(){
		return dao.deleteAll();
	}
	//신고된 회원 role r로 바꿔주기.
	@Override
	public int updateRole(String receiveid) {
		return dao.updateRole(receiveid);
	}
	@Override
	public int restEnabled(String id) {
		return dao.restEnabled(id);
	}
	
}
