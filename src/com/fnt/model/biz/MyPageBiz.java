package com.fnt.model.biz;

import java.util.List;
import java.util.Map;

import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.OrderlistDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.model.dto.WishlistDto;

public interface MyPageBiz {
	
	//알림내역 biz
	public List<AlertDto> Allalert();
	//내가쓴 판매글보기 biz
	public List<DealBoardDto> Selllist(String memberid);
	//내가쓴 구매글 보기 biz
	public List<DealBoardDto> Buylist(String memberid);
	//내가 쓴 문의글 보기 biz
	public List<QnaBoardDto> Qnalist(String memberid);
	//찜목록 biz
	public List<WishlistDto> Wishlist(String memberid);
	//주문내역 biz
	public List<OrderlistDto> Orderlist(String memberid);
}
