package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.MemberDto;

public interface LoginCrudDao {

	public MemberDto login(String memberid, String memberpw);

	public MemberDto searchId(String membername, String memberemail);
	
	public MemberDto searchPw(String memberid, String membername, String memberemail, String memberphone); 
	
	public MemberDto selectOne(String memberid);
	
	public int update(MemberDto dto);
	
	public int updateoutmember(MemberDto dto);
	
	
}
