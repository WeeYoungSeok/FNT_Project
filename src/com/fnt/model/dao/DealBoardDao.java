package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.DealBoardDto;

public interface DealBoardDao {
	public List<DealBoardDto> selectSaleList();
	
	public List<DealBoardDto> selectBuylist();
	
	public int insertBuyBoard(DealBoardDto dto);
	
	public int insertSaleBoard(DealBoardDto dto);
	
	public DealBoardDto selectDetail(int dboardno);
	
}
