package com.fnt.model.dao;

import java.util.List;

import com.fnt.model.dto.MemberDto;

public interface LoginCrudDao {

	public MemberDto login(String memberid, String memberpw);

	public MemberDto searchId(String membername, String memberemail);
	
	public MemberDto searchPw(String memberid, String membername, String memberemail); 
	
	public MemberDto selectOne(String memberid);
	
	public int update(MemberDto dto);
	
	public int updateoutmember(MemberDto dto);
	
	public MemberDto findId(String memberemail, String membername);
	
	public MemberDto findPw(String memberid, String memberemail);
	
	public int updatepw(String memberpw, String memberpwchk, String memberid);
	
	public int reportinsert(String membernickname, String reporttitle, String reportcontent, String receiveid, String sendid, String sendnickname);
	public MemberDto receivenickname(String membernickname);
	
}
