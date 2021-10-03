package com.fly.pro2.DTO;
public class HotelBookDTO {

	private String hotelBookNo;
	private String hId;
	private String id;
	private String hName;
	private String hRegion;
	private String checkIn;
	private String checkOut;
	private int guestNum; 
	private String roomSort; 
	private int standPrice;
	private String kName;
	private String birth;
	private String gender;
	private String eFirth;
	private String eLast;
	private String tel;
	private String email;
	private int total;
	private int coupon;
	private int stdNum;
	
	public int getStdNum() {
		return stdNum;
	}
	public void setStdNum(int stdNum) {
		this.stdNum = stdNum;
	}
	public String getHotelBookNo() {
		return hotelBookNo;
	}
	public void setHotelBookNo(String hotelBookNo) {
		this.hotelBookNo = hotelBookNo;
	}
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethRegion() {
		return hRegion;
	}
	public void sethRegion(String hRegion) {
		this.hRegion = hRegion;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(int guestNum) {
		this.guestNum = guestNum;
	}
	public String getRoomSort() {
		return roomSort;
	}
	public void setRoomSort(String roomSort) {
		this.roomSort = roomSort;
	}
	public int getStandPrice() {
		return standPrice;
	}
	public void setStandPrice(int standPrice) {
		this.standPrice = standPrice;
	}
	public String getkName() {
		return kName;
	}
	public void setkName(String kName) {
		this.kName = kName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String geteFirth() {
		return eFirth;
	}
	public void seteFirth(String eFirth) {
		this.eFirth = eFirth;
	}
	public String geteLast() {
		return eLast;
	}
	public void seteLast(String eLast) {
		this.eLast = eLast;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	@Override
	public String toString() {
		return "HotelBookDTO [hotelBookNo=" + hotelBookNo + ", hId=" + hId + ", id=" + id + ", hName=" + hName
				+ ", hRegion=" + hRegion + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", guestNum=" + guestNum
				+ ", roomSort=" + roomSort + ", standPrice=" + standPrice + ", kName=" + kName + ", birth=" + birth
				+ ", gender=" + gender + ", eFirth=" + eFirth + ", eLast=" + eLast + ", tel=" + tel + ", email=" + email
				+ ", total=" + total + ", coupon=" + coupon + ", stdNum=" + stdNum + "]";
	}
	
	
	
	
	
	
	}
