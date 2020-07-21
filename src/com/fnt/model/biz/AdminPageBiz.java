package com.fnt.model.biz;

import java.util.List;

import com.fnt.model.dto.MemberDto;

public interface AdminPageBiz {
	//전체회원조회 biz
	public List<MemberDto> selectAll();
	//탈퇴회원조회 biz
	public List<MemberDto> deleteAll();
	//신고회원 조회 biz
	public List<MemberDto> reportAll();
}
