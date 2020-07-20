package com.fnt.model.dto;

public class OrderlistDto {
	
	private int olno;
	private int olinvoice;
	private int olboardno;
	
	public OrderlistDto() {
		
	}
	public OrderlistDto(int olno, int olinvoice, int olboardno) {
		super();
		this.olno = olno;
		this.olinvoice = olinvoice;
		this.olboardno = olboardno;
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
