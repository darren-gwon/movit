package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.LikesDto;

public interface LikesDao {
	List<LikesDto> checkLikes(Map<String, Object> map);
	LikesDto findLikes(LikesDto dto);
	int insertLikes(LikesDto dto);
	void deleteLikes(LikesDto dto);
	List<LikesDto> totalLikes(int movie_id);
	int increaseTotalLikes(LikesDto dto); 
	int decreaseTotalLikes(LikesDto dto); 

}
