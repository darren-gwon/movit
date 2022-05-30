package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.LikesDto;

public interface LikesService {
	List<LikesDto> checkLikes(String user_id, String movieID);
	int insertLikes(LikesDto dto);
	List<LikesDto> getTotalLikes(int movieID);
}
