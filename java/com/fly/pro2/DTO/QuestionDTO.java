package com.fly.pro2.DTO;

public class QuestionDTO {

	private int qno;
	private String qtitle;
	private String qcontent;
	private String qkind;
	private String qdate;
	private int fk_seq;
	private String qid;
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQkind() {
		return qkind;
	}
	public void setQkind(String qkind) {
		this.qkind = qkind;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	public int getFk_seq() {
		return fk_seq;
	}
	public void setFk_seq(int fk_seq) {
		this.fk_seq = fk_seq;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	@Override
	public String toString() {
		return "QuestionDTO [qno=" + qno + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qkind=" + qkind
				+ ", qdate=" + qdate + ", fk_seq=" + fk_seq + ", qid=" + qid + "]";
	}
	
	

}
