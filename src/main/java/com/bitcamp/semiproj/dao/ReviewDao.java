package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.ReviewDto;

public interface ReviewDao {
	List<ReviewDto> findAllReviewList();
	void insertReview(ReviewDto dto);
	void deleteReview(int reviewID);
	void updateReview(ReviewDto dto);
	List<ReviewDto> findReviewListByMovieId(Map<String, Object> map);
	int findReviewTotalCountByMovieId(int movieID);
	double findReviewRatingAvgByMovieId(int movieID);
	int findSumReviewRating(int movieID);
	List<ReviewDto> checkUserReview(ReviewDto dto);
}
