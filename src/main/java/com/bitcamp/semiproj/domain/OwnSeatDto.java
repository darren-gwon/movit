package com.bitcamp.semiproj.domain;

public class OwnSeatDto {
	private Integer seq;
	private String booking_id;
	private Integer schedule_id;
	private String user_id;
	private String row_no;
	private String column_no;
	private Integer status;
	
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRow_no() {
		return row_no;
	}
	public void setRow_no(String row_no) {
		this.row_no = row_no;
	}
	public String getColumn_no() {
		return column_no;
	}
	public void setColumn_no(String column_no) {
		this.column_no = column_no;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "OwnSeatDto [booking_id=" + booking_id + ", schedule_id=" + schedule_id + ", user_id=" + user_id
				+ ", row_no=" + row_no + ", column_no=" + column_no + ", status=" + status + "]";
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	
}
