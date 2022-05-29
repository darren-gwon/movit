package com.bitcamp.semiproj.service;

import java.util.HashMap;
import java.util.Map;

import org.checkerframework.checker.units.qual.K;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.MypageDao;
import com.bitcamp.semiproj.domain.MypageDto;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao dao;
	
//	@Override
//	public MypageDto getUserData(String user_id) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("user_id", user_id);
//		return dao.getUserData(map);
//	}

	public MypageDto getUserData(String user_id) {
		return dao.getUserData(user_id);
	}
}
