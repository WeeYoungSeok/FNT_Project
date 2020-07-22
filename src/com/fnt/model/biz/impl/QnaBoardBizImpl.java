package com.fnt.model.biz.impl;

import java.util.List;

import com.fnt.model.biz.QnaBoardBiz;
import com.fnt.model.dao.QnaBoardDao;
import com.fnt.model.dao.impl.QnaBoardDaoImpl;
import com.fnt.model.dto.QnaBoardDto;
import com.fnt.util.Paging;

public class QnaBoardBizImpl implements QnaBoardBiz {
	QnaBoardDao qnaboarddao = new QnaBoardDaoImpl();

	@Override
	public List<QnaBoardDto> selectAllMember(Paging paging) {
		return qnaboarddao.selectAllMember(paging);
	}

	@Override
	public int getAllCount() {
		return qnaboarddao.getAllCount();
	}

	@Override
	public QnaBoardDto selectOne(int qbboardno) {
		return qnaboarddao.selectOne(qbboardno);
	}

	@Override
	public int delete(int qbboardno) {
		return qnaboarddao.delete(qbboardno);
	}

	@Override
	public int insert(QnaBoardDto dto) {
		return qnaboarddao.insert(dto);
	}
}
