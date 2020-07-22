package com.fnt.model.dao;

import com.fnt.model.dto.MemberDto;

public interface LoginCrudDao {

	public MemberDto login(String memberid, String memberpw);

	public MemberDto searchId(String membername, String memberemail, String memberphone);
	
	public MemberDto searchPw(String memberid, String membername, String memberemail, String memberphone);
}
