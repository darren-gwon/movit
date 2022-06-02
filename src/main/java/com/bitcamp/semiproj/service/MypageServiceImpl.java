package com.bitcamp.semiproj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.MypageDao;
import com.bitcamp.semiproj.domain.MypageDto;
import com.bitcamp.semiproj.domain.ReviewDto;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao dao;
	
	public MypageDto getUserData(String user_id) {
		return dao.getUserData(user_id);
	}
	
	@Override
	public void updateMypage(MypageDto dto) {
		dao.updateMypage(dto);
	}
	
	@Override
	public String pwCheck(String user_id) {
		return dao.pwCheck(user_id);
	}
	
	@Override
	public void pwUpdate(String user_id, String hashedPw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("password", hashedPw);
		dao.pwUpdate(map);
	}
	
	@Override
	public void deleteAccount(String user_id) {
		dao.deleteAccount(user_id);
	}
	
	@Override
	public int checkNickName(String nickname) {
		return dao.checkNickName(nickname);
	}
	
	@Override
	public List<ReviewDto> getUserReviewList(String user_id) {
		return dao.getUserReviewList(user_id);
	}
}
