package com.bitcamp.semiproj.domain;

public class ScreenSeatDto {
	private Integer screenID;
	private Integer row_qty;
	private Integer column_qty;
	private Integer total_seat_qty;
	
	public Integer getScreenID() {
		return screenID;
	}
	public void setScreenID(Integer screenID) {
		this.screenID = screenID;
	}
	public Integer getRow_qty() {
		return row_qty;
	}
	public void setRow_qty(Integer row_qty) {
		this.row_qty = row_qty;
	}
	public Integer getColumn_qty() {
		return column_qty;
	}
	public void setColumn_qty(Integer column_qty) {
		this.column_qty = column_qty;
	}
	public Integer getTotal_seat_qty() {
		return row_qty*column_qty;
	}
	
	@Override
	public String toString() {
		return "ScreenSeatDto [screenID=" + screenID + ", row_qty=" + row_qty + ", column_qty=" + column_qty
				+ ", total_seat_qty=" + total_seat_qty + "]";
	}
	
}
