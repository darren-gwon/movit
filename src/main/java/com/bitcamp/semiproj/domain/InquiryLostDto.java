package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;
import java.util.Date;

public class InquiryLostDto {
	private int seq;
	private int theaterID;
	private String item_type;
	private String lost_date;
	private int status;
	private String user_id;
	private int guestID;
	private String title;
	private String content;
	private int fileID;
	private int view_cnt;
	private Timestamp write_date;

	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getTheaterID() {
		return theaterID;
	}
	public void setTheaterID(int theaterID) {
		this.theaterID = theaterID;
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
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getGuestID() {
		return guestID;
	}
	public void setGuestID(int guestID) {
		this.guestID = guestID;
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
	public int getFileID() {
		return fileID;
	}
	public void setFileID(int fileID) {
		this.fileID = fileID;
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
	
	
}
