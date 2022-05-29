package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;


public class ReviewDto {
	@Override
	public String toString() {
		return "ReviewDto [start=" + start + ", perPage=" + perPage + ", totalReviewCount=" + totalReviewCount
				+ ", reviewID=" + reviewID + ", movieID=" + movieID + ", user_id=" + user_id + ", content=" + content
				+ ", rating=" + rating + ", likes=" + likes + ", write_date=" + write_date + "]";
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalReviewCount() {
		return totalReviewCount;
	}
	public void setTotalReviewCount(int totalReviewCount) {
		this.totalReviewCount = totalReviewCount;
	}
	
	private int start;
	private int perPage;
	private int totalReviewCount;
	private int reviewID;
	private int movieID;
	private String user_id;
	private String content;
	private String rating;
	private int likes;
	private String write_date;
	
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_day(String write_date) {
		this.write_date = write_date;
	}
	
	
	
}
