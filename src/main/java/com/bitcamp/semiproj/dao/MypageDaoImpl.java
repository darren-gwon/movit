package com.bitcamp.semiproj.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.MypageDto;

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
}
