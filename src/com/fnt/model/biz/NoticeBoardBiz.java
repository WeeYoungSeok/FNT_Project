package com.fnt.model.biz;

import java.util.List;

import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.util.Paging;

public interface NoticeBoardBiz {
	
	public List<NoticeBoardDto> selectList();
	public NoticeBoardDto selectOne(int nbboardno);
	public int insert(NoticeBoardDto dto);
	public int update(NoticeBoardDto dto);
	public int delelte(int nbboardno);
	public List<NoticeBoardDto> selectAllMember(Paging paging);
	public int getAllCount();
}
