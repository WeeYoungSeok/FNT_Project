package com.fnt.model.biz;

import java.util.List;

import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;

public interface MyPageBiz {
	
	//알림내역 biz
	public List<AlertDto> Allalert();
	//내가쓴 글보기 biz
	public List<DealBoardDto> Mywriterlist(String memberid);
	//찜목록 biz
	public List<DealBoardDto> Mywishlist(String memberid);
	//주문내역 biz
	public List<DealBoardDto> Myoederlist(String memberid);
}
