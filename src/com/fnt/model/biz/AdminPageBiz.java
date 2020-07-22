package com.fnt.model.biz;

import java.util.List;

import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.ReportDto;

public interface AdminPageBiz {
	//전체회원조회 biz
	public List<MemberDto> selectAll(String enabled);
	//탈퇴회원조회 biz
	public List<MemberDto> deleteAll();
	//신고처리버튼 클릭했을 때에 enabled를 r로 바꿔주는 것
	public MemberDto updateRole(String receiveid);
}
