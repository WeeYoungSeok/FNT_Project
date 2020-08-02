package com.fnt.model.dto;

public class AlertDto {
	
	//알람번호
	private int alertno;

	//알람받을 id
	private String alertid;
	//알람 받을 글의 번호
	private int alertboardno;
	//알람이 달렸으면 Y, 안달렸으면 N
	private String alertflag;
	
	private DealBoardDto dealboarddto;

	public AlertDto(int alertno, String alertid, int alertboardno, String alertflag, DealBoardDto dealboarddto) {
		super();
		this.alertno = alertno;
		this.alertid = alertid;
		this.alertboardno = alertboardno;
		this.alertflag = alertflag;
		this.dealboarddto = dealboarddto;
	}

	
	public AlertDto() {
		
	}
	
	public AlertDto(int alertno, String alertid, int alertboardno, String alertflag) {
		super();
		this.alertno = alertno;
		this.alertid = alertid;
		this.alertboardno = alertboardno;
		this.alertflag = alertflag;
	}
	public DealBoardDto getDealboarddto() {
		return dealboarddto;
	}
	
	
	public void setDealboarddto(DealBoardDto dealboarddto) {
		this.dealboarddto = dealboarddto;
	}
	public int getAlertno() {
		return alertno;
	}
	
	public void setAlertno(int alertno) {
		this.alertno = alertno;
	}
	
	public String getAlertid() {
		return alertid;
	}
	
	public void setAlertid(String alertid) {
		this.alertid = alertid;
	}
	
	public int getAlertboardno() {
		return alertboardno;
	}
	
	public void setAlertboardno(int alertboardno) {
		this.alertboardno = alertboardno;
	}
	
	public String getAlertflag() {
		return alertflag;
	}
	
	public void setAlertflag(String alertflag) {
		this.alertflag = alertflag;
	}
}
