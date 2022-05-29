package com.bitcamp.semiproj.domain;

import org.apache.ibatis.type.Alias;

@Alias("EventDto")
public class EventDto {
	int seq;
	String title;
	String content;	
	int view_cnt;
	int fileadminID;
	String start_date;
	String end_date;
	int startnum;
	int perpage;
	String main_img;
	String thumbnail_img;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getFileadminID() {
		return fileadminID;
	}
	public void setFileadminID(int fileadminID) {
		this.fileadminID = fileadminID;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	@Override
	public String toString() {
		return "EventDto [seq=" + seq + ", title=" + title + ", content=" + content + ", view_cnt=" + view_cnt
				+ ", fileadminID=" + fileadminID + ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}
	public int getStartnum() {
		return startnum;
	}
	public void setStartnum(int startnum) {
		this.startnum = startnum;
	}
	public int getPerpage() {
		return perpage;
	}
	public void setPerpage(int perpage) {
		this.perpage = perpage;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getthumbnail_img() {
		return thumbnail_img;
	}
	public void setthumbnail_img(String thumbnail_img) {
		this.thumbnail_img = thumbnail_img;
	}
	
	
	
}
