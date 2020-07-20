package com.fnt.model.dto;

public class WishlistDto {

	private int wlno;
	private int wlboardno;
	
	public WishlistDto() {
		
	}
	public WishlistDto(int wlno, int wlboardno) {
		super();
		this.wlno = wlno;
		this.wlboardno = wlboardno;
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
