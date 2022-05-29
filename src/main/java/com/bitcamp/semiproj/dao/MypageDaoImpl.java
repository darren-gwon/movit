package com.bitcamp.semiproj.dao;

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

//	@Override
//	public MypageDto getUserData(Map<String, Object> map) {
//		return session.selectOne(namespace + "getUserData", map);
//	}
	
	@Override
	public MypageDto getUserData(String user_id) {
		return session.selectOne(namespace + "getUserData", user_id);
	}

}
