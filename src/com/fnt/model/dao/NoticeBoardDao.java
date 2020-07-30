package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.util.Paging;

public interface NoticeBoardDao {
	
	
	public List<NoticeBoardDto> selectList();
	public NoticeBoardDto selectOne(int nbboardno);
	public int insert(NoticeBoardDto dto);
	public int update(NoticeBoardDto dto);
	public int delete(int nbboardno);
	public List<NoticeBoardDto> selectAllMember(Paging paging);
	public int getAllCount();
	public List<NoticeBoardDto> searchlist(String searchnotice,Paging paging);
	
	
	public int getSearchCount(String searchnotice);
	

}
