package com.fnt.model.dto;

public class WishlistDto {
	private int wlno;
	private String wlid;
	private String wlsellnickname;
	private int wlboardno;
	
	public WishlistDto() {
		
	}

	public WishlistDto(int wlno, String wlid, String wlsellnickname, int wlboardno) {
		super();
		this.wlno = wlno;
		this.wlid = wlid;
		this.wlsellnickname = wlsellnickname;
		this.wlboardno = wlboardno;
	}
	public String getWlid() {
		return wlid;
	}

	public void setWlid(String wlid) {
		this.wlid = wlid;
	}

	public String getWlsellnickname() {
		return wlsellnickname;
	}

	public void setWlsellnickname(String wlsellnickname) {
		this.wlsellnickname = wlsellnickname;
	}

	public int getWlno() {
		return wlno;
	}
	public void setWlno(int wlno) {
		this.wlno = wlno;
	}
	public int getWlboardno() {
		return wlboardno;
	}
	public void setWlboardno(int wlboardno) {
		this.wlboardno = wlboardno;
	}
}
