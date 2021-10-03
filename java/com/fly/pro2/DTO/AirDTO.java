package com.fly.pro2.DTO;

public class AirDTO {
	private String ticketno;
	private int ticketprice;
	private String ticketst;
	private String ticketsp;
	private String stdate;
	private String spdate;
	private int people;
	public String getTicketno() {
		return ticketno;
	}
	public void setTicketno(String ticketno) {
		this.ticketno = ticketno;
	}
	public int getTicketprice() {
		return ticketprice;
	}
	public void setTicketprice(int ticketprice) {
		this.ticketprice = ticketprice;
	}
	public String getTicketst() {
		return ticketst;
	}
	public void setTicketst(String ticketst) {
		this.ticketst = ticketst;
	}
	public String getTicketsp() {
		return ticketsp;
	}
	public void setTicketsp(String ticketsp) {
		this.ticketsp = ticketsp;
	}
	public String getStdate() {
		return stdate;
	}
	public void setStdate(String stdate) {
		this.stdate = stdate;
	}
	public String getSpdate() {
		return spdate;
	}
	public void setSpdate(String spdate) {
		this.spdate = spdate;
	}

	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	@Override
	public String toString() {
		return "AirDTO [ticketno=" + ticketno + ", ticketprice=" + ticketprice + ", ticketst=" + ticketst
				+ ", ticketsp=" + ticketsp + ", stdate=" + stdate + ", spdate=" + spdate  
				+ ", people=" + people + "]";
	}
	
	
	
}	