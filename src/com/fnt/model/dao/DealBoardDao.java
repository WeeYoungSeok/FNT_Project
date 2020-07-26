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
	
}
