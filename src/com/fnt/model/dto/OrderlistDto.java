package com.fnt.model.dto;

public class OrderlistDto {
	private int olno;
	private String olid;
	private String olsellnickname;
	private String olinvoice;
	private int olboardno;
	private DealBoardDto dealboarddto;
	
	
	public int getOlno() {
		return olno;
	}

	public void setOlno(int olno) {
		this.olno = olno;
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

	public String getOlinvoice() {
		return olinvoice;
	}

	public void setOlinvoice(String olinvoice) {
		this.olinvoice = olinvoice;
	}

	public int getOlboardno() {
		return olboardno;
	}

	public void setOlboardno(int olboardno) {
		this.olboardno = olboardno;
	}
	
	
	public OrderlistDto(int olno, String olid, String olsellnickname, String olinvoice, int olboardno,
			DealBoardDto dealboarddto) {
		super();
		this.olno = olno;
		this.olid = olid;
		this.olsellnickname = olsellnickname;
		this.olinvoice = olinvoice;
		this.olboardno = olboardno;
		this.dealboarddto = dealboarddto;
	}
	
	public DealBoardDto getDealboarddto() {
		return dealboarddto;
	}
	public void setDealboarddto(DealBoardDto dealboarddto) {
		this.dealboarddto = dealboarddto;
	}
	public OrderlistDto() {
		
	}
	public OrderlistDto(int olno, String olid, String olsellnickname, String olinvoice, int olboardno) {
		super();
		this.olno = olno;
		this.olid = olid;
		this.olsellnickname = olsellnickname;
		this.olinvoice = olinvoice;
		this.olboardno = olboardno;
	}
	
	

	
}
