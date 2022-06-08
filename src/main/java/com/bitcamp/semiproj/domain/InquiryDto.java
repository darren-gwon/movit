package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("InquiryDto")
public class InquiryDto {
	private int seq;
	private	String theater_id;
	private String inquiry_type;
	private String user_id;
	private	int guest_id;
	private	String title;
	private String content;
	private Timestamp write_date;
	private int view_cnt;
	private	int file_id;
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
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	@Override
	public String toString() {
		return "InquiryDto [seq=" + seq + ", theater_id=" + theater_id + ", inquiry_type=" + inquiry_type + ", user_id="
				+ user_id + ", guest_id=" + guest_id + ", title=" + title + ", content=" + content + ", write_date="
				+ write_date + ", view_cnt=" + view_cnt + ", file_id=" + file_id + "]";
	}
	
	
	
}
