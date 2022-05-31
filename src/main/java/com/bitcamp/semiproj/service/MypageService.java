package com.bitcamp.semiproj.service;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.LikesDto;
import com.bitcamp.semiproj.domain.MypageDto;

public interface MypageService {
	MypageDto getUserData(String user_id);
	void updateMypage(MypageDto dto);
	String pwCheck(String user_id);
	void pwUpdate(String user_id, String hashedPw);
}
