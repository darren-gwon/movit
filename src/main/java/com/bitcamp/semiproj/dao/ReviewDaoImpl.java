package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
    private SqlSession session;

	private static String namespace = "com.bitcamp.semiproj.dao.ReviewDao.";

	@Override
	public List<ReviewDto> findAllReviewList() {
    	return session.selectList(namespace+"findAllReviewList");
	}
	
	public void insertReview(ReviewDto dto) {
		session.insert(namespace+"insertReview", dto);
	}
	
	public void deleteReview(int review_id) {
		session.delete(namespace+"deleteReview", review_id);
	}
	public void updateReview(ReviewDto dto) {
		session.update(namespace+"updateReview", dto);
	}
	public List<ReviewDto> findReviewListByMovie_id(Map<String, Object> map) {
		return session.selectList(namespace+"findReviewListByMovie_id", map);
	}
	
	public int findReviewTotalCountByMovie_id(int movie_id) {
		return session.selectOne(namespace + "findReviewTotalCountByMovie_id", movie_id);
	}
	
	@Override
	public double findReviewRatingAvgByMovie_id(int movie_id) {
		return session.selectOne(namespace + "findReviewRatingAvgByMovie_id", movie_id);
	}
	
	@Override
	public int findSumReviewRating(int movie_id) {
		return session.selectOne(namespace + "findSumReviewRating", movie_id);
	}
	
	@Override
	public List<ReviewDto> checkUserReview(ReviewDto dto) {
		return session.selectList(namespace + "checkUserReview", dto);
	}
}
