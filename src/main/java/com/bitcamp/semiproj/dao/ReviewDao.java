package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.ReviewDto;

public interface ReviewDao {
	List<ReviewDto> findAllReviewList();
	void insertReview(ReviewDto dto);
	void deleteReview(int review_id);
	void updateReview(ReviewDto dto);
	List<ReviewDto> findReviewListByMovie_id(Map<String, Object> map);
	int findReviewTotalCountByMovie_id(int movie_id);
	double findReviewRatingAvgByMovie_id(int movie_id);
	int findSumReviewRating(int movie_id);
	List<ReviewDto> checkUserReview(ReviewDto dto);
}
