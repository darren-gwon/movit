package com.bitcamp.semiproj.domain;

public class LikesDto {
	

	private int likeID;
	private int movieID;
	private String user_id;
	private int total_likes;
	private String like_date;
	private int reviewID;
	
	public int getLikeID() {
		return likeID;
	}
	public void setLikeID(int likeID) {
		this.likeID = likeID;
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
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	
	@Override
	public String toString() {
		return "LikesDto [likeID=" + likeID + ", movieID=" + movieID + ", user_id=" + user_id + ", total_likes="
				+ total_likes + ", like_date=" + like_date + ", reviewID=" + reviewID + "]";
	}
	
}
