package com.fnt.model.dao;

import java.sql.Date;
import java.util.List;

import com.fnt.model.dto.MemberDto;

public interface SignupDao {
	
	public List<MemberDto> selectidall();

	public int signup(MemberDto dto);
	
	public int naverSignup(MemberDto memberdto);
	
	public int kakaoSignup(MemberDto memberdto);

	public MemberDto idchk(String id);
}
