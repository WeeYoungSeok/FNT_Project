package com.fnt.model.dto;



public class QnaBoardDto {
	private int qbboardno;
	private String qbid;
	private String qbnickname;
	private String qbtitle;
	private String qbcontent;
	private String qbsecret;
	private String qbflag;
	private String qbregdate;
	private String qbredate;
	public QnaBoardDto(int qbboardno, String qbid, String qbnickname, String qbtitle, String qbcontent, String qbsecret,
			String qbflag, String qbregdate, String qbredate) {
		super();
		this.qbboardno = qbboardno;
		this.qbid = qbid;
		this.qbnickname = qbnickname;
		this.qbtitle = qbtitle;
		this.qbcontent = qbcontent;
		this.qbsecret = qbsecret;
		this.qbflag = qbflag;
		this.qbregdate = qbregdate;
		this.qbredate = qbredate;
	}
	public QnaBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getQbboardno() {
		return qbboardno;
	}
	public void setQbboardno(int qbboardno) {
		this.qbboardno = qbboardno;
	}
	public String getQbid() {
		return qbid;
	}
	public void setQbid(String qbid) {
		this.qbid = qbid;
	}
	public String getQbnickname() {
		return qbnickname;
	}
	public void setQbnickname(String qbnickname) {
		this.qbnickname = qbnickname;
	}
	public String getQbtitle() {
		return qbtitle;
	}
	public void setQbtitle(String qbtitle) {
		this.qbtitle = qbtitle;
	}
	public String getQbcontent() {
		return qbcontent;
	}
	public void setQbcontent(String qbcontent) {
		this.qbcontent = qbcontent;
	}
	public String getQbsecret() {
		return qbsecret;
	}
	public void setQbsecret(String qbsecret) {
		this.qbsecret = qbsecret;
	}
	public String getQbflag() {
		return qbflag;
	}
	public void setQbflag(String qbflag) {
		this.qbflag = qbflag;
	}
	public String getQbregdate() {
		return qbregdate;
	}
	public void setQbregdate(String qbregdate) {
		this.qbregdate = qbregdate;
	}
	public String getQbredate() {
		return qbredate;
	}
	public void setQbredate(String qbredate) {
		this.qbredate = qbredate;
	}
	
}
