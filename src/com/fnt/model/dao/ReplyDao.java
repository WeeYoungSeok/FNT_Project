package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.ReplyDto;

public interface ReplyDao {
	public List<ReplyDto> selectReplyList(int replyboardno);
	public int insertReply(ReplyDto replydto);
	public int updateReplyseq(int replyboardno, int replyno);
	public int insertReReply(ReplyDto replydto);
	public ReplyDto selectReply(ReplyDto replydto);
}
