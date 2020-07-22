package com.fnt.model.dao;

import java.sql.Date;

import com.fnt.model.dto.MemberDto;

public interface SignupDao {
	
	public int signup(MemberDto dto);
}
