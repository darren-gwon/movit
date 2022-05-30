package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.ReviewDto;

public interface ReviewService {

	List<ReviewDto> findAllReviewList();
	void insertReview(ReviewDto dto);
	void deleteReview(int reviewID);
	void updateReview(ReviewDto dto);
	List<ReviewDto> findReviewListByMovieId(int movieID, int start, int perPage);
	int findReviewTotalCountByMovieId(int movieID);
	double findReviewRatingAvgByMovieId(int movieID);
	int findSumReviewRating(int movieID);
	List<ReviewDto> checkUserReview(ReviewDto dto);
}
