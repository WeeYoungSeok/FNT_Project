package com.fnt.model.dto;

import java.util.Date;

public class ReportDto {
	private String receiveid;
	private String sendnickname;
	private String receivenickname;
	private String reporttitle;
	private String reportcontent;
	private Date reportregdate;
	
	public ReportDto() {
		
	}
	
	public ReportDto(String receiveid, String sendnickname, String receivenickname, String reporttitle,
			String reportcontent, Date reportregdate) {
		super();
		this.receiveid = receiveid;
		this.sendnickname = sendnickname;
		this.receivenickname = receivenickname;
		this.reporttitle = reporttitle;
		this.reportcontent = reportcontent;
		this.reportregdate = reportregdate;
	}

	public String getReceiveid() {
		return receiveid;
	}

	public void setReceiveid(String receiveid) {
		this.receiveid = receiveid;
	}

	public String getSendnickname() {
		return sendnickname;
	}

	public void setSendnickname(String sendnickname) {
		this.sendnickname = sendnickname;
	}

	public String getReceivenickname() {
		return receivenickname;
	}

	public void setReceivenickname(String receivenickname) {
		this.receivenickname = receivenickname;
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
