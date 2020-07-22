package com.fnt.model.biz.impl;

import java.util.List;

import com.fnt.model.biz.MyPageBiz;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.MyPageDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dao.impl.MyPageDaoImpl;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;

public class MyPageBizImpl implements MyPageBiz {

	MyPageDao dao = new MyPageDaoImpl();
	
	//알림내역
	@Override
	public List<AlertDto> Allalert() {
		return dao.Allalert();
	}

	//내가쓴글
	@Override
	public List<DealBoardDto> Mywriterlist(String memberid) {
		return dao.Mywriterlist(memberid);
	}
	//찜목록
	@Override
	public List<DealBoardDto> Mywishlist(String memberid) {
		// TODO Auto-generated method stub
		return dao.Mywishlist(memberid);
	}

	//주문내역
	@Override
	public List<DealBoardDto> Myoederlist(String memberid) {
		// TODO Auto-generated method stub
		return dao.Myorderlist(memberid);
	}

	
}
