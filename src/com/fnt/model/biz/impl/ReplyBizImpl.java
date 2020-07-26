package com.fnt.model.biz.impl;

import com.fnt.model.biz.ReplyBiz;
import com.fnt.model.dao.ReplyDao;
import com.fnt.model.dao.impl.ReplyDaoImpl;
import com.fnt.model.dto.ReplyDto;

public class ReplyBizImpl implements ReplyBiz {
	ReplyDao replydao = new ReplyDaoImpl();
	
	@Override
	public int replyProc(ReplyDto replydto) {
		int res1 = replydao.updateReplyseq(replydto.getReplyboardno());
		int res2 = replydao.insertReply(replydto);
		return res1+res2;
	}
	
}
