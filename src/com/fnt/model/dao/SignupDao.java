package com.fnt.model.dao;

import java.sql.Date;
import java.util.List;

import com.fnt.model.dto.MemberDto;

public interface SignupDao {
	
	// id 중복 체크
	public List<MemberDto> selectidall();
	public MemberDto idchk(String id);
	
	// nickname 중복 체크
	public List<MemberDto> selectnickall();
	public MemberDto nickchk(String nick);

	// 일반 회원가입
	public int signup(MemberDto dto);
	
	// 네이버 로그인 회원가입
	public int naverSignup(MemberDto memberdto);
	
	// 카카오 로그인 회원가입
	public int kakaoSignup(MemberDto memberdto);
}
