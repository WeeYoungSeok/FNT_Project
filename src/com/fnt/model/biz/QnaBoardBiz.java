package com.fnt.model.biz;

import java.util.List;

import com.fnt.model.dto.QnaBoardDto;
import com.fnt.util.Paging;

public interface QnaBoardBiz {

	public List<QnaBoardDto> selectAllMember(Paging paging);
	public int getAllCount();
	public QnaBoardDto selectOne(int qbboardno);
	public int delete(int qbboardno);
	public int insert(QnaBoardDto dto);
	public int recomment(QnaBoardDto dto);
}
