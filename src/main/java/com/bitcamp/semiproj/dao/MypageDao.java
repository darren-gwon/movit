package com.bitcamp.semiproj.dao;

import java.util.Map;

import com.bitcamp.semiproj.domain.MypageDto;

public interface MypageDao {
//	MypageDto getUserData(Map<String, Object> map);
	MypageDto getUserData(String user_id);
}
