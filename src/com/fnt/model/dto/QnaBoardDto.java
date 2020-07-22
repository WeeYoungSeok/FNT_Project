package com.fnt.model.dto;

import java.util.Date;

public class QnaBoardDto {
	private int qbboardno;
	private String qbid;
	private String qbnickname;
	private int qbgroupno;
	private int qbgroupseq;
	private int qbtitletab;
	private String qbtitle;
	private String qbcontent;
	private String qbsecret;
	private Date qbregdate;

	public QnaBoardDto() {
	}

	public QnaBoardDto(int qbboardno, String qbid, String qbnickname, int qbgroupno, int qbgroupseq, int qbtitletab,
			String qbtitle, String qbcontent, String qbsecret, Date qbregdate) {
		this.qbboardno = qbboardno;
		this.qbid = qbid;
		this.qbnickname = qbnickname;
		this.qbgroupno = qbgroupno;
		this.qbgroupseq = qbgroupseq;
		this.qbtitletab = qbtitletab;
		this.qbtitle = qbtitle;
		this.qbcontent = qbcontent;
		this.qbsecret = qbsecret;
		this.qbregdate = qbregdate;
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

	public int getQbgroupno() {
		return qbgroupno;
	}

	public void setQbgroupno(int qbgroupno) {
		this.qbgroupno = qbgroupno;
	}

	public int getQbgroupseq() {
		return qbgroupseq;
	}

	public void setQbgroupseq(int qbgroupseq) {
		this.qbgroupseq = qbgroupseq;
	}

	public int getQbtitletab() {
		return qbtitletab;
	}

	public void setQbtitletab(int qbtitletab) {
		this.qbtitletab = qbtitletab;
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

	public Date getQbregdate() {
		return qbregdate;
	}

	public void setQbregdate(Date qbregdate) {
		this.qbregdate = qbregdate;
	}

}
