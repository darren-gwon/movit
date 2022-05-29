package com.bitcamp.semiproj.domain;

public class OwnSeatDto {
	private Integer seq;
	private String bookingID;
	private Integer scheduleID;
	private String user_id;
	private String row_no;
	private String column_no;
	private Integer status;
	
	public String getBookingID() {
		return bookingID;
	}
	public void setBookingID(String bookingID) {
		this.bookingID = bookingID;
	}
	public Integer getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(Integer scheduleID) {
		this.scheduleID = scheduleID;
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
		return "OwnSeatDto [bookingID=" + bookingID + ", scheduleID=" + scheduleID + ", user_id=" + user_id
				+ ", row_no=" + row_no + ", column_no=" + column_no + ", status=" + status + "]";
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	
}
