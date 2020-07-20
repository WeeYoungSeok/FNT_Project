package com.fnt.model.biz.impl;

import com.fnt.model.biz.NoticeBoardBiz;
import com.fnt.model.dao.NoticeBoardDao;
import com.fnt.model.dao.impl.NoticeBoardDaoImpl;
import com.fnt.model.dto.NoticeBoardDto;

public class NoticeBoardBizImpl implements NoticeBoardBiz {

	NoticeBoardDao dao = new NoticeBoardDaoImpl();
	
	public int insert(NoticeBoardDto dto) {
		
		return 0;
	}

}
