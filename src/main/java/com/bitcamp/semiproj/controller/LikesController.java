package com.bitcamp.semiproj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.semiproj.domain.LikesDto;
import com.bitcamp.semiproj.service.LikesService;

@Controller
@RequestMapping("/review")
public class LikesController {
	
	@Autowired
	LikesService service;
	
	@PostMapping("/likes")
	@ResponseBody
	public int alikes(@RequestBody LikesDto dto) {
		int result = service.insertLikes(dto);
		return result;
	}
	
	@PostMapping("/checkLikes")
	@ResponseBody
	public List<LikesDto> checkLikes(@RequestBody Map<String, String> map) {
		return service.checkLikes(map.get("user_id"), map.get("movieID"));
	}
	
	@PostMapping("/totalLikes")
	@ResponseBody
	public List<LikesDto> totalLikes(@RequestParam int movieID) {
		List<LikesDto> list = service.getTotalLikes(movieID);
		return list;
	}
	
	
//	@GetMapping("/increaseLikes")
//	public int increaseLikes() {
//		LikesDto dto = new LikesDto();
//		dto.getTotal_likes();
//		return dto.getTotal_likes();
//	}
	
	
	
	
}
