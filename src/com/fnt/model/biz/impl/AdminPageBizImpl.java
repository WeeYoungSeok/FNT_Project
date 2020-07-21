package com.fnt.model.biz.impl;

import java.util.List;

import com.fnt.model.biz.AdminPageBiz;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dto.MemberDto;

public class AdminPageBizImpl implements AdminPageBiz {

	AdminPageDao dao = new AdminPageDaoImpl();
	
	//전체회원조회 biz
	public List<MemberDto> selectAll(){
		return dao.selectAll();
	}
	//탈퇴회원조회 biz
	public List<MemberDto> deleteAll(){
		return dao.deleteAll();
	}
	//신고회원 조회 biz
	public List<MemberDto> reportAll(){
		return dao.reportAll();
	}
}
