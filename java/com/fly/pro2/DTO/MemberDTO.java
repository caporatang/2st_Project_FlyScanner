package com.fly.pro2.DTO;

public class MemberDTO {
	
	String email;
	String id;
	String pw;
	String enamef;
	String enamel;
	String kname;
	String gender;
	String birth;
	String tel;
	String country;
	int coupon;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEnamef() {
		return enamef;
	}
	public void setEnamef(String enamef) {
		this.enamef = enamef;
	}
	public String getEnamel() {
		return enamel;
	}
	public void setEnamel(String enamel) {
		this.enamel = enamel;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	@Override
	public String toString() {
		return "MemberDTO [email=" + email + ", id=" + id + ", pw=" + pw + ", enamef=" + enamef + ", enamel=" + enamel
				+ ", kname=" + kname + ", gender=" + gender + ", birth=" + birth + ", tel=" + tel + ", country="
				+ country + ", coupon=" + coupon + "]";
	}
	
	
	
	
	
	
}
