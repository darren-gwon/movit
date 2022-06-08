package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;
import java.util.List;

public class BookingDto {

	private Integer seq;
	private String booking_id;
	private Integer schedule_id;
	private String pay_tid;
	private String user_id;
	private Integer quantity;
	private Timestamp booking_time;
	private List<OwnSeatDto> ownSeatList;
	private String item_name;
	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}
	public Integer getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(Integer schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getPay_tid() {
		return pay_tid;
	}
	public void setPay_tid(String pay_tid) {
		this.pay_tid = pay_tid;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Timestamp getBooking_time() {
		return booking_time;
	}
	public void setBooking_time(Timestamp booking_time) {
		this.booking_time = booking_time;
	}
	public List<OwnSeatDto> getOwnSeatList() {
		return ownSeatList;
	}
	public void setOwnSeatList(List<OwnSeatDto> ownSeatList) {
		this.ownSeatList = ownSeatList;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	@Override
	public String toString() {
		return "BookingDto [seq=" + seq + ", booking_id=" + booking_id + ", schedule_id=" + schedule_id + ", pay_tid="
				+ pay_tid + ", user_id=" + user_id + ", quantity=" + quantity + ", booking_time=" + booking_time
				+ ", ownSeatList=" + ownSeatList + "]";
	}
	
	
	
}
