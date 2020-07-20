package com.fnt.model.dto;

import java.util.Date;

public class ReportDto {
	
	private int reportno;
	private String sendid;
	private String receiveid;
	private String reporttitle;
	private String reportcontent;
	private Date reportregdate;
	
	public ReportDto() {
		
	}
	
	public ReportDto(int reportno, String sendid, String receiveid, String reporttitle, String reportcontent,
			Date reportregdate) {
		super();
		this.reportno = reportno;
		this.sendid = sendid;
		this.receiveid = receiveid;
		this.reporttitle = reporttitle;
		this.reportcontent = reportcontent;
		this.reportregdate = reportregdate;
	}
	public int getReportno() {
		return reportno;
	}
	public void setReportno(int reportno) {
		this.reportno = reportno;
	}
	public String getSendid() {
		return sendid;
	}
	public void setSendid(String sendid) {
		this.sendid = sendid;
	}
	public String getReceiveid() {
		return receiveid;
	}
	public void setReceiveid(String receiveid) {
		this.receiveid = receiveid;
	}
	public String getReporttitle() {
		return reporttitle;
	}
	public void setReporttitle(String reporttitle) {
		this.reporttitle = reporttitle;
	}
	public String getReportcontent() {
		return reportcontent;
	}
	public void setReportcontent(String reportcontent) {
		this.reportcontent = reportcontent;
	}
	public Date getReportregdate() {
		return reportregdate;
	}
	public void setReportregdate(Date reportregdate) {
		this.reportregdate = reportregdate;
	}
}
