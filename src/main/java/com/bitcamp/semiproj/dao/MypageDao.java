package com.bitcamp.semiproj.dao;

import java.util.Map;

import com.bitcamp.semiproj.domain.MypageDto;

public interface MypageDao {
	MypageDto getUserData(String user_id);
	void updateMypage(MypageDto dto);
	String pwCheck(String user_id);
	void pwUpdate(String user_id, String hashedPw);
}
