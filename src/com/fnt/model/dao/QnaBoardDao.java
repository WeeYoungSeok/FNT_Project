package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.QnaBoardDto;
import com.fnt.util.Paging;

public interface QnaBoardDao {

	public List<QnaBoardDto> selectAllMember(Paging paging);
	public int getAllCount();
	public QnaBoardDto selectOne(int qbboardno);
	public int delete(int qbboardno);
	public int insert(QnaBoardDto dto);
	public int recomment(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public List<QnaBoardDto> searchList(String searchqna,Paging paging);
	public List<QnaBoardDto> searchWriter(String searchqna,Paging paging);
	
	
	public int getTitleCount(String searchqna);
	
	public int getWriterCount(String searchqna);
	
}
