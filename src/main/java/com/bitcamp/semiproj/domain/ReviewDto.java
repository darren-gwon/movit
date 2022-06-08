package com.bitcamp.semiproj.domain;

import java.sql.Timestamp;


public class ReviewDto {
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public int getTotal_likes() {
		return total_likes;
	}
	public void setTotal_likes(int total_likes) {
		this.total_likes = total_likes;
	}
	@Override
	public String toString() {
		return "ReviewDto [start=" + start + ", perPage=" + perPage + ", totalReviewCount=" + totalReviewCount
				+ ", review_id=" + review_id + ", movie_id=" + movie_id + ", user_id=" + user_id + ", content=" + content
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
	private int review_id;
	private int movie_id;
	private String user_id;
	private String content;
	private String rating;
	private int likes;
	private String write_date;
	private int total_likes;
	private String title;
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
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
