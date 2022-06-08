package com.bitcamp.semiproj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.ReviewDao;
import com.bitcamp.semiproj.domain.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao dao;
	
	@Override
	public List<ReviewDto> findAllReviewList() {
		// TODO Auto-generated method stub
		return dao.findAllReviewList();
	}

	@Override
	public void insertReview(ReviewDto dto) {
		// TODO Auto-generated method stub
		dao.insertReview(dto);
	}

	@Override
	public void deleteReview(int review_id) {
		// TODO Auto-generated method stub
		dao.deleteReview(review_id);
	}

	@Override
	public void updateReview(ReviewDto dto) {
		// TODO Auto-generated method stub
		dao.updateReview(dto);
	}

	@Override
	public List<ReviewDto> findReviewListByMovie_id(int movie_id, int start, int perPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_id", movie_id);
		map.put("start", start);
		map.put("perPage", perPage);
		return dao.findReviewListByMovie_id(map);
	}

	@Override
	public int findReviewTotalCountByMovie_id(int movie_id) {
		// TODO Auto-generated method stub
		return dao.findReviewTotalCountByMovie_id(movie_id);
	}
	
	@Override
	public double findReviewRatingAvgByMovie_id(int movie_id) {
		return dao.findReviewRatingAvgByMovie_id(movie_id);
	}
	
	@Override
	public int findSumReviewRating(int movie_id) {
		int sum = dao.findSumReviewRating(movie_id);
			return sum;
	}

	@Override
	public List<ReviewDto> checkUserReview(ReviewDto dto) {
		return dao.checkUserReview(dto);
	}
}
