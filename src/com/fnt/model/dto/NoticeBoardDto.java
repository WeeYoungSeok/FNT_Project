package com.fnt.model.dto;

public class NoticeBoardDto {

	private int nbboardno;
	private String nbid;
	private String nbtitle;
	private String nbcontent;
	private String nbregdate;
	
	public NoticeBoardDto() {
	}

	public NoticeBoardDto(int nbboardno, String nbid, String nbtitle, String nbcontent, String nbregdate) {
		this.nbboardno = nbboardno;
		this.nbid = nbid;
		this.nbtitle = nbtitle;
		this.nbcontent = nbcontent;
		this.nbregdate = nbregdate;
	}

	public int getNbboardno() {
		return nbboardno;
	}

	public void setNbboardno(int nbboardno) {
		this.nbboardno = nbboardno;
	}

	public String getNbid() {
		return nbid;
	}

	public void setNbid(String nbid) {
		this.nbid = nbid;
	}

	public String getNbtitle() {
		return nbtitle;
	}

	public void setNbtitle(String nbtitle) {
		this.nbtitle = nbtitle;
	}

	public String getNbcontent() {
		return nbcontent;
	}

	public void setNbcontent(String nbcontent) {
		this.nbcontent = nbcontent;
	}

	public String getNbregdate() {
		return nbregdate;
	}

	public void setNbregdate(String nbregdate) {
		this.nbregdate = nbregdate;
	}
	
	
	
	
	
}
