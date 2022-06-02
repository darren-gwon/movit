package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("InquiryDto")
public class InquiryDto {
	private int seq;
	private	String theaterID;
	private String inquiry_type;
	private String user_id;
	private	int guestID;
	private	String title;
	private String content;
	private Timestamp write_date;
	private int view_cnt;
	private	int fileID;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTheaterID() {
		return theaterID;
	}
	public void setTheaterID(String theaterID) {
		this.theaterID = theaterID;
	}
	public String getInquiry_type() {
		return inquiry_type;
	}
	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
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
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getFileID() {
		return fileID;
	}
	public void setFileID(int fileID) {
		this.fileID = fileID;
	}
	@Override
	public String toString() {
		return "InquiryDto [seq=" + seq + ", theaterID=" + theaterID + ", inquiry_type=" + inquiry_type + ", user_id="
				+ user_id + ", guestID=" + guestID + ", title=" + title + ", content=" + content + ", write_date="
				+ write_date + ", view_cnt=" + view_cnt + ", fileID=" + fileID + "]";
	}
	
	
	
}
