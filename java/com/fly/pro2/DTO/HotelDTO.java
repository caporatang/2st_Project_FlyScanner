package com.fly.pro2.DTO;

//import java.sql.Date;

public class HotelDTO {
	private String hid;
	private String hname;
	private String hregion;
	private String himage;
	private String checkin;
	private String checkout;
	private int guestnum;
	private String roomsort;
	private int stdprice;
	private int stdnum;
	private String keyword;
	private double htlat;
	private double htlong;
	
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHregion() {
		return hregion;
	}
	public void setHregion(String hregion) {
		this.hregion = hregion;
	}
	public String getHimage() {
		return himage;
	}
	public void setHimage(String himage) {
		this.himage = himage;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getGuestnum() {
		return guestnum;
	}
	public void setGuestnum(int guestnum) {
		this.guestnum = guestnum;
	}
	public String getRoomsort() {
		return roomsort;
	}
	public void setRoomsort(String roomsort) {
		this.roomsort = roomsort;
	}
	public int getStdprice() {
		return stdprice;
	}
	public void setStdprice(int stdprice) {
		this.stdprice = stdprice;
	}
	public int getStdnum() {
		return stdnum;
	}
	public void setStdnum(int stdnum) {
		this.stdnum = stdnum;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public double getHtlat() {
		return htlat;
	}
	public void setHtlat(double htlat) {
		this.htlat = htlat;
	}
	public double getHtlong() {
		return htlong;
	}
	public void setHtlong(double htlong) {
		this.htlong = htlong;
	}
	@Override
	public String toString() {
		return "HotelDTO [hid=" + hid + ", hname=" + hname + ", hregion=" + hregion + ", himage=" + himage
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", guestnum=" + guestnum + ", roomsort="
				+ roomsort + ", stdprice=" + stdprice + ", stdnum=" + stdnum + ", keyword=" + keyword + ", htlat="
				+ htlat + ", htlong=" + htlong + "]";
	}
	
}
