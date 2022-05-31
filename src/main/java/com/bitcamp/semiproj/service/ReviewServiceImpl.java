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
	public void deleteReview(int reviewID) {
		// TODO Auto-generated method stub
		dao.deleteReview(reviewID);
	}

	@Override
	public void updateReview(ReviewDto dto) {
		// TODO Auto-generated method stub
		dao.updateReview(dto);
	}

	@Override
	public List<ReviewDto> findReviewListByMovieId(int movieID, int start, int perPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movieID", movieID);
		map.put("start", start);
		map.put("perPage", perPage);
		return dao.findReviewListByMovieId(map);
	}

	@Override
	public int findReviewTotalCountByMovieId(int movieID) {
		// TODO Auto-generated method stub
		return dao.findReviewTotalCountByMovieId(movieID);
	}
	
	@Override
	public double findReviewRatingAvgByMovieId(int movieID) {
		return dao.findReviewRatingAvgByMovieId(movieID);
	}
	
	@Override
	public int findSumReviewRating(int movieID) {
		Integer sum = dao.findSumReviewRating(movieID);
		if(sum == null) {
			return sum = 0;
		} else {
			return sum;
		}
	}

	@Override
	public List<ReviewDto> checkUserReview(ReviewDto dto) {
		return dao.checkUserReview(dto);
	}
}
