package com.bitcamp.semiproj.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.MypageDao;
import com.bitcamp.semiproj.domain.MypageDto;

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
	public String pwCheck(String memberId) {
		return dao.pwCheck(memberId);
	}
	
	@Override
	public void pwUpdate(String memberId, String hashedPw) {
		dao.pwUpdate(memberId, hashedPw);
	}
}
