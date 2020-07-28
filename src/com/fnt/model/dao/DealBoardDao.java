package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.DealBoardDto;
import com.fnt.util.Paging;

public interface DealBoardDao {
	public List<DealBoardDto> selectSaleList(Paging paging);
	public int getAllCountS();
	
	public List<DealBoardDto> selectBuylist(Paging paging);
	public int getAllCount();
	
	public int insertBuyBoard(DealBoardDto dto);
	
	public int insertSaleBoard(DealBoardDto dto);
	
	public DealBoardDto selectDetail(int dboardno);
	
	public int deleteDealBoard(int dboardno);
	
	public int updateDealBoard(DealBoardDto dto);
	
	//통합검색 리스트로 출력
	public List<DealBoardDto> searchList(String searchdeal,Paging paging);
	public int getAllCountsearch(String searchdeal);
	public List<DealBoardDto> ascorder(String searchdeal);
	public List<DealBoardDto> desccate(String searchdeal, String categorylist);
	public List<DealBoardDto> asccate(String searchdeal, String categorylist);
	public List<DealBoardDto> buysearchList(String categorylist, Paging paging);
	public List<DealBoardDto> salesearchList(String categorylist, Paging paging);
	public int buyGetAllCount(String categorylist);
	public int saleGetAllCount(String categorylist);
	
	public List<DealBoardDto> searchdealtitle(String search,Paging paging);
	public List<DealBoardDto> searchdealwriter(String search);
	public int buysearchAllCount(String search);
	
	public List<DealBoardDto> salesearchtitle(String salesearch);
	public List<DealBoardDto> salesearchnick(String salesearch);
	
	//팝업 창 판매자 글 목록
	public List<DealBoardDto> popNick(String dnickname);
	
}
