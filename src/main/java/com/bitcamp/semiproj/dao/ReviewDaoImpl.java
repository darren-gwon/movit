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
	
	public void deleteReview(int reviewID) {
		session.delete(namespace+"deleteReview", reviewID);
	}
	public void updateReview(ReviewDto dto) {
		session.update(namespace+"updateReview", dto);
	}
	public List<ReviewDto> findReviewListByMovieId(Map<String, Object> map) {
		return session.selectList(namespace+"findReviewListByMovieId", map);
	}
	
	public int findReviewTotalCountByMovieId(int movieID) {
		return session.selectOne(namespace + "findReviewTotalCountByMovieId", movieID);
	}
	
	@Override
	public double findReviewRatingAvgByMovieId(int movieID) {
		return session.selectOne(namespace + "findReviewRatingAvgByMovieId", movieID);
	}
	
	@Override
	public int findSumReviewRating(int movieID) {
		return session.selectOne(namespace + "findSumReviewRating", movieID);
	}
	
	@Override
	public List<ReviewDto> checkUserReview(ReviewDto dto) {
		return session.selectList(namespace + "checkUserReview", dto);
	}
}
