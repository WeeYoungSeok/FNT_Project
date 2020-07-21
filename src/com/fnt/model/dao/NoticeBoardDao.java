package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.NoticeBoardDto;

public interface NoticeBoardDao {
	
	
	public List<NoticeBoardDto> selectList();
	public int insert(NoticeBoardDto dto);
}
