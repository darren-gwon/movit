package com.bitcamp.semiproj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.MypageDto;
import com.bitcamp.semiproj.domain.ReviewDto;

@Repository
public class MypageDaoImpl implements MypageDao {
	
	@Autowired
    private SqlSession session;

	private static String namespace = "com.bitcamp.semiproj.dao.MypageDao.";
	
	@Override
	public MypageDto getUserData(String user_id) {
		return session.selectOne(namespace + "getUserData", user_id);
	}

	@Override
	public void updateMypage(MypageDto dto) {
		session.update(namespace + "updateMypage", dto);
	}
	
	@Override
	public String pwCheck(String user_id) {
		return session.selectOne(namespace + "pwCheck", user_id);
	}
	
	@Override
	public void pwUpdate(Map<String, String> map) {
		session.update(namespace + "pwUpdate", map);
	}
	
	@Override
	public void deleteAccount(String user_id) {
		session.delete(namespace + "deleteAccount", user_id);
	}
	
	@Override
	public int checkNickName(String nickname) {
		return session.selectOne(namespace + "checkNickName", nickname);
	}
	
	@Override
	public List<ReviewDto> getUserReviewList(String user_id) {
		return session.selectList(namespace + "getUserReviewList", user_id);
	}
}
