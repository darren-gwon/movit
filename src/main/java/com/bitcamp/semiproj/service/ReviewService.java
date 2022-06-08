package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.ReviewDto;

public interface ReviewService {

	List<ReviewDto> findAllReviewList();
	void insertReview(ReviewDto dto);
	void deleteReview(int review_id);
	void updateReview(ReviewDto dto);
	List<ReviewDto> findReviewListByMovie_id(int movie_id, int start, int perPage);
	int findReviewTotalCountByMovie_id(int movie_id);
	double findReviewRatingAvgByMovie_id(int movie_id);
	int findSumReviewRating(int movie_id);
	List<ReviewDto> checkUserReview(ReviewDto dto);
}
