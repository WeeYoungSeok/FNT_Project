package com.fnt.model.biz.impl;

import java.util.List;
import java.util.Map;

import com.fnt.model.biz.MyPageBiz;
import com.fnt.model.dao.AdminPageDao;
import com.fnt.model.dao.MyPageDao;
import com.fnt.model.dao.impl.AdminPageDaoImpl;
import com.fnt.model.dao.impl.MyPageDaoImpl;
import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.OrderlistDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.model.dto.WishlistDto;

public class MyPageBizImpl implements MyPageBiz {

	MyPageDao dao = new MyPageDaoImpl();
	
	//알림내역
	@Override
	public List<AlertDto> Allalert() {
		return dao.Allalert();
	}

	//내가쓴판매글
	@Override
	public List<DealBoardDto> Selllist(String memberid) {
		return dao.Selllist(memberid);
	}
	//내가쓴구매글
	public List<DealBoardDto> Buylist(String memberid) {
		// TODO Auto-generated method stub
		return dao.Buylist(memberid);
	}
	//내가 쓴 문의글
	@Override
	public List<QnaBoardDto> Qnalist(String memberid) {
		// TODO Auto-generated method stub
		return dao.Qnalist(memberid);
	}
	//찜목록
	@Override
	public List<WishlistDto> Wishlist(String memberid) {
		// TODO Auto-generated method stub
		return dao.Wishlist(memberid);
	}

	//주문내역
	@Override
	public List<OrderlistDto> Orderlist(String memberid) {
		// TODO Auto-generated method stub
		return dao.Orderlist(memberid);
	}


	
}
