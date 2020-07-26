package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.ReplyDto;

public interface ReplyDao {
	public List<ReplyDto> selectReplyList();
}
