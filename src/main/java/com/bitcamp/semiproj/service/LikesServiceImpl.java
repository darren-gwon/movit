package com.bitcamp.semiproj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.LikesDao;
import com.bitcamp.semiproj.domain.LikesDto;
import com.bitcamp.semiproj.domain.ReviewDto;

@Service
public class LikesServiceImpl implements LikesService {

	@Autowired
	LikesDao dao;
	
	
	public List<LikesDto> checkLikes(String user_id, String movieID) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("movieID", movieID);
		return dao.checkLikes(map);
	}
	
	public int insertLikes(LikesDto dto) {
		// 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
		int result = 0;
		// 좋아요가 이미 있는지 확인하는 코드
		LikesDto find = dao.findLikes(dto);
		System.out.println(dto);
		// find가 null이면 좋아요가 없는 상태이므로 정보 저장
		// find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
		if(find==null) {
			// insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
			// totalLikes +1
			dao.increaseTotalLikes(dto);
			result = dao.insertLikes(dto);
		} else {
			dao.decreaseTotalLikes(dto);
			dao.deleteLikes(dto);
		}
	    	// 0 or 1이 담겨져서 @Controller에 보냄.
		return result;
	}
	
	public List<LikesDto> getTotalLikes(int movieID) {
		return dao.totalLikes(movieID);
	}
	
	
}
