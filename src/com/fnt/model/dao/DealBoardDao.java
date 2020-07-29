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
	
	//통합검색 페이징 카운트 수
	public int getAllCountsearch(String searchdeal);
	
	//통합검색 asc 출력 (오래된 순)
	public List<DealBoardDto> ascorder(String searchdeal);
	
	//통합검색 desc 출력 + 카테고리 (최근순)
	public List<DealBoardDto> desccate(String searchdeal, String categorylist);
	
	//통합검생 asc 출려 + 카테고리 (오래된 순)
	public List<DealBoardDto> asccate(String searchdeal, String categorylist);
	
	
	
	//구매 게시판 카테고리 리스트 페이징 적용
	public List<DealBoardDto> buysearchList(String categorylist, Paging paging);
	//구매 게시판 카테고리 페이징 카운트 수
	public int buyGetAllCount(String categorylist);
	//구매 게시판 타이틀 검색 페이징
	public List<DealBoardDto> searchdealtitle(String search,Paging paging);
	//구매 게시판 타이틀 검색 페이징 카운트 수
	public int buysearchTitleCount(String search);
	//구매 게시판 작성자 검색 페이징
	public List<DealBoardDto> searchdealwriter(String search, Paging paging);
	//구매 게시판 작성자 검색 페이징 카운트 수
	public int buysearchNicknameCount(String search);
	
	//판매 게시판 카테고리 리스트 페이징 적용
	public List<DealBoardDto> salesearchList(String categorylist, Paging paging);
	//판매 게시판 카테고리 페이징 카운트 수
	public int saleGetAllCount(String categorylist);
	//판매 게시판 타이틀 검색 페이징
	public List<DealBoardDto> salesearchtitle(String salesearch,Paging paging);
	//판매 게시판 타이틀 검색 페이징 카운트 수
	public int salesearchTitleCount(String salesearch);
	//핀매 게시판 작성자 검색 페이징
	public List<DealBoardDto> salesearchnick(String salesearch, Paging paging);
	//판매 게시판 작성자 검색 페이징 카운트 수
	public int salesearchNicknameCount(String salesearch);
	
	//팝업 창 판매자 글 목록
	public List<DealBoardDto> popNick(String dnickname);
	
	//결제 폼으로 보내줄 정보
	public DealBoardDto cashselect(int dbboard);
	
	//판매완료 글로 바꾸기
	public int updatesellflag(int dboardno);
	
}
