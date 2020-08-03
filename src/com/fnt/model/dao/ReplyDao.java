package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.ReplyDto;

public interface ReplyDao {
	public List<ReplyDto> selectReplyList(int replyboardno);
	public int insertReply(ReplyDto replydto);
	public int updateReplyseq(int replyboardno, int replyno);
	public int insertReReply(ReplyDto replydto);
	public List<ReplyDto> selectReply(ReplyDto replydto);
	public int deletereply(int replyno);
	public int deletereply2(int replyno);
	public int replyCount(int replyboardno);
}
