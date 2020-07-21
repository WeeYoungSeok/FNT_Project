package com.fnt.model.dto;

public class OrderlistDto {
	private int olno;
	private String olid;
	private String olsellnickname;
	private int olinvoice;
	private int olboardno;
	
	public OrderlistDto() {
		
	}
	public OrderlistDto(int olno, String olid, String olsellnickname, int olinvoice, int olboardno) {
		super();
		this.olno = olno;
		this.olid = olid;
		this.olsellnickname = olsellnickname;
		this.olinvoice = olinvoice;
		this.olboardno = olboardno;
	}
	
	public String getOlid() {
		return olid;
	}

	public void setOlid(String olid) {
		this.olid = olid;
	}

	public String getOlsellnickname() {
		return olsellnickname;
	}

	public void setOlsellnickname(String olsellnickname) {
		this.olsellnickname = olsellnickname;
	}
	

	public int getOlno() {
		return olno;
	}
	public void setOlno(int olno) {
		this.olno = olno;
	}
	public int getOlinvoice() {
		return olinvoice;
	}
	public void setOlinvoice(int olinvoice) {
		this.olinvoice = olinvoice;
	}
	public int getOlboardno() {
		return olboardno;
	}
	public void setOlboardno(int olboardno) {
		this.olboardno = olboardno;
	}
}
