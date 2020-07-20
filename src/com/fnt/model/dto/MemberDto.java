package com.fnt.model.dto;

import java.util.Date;

public class MemberDto {

	private String memberid;
	private String memberpw;
	private String memberpwchk;
	private String membernickname;
	private String membername;
	private Date memberbirth;
	private String memberphone;
	private String memberaddr;
	private String membermail;
	private String memberrole;
	private String memberenabled;
	private Date memberregdate;
	
	
	
	public MemberDto() {
		
	}



	public MemberDto(String memberid, String memberpw, String memberpwchk, String membernickname, String membername,
			Date memberbirth, String memberphone, String memberaddr, String membermail, String memberrole,
			String memberenabled, Date memberregdate) {
		this.memberid = memberid;
		this.memberpw = memberpw;
		this.memberpwchk = memberpwchk;
		this.membernickname = membernickname;
		this.membername = membername;
		this.memberbirth = memberbirth;
		this.memberphone = memberphone;
		this.memberaddr = memberaddr;
		this.membermail = membermail;
		this.memberrole = memberrole;
		this.memberenabled = memberenabled;
		this.memberregdate = memberregdate;
	}



	public String getMemberid() {
		return memberid;
	}



	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}



	public String getMemberpw() {
		return memberpw;
	}



	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}



	public String getMemberpwchk() {
		return memberpwchk;
	}



	public void setMemberpwchk(String memberpwchk) {
		this.memberpwchk = memberpwchk;
	}



	public String getMembernickname() {
		return membernickname;
	}



	public void setMembernickname(String membernickname) {
		this.membernickname = membernickname;
	}



	public String getMembername() {
		return membername;
	}



	public void setMembername(String membername) {
		this.membername = membername;
	}



	public Date getMemberbirth() {
		return memberbirth;
	}



	public void setMemberbirth(Date memberbirth) {
		this.memberbirth = memberbirth;
	}



	public String getMemberphone() {
		return memberphone;
	}



	public void setMemberphone(String memberphone) {
		this.memberphone = memberphone;
	}



	public String getMemberaddr() {
		return memberaddr;
	}



	public void setMemberaddr(String memberaddr) {
		this.memberaddr = memberaddr;
	}



	public String getMembermail() {
		return membermail;
	}



	public void setMembermail(String membermail) {
		this.membermail = membermail;
	}



	public String getMemberrole() {
		return memberrole;
	}



	public void setMemberrole(String memberrole) {
		this.memberrole = memberrole;
	}



	public String getMemberenabled() {
		return memberenabled;
	}



	public void setMemberenabled(String memberenabled) {
		this.memberenabled = memberenabled;
	}



	public Date getMemberregdate() {
		return memberregdate;
	}



	public void setMemberregdate(Date memberregdate) {
		this.memberregdate = memberregdate;
	}
	
	
	
	
}
