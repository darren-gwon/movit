package com.bitcamp.semiproj.domain;

public class LikesDto {
	

	private int like_id;
	private int movie_id;
	private String user_id;
	private int total_likes;
	private String like_date;
	private int review_id;
	
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
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
	public int getTotal_likes() {
		return total_likes;
	}
	public void setTotal_likes(int total_likes) {
		this.total_likes = total_likes;
	}
	public String getLike_date() {
		return like_date;
	}
	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	
	@Override
	public String toString() {
		return "LikesDto [like_id=" + like_id + ", movie_id=" + movie_id + ", user_id=" + user_id + ", total_likes="
				+ total_likes + ", like_date=" + like_date + ", review_id=" + review_id + "]";
	}
	
}
