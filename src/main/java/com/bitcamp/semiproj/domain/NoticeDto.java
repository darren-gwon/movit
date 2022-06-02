package com.bitcamp.semiproj.domain;

import org.apache.ibatis.type.Alias;

@Alias("NoticeDto")
public class NoticeDto {
		int seq;
		String title;
		String content;
		String write_date;
		int view_cnt;
		String type;

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
		public String getWrite_date() {
			return write_date;
		}
		public void setWrite_date(String write_date) {
			this.write_date = write_date;
		}
		public int getView_cnt() {
			return view_cnt;
		}
		public void setView_cnt(int view_cnt) {
			this.view_cnt = view_cnt;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}

		
}
