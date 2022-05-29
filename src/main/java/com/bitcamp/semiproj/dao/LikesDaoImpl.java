package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.LikesDto;

@Repository
public class LikesDaoImpl implements LikesDao {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.bitcamp.semiproj.dao.LikesDao.";
	
	@Override
	public List<LikesDto> checkLikes(Map<String, Object> map) {
		return session.selectList(namespace + "checkLikes", map);
	}
	
	@Override
	public LikesDto findLikes(LikesDto dto) {
		return session.selectOne(namespace + "findLikes", dto);
	}

	@Override
	public int insertLikes(LikesDto dto) {
		return session.insert(namespace + "insertLikes", dto);
	}

	@Override
	public void deleteLikes(LikesDto dto) {
		session.delete(namespace + "deleteLikes", dto);
	}
	
	@Override
	public List<LikesDto> totalLikes(int movieID) {
		return session.selectList(namespace + "totalLikes", movieID);
	}

	@Override
	public int increaseTotalLikes(LikesDto dto) {
		return session.update(namespace + "increaseTotalLikes", dto);

	}

	@Override
	public int decreaseTotalLikes(LikesDto dto) {
		return session.update(namespace + "decreaseTotalLikes", dto);

	}

}
