package com.fnt.model.dao;

import java.util.List;
import java.util.Map;

import com.fnt.model.dto.AlertDto;
import com.fnt.model.dto.DealBoardDto;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.model.dto.OrderlistDto;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.model.dto.WishlistDto;

public interface MyPageDao {
	
	//종버튼을 클릭했을 때에 MypageController를 가서 실행해서 뿌려줄건데
	//Dao를 가서 처리를 해줘야한다.
	public List<AlertDto> Allalert();
	//내가 쓴 판매글
	public List<DealBoardDto> Selllist(String memberid);
	//내가 쓴 구매글
	public List<DealBoardDto> Buylist(String memberid);
	//내가 쓴 문의글
	public List<QnaBoardDto> Qnalist(String memberid);
	//내 찜목록
	public List<WishlistDto> Wishlist(String memberid);
	//내 주문내역
	public List<OrderlistDto> Orderlist(String memberid);

}
