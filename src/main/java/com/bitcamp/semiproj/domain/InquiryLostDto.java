package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;
import java.util.Date;

public class InquiryLostDto {
	private int seq;
	private String theater_id;
	private String item_type;
	private String lost_date;
	private int status;
	private String user_id;
	private int guest_id;
	private String title;
	private String content;
	private int file_id;
	private int view_cnt;
	private Timestamp write_date;

	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
	public String getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(String theater_id) {
		this.theater_id = theater_id;
	}
	public String getItem_type() {
		return item_type;
	}
	public String getLost_date() {
		return lost_date;
	}
	public void setLost_date(String lost_date) {
		this.lost_date = lost_date;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getGuest_id() {
		return guest_id;
	}
	public void setGuest_id(int guest_id) {
		this.guest_id = guest_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
