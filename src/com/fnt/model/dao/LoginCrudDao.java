package com.fnt.model.dao;

import com.fnt.model.dto.MemberDto;

public interface LoginCrudDao {

	public MemberDto login(String memberid, String memberpw);
		
	
	
	
}
