package com.fly.pro2.DTO;

public class FaqDTO {
	
	int fNo;
	int fKind;
	String fTitle;
	String fContent;
	
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public int getfKind() {
		return fKind;
	}
	public void setfKind(int fKind) {
		this.fKind = fKind;
	}
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
	}
	@Override
	public String toString() {
		return "FaqDTO [fNo=" + fNo + ", fKind=" + fKind + ", fTitle=" + fTitle + ", fContent=" + fContent + "]";
	}
	
	
}
