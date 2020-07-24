package com.fnt.model.dto;

public class NMemberDto {
	
	private String nickname;
	private String name;
	private String birthday;
	private String email;
	
	public NMemberDto() {
		
	}
	
	public NMemberDto(String nickname, String name, String birthday, String email) {
		super();
		this.nickname = nickname;
		this.name = name;
		this.birthday = birthday;
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
