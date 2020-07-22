package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.MemberDto;
import com.fnt.model.dto.ReportDto;

public interface AdminPageDao {
	
	//전체회원조회dao
	public List<MemberDto> selectAll(String enabled);
	//탈퇴회원조회dao
	public List<MemberDto> deleteAll();
	//신고회원 enabled를 r로 바꾸기
	public MemberDto updateRole(String receiveid);
	
}
