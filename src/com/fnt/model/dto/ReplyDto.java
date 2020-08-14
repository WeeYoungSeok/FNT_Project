package com.fnt.model.dto;

import java.sql.Date;

public class ReplyDto {
	private int replyno;
	private String replyid;
	private String replynickname;
	private int replyboardno;
	private int replygroupno;
	private int replygroupnoseq;
	private String replytitletab;
	private String replytitle;
	private Date replyregdate;
	
	public ReplyDto() {
		
	}
	
	public ReplyDto(String replyid, String replynickname, int replyboardno, String replytitle) {
		this.replyid = replyid;
		this.replynickname = replynickname;
		this.replyboardno = replyboardno;
		this.replytitle = replytitle;
	}
	public ReplyDto(int parentreplyno, String replyid, String replynickname, int replyboardno, String replytitle) {
		this.replyno = parentreplyno;
		this.replyid = replyid;
		this.replynickname = replynickname;
		this.replyboardno = replyboardno;
		this.replytitle = replytitle;
	}

	public ReplyDto(int replyno, String replyid, String replynickname, int replyboardno, int replygroupno,
			int replygroupnoseq, String replytitletab, String replytitle, Date replyregdate) {
		super();
		this.replyno = replyno;
		this.replyid = replyid;
		this.replynickname = replynickname;
		this.replyboardno = replyboardno;
		this.replygroupno = replygroupno;
		this.replygroupnoseq = replygroupnoseq;
		this.replytitletab = replytitletab;
		this.replytitle = replytitle;
		this.replyregdate = replyregdate;
	}

	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}

	public String getReplyid() {
		return replyid;
	}

	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}

	public String getReplynickname() {
		return replynickname;
	}

	public void setReplynickname(String replynickname) {
		this.replynickname = replynickname;
	}

	public int getReplyboardno() {
		return replyboardno;
	}

	public void setReplyboardno(int replyboardno) {
		this.replyboardno = replyboardno;
	}

	public int getReplygroupno() {
		return replygroupno;
	}

	public void setReplygroupno(int replygroupno) {
		this.replygroupno = replygroupno;
	}

	public int getReplygroupnoseq() {
		return replygroupnoseq;
	}

	public void setReplygroupnoseq(int replygroupnoseq) {
		this.replygroupnoseq = replygroupnoseq;
	}

	public String getReplytitletab() {
		return replytitletab;
	}

	public void setReplytitletab(String replytitletab) {
		this.replytitletab = replytitletab;
	}

	public String getReplytitle() {
		return replytitle;
	}

	public void setReplytitle(String replytitle) {
		this.replytitle = replytitle;
	}

	public Date getReplyregdate() {
		return replyregdate;
	}

	public void setReplyregdate(Date replyregdate) {
		this.replyregdate = replyregdate;
	}

	@Override
	public String toString() {
		return "ReplyDto [replyno=" + replyno + ", replyid=" + replyid + ", replynickname=" + replynickname
				+ ", replyboardno=" + replyboardno + ", replygroupno=" + replygroupno + ", replygroupnoseq="
				+ replygroupnoseq + ", replytitletab=" + replytitletab + ", replytitle=" + replytitle
				+ ", replyregdate=" + replyregdate + "]";
	}
	
	
}
