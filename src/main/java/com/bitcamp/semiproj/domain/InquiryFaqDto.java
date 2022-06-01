package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;

public class InquiryFaqDto{
	private int seq;
	private String inquiry_type;
	private String title;
	private String content;
	private Timestamp write_date;

	public String getInquiry_type() {
		return inquiry_type;
	}
	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
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
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	@Override
	public String toString() {
		return "InquiryFaqDto [seq=" + seq + ", inquiry_type=" + inquiry_type + ", title=" + title + ", content="
				+ content + ", write_date=" + write_date + "]";
	}

}
