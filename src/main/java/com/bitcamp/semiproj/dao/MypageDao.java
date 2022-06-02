package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.MypageDto;
import com.bitcamp.semiproj.domain.ReviewDto;

public interface MypageDao {
	MypageDto getUserData(String user_id);
	void updateMypage(MypageDto dto);
	String pwCheck(String user_id);
	void pwUpdate(Map<String, String> map);
	void deleteAccount(String user_id);
	int checkNickName(String nickname);
	List<ReviewDto> getUserReviewList(String user_id);
}
