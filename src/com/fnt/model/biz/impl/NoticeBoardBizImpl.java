package com.fnt.model.biz.impl;

import java.util.List;

import com.fnt.model.biz.NoticeBoardBiz;
import com.fnt.model.dao.NoticeBoardDao;
import com.fnt.model.dao.impl.NoticeBoardDaoImpl;
import com.fnt.model.dto.NoticeBoardDto;
import com.fnt.util.Paging;

public class NoticeBoardBizImpl implements NoticeBoardBiz {

	NoticeBoardDao noticeboarddao = new NoticeBoardDaoImpl();
	
	public List<NoticeBoardDto> selectList() {
		
		return noticeboarddao.selectList();
	}
	
	public int insert(NoticeBoardDto dto) {
		
		return noticeboarddao.insert(dto);
	}

	public NoticeBoardDto selectOne(int nbboardno) {
		return noticeboarddao.selectOne(nbboardno);
	}
	
	public List<NoticeBoardDto> selectAllMember(Paging paging){
		return noticeboarddao.selectAllMember(paging);
	}

	@Override
	public int getAllCount() {
		// TODO Auto-generated method stub
		return noticeboarddao.getAllCount();
	}

	@Override
	public int delelte(int nbboardno) {
		// TODO Auto-generated method stub
		return noticeboarddao.delete(nbboardno);
	}

	@Override
	public int update(NoticeBoardDto dto) {
		// TODO Auto-generated method stub
		return noticeboarddao.update(dto);
	}


}
