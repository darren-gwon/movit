package com.bitcamp.semiproj.domain;

public class ScreenDto {
	private Integer screen_id;
	private String theater_name;
	private String screen_name;
	private String class_type;
	private Integer seat_rows;
	private Integer seat_columns;
	private Integer taken_seats;
	private Integer total_seats;

	public Integer getTotal_seats() {
		return total_seats;
	}
	public void setTotal_seats(Integer total_seats) {
		this.total_seats = total_seats;
	}
	public Integer getScreen_id() {
		return screen_id;
	}
	public void setScreen_id(Integer screen_id) {
		this.screen_id = screen_id;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}
	public Integer getSeat_rows() {
		return seat_rows;
	}
	public void setSeat_rows(Integer seat_rows) {
		this.seat_rows = seat_rows;
	}
	public Integer getSeat_columns() {
		return seat_columns;
	}
	public void setSeat_columns(Integer seat_columns) {
		this.seat_columns = seat_columns;
	}

	@Override
	public String toString() {
		return "ScreenDto [screen_id=" + screen_id + ", theater_name=" + theater_name + ", screen_name=" + screen_name
				+ ", class_type=" + class_type + ", seat_rows=" + seat_rows + ", seat_columns=" + seat_columns
				+ ", total_seats=" + total_seats + "]";
	}
	public Integer getTaken_seats() {
		return taken_seats;
	}
	public void setTaken_seats(Integer taken_seats) {
		this.taken_seats = taken_seats;
	}

	
	

}
