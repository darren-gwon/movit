package com.bitcamp.semiproj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.semiproj.domain.ReviewDto;
import com.bitcamp.semiproj.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService service;
	
//	@GetMapping("/home")
//	public String reviewHome() throws Exception {
//		return "review/reviewhome.tiles";
//	}

	@GetMapping("/list")
	@ResponseBody
	public Map<String, Object> getReviewList(
			@RequestParam("movie_id") int movie_id,
			@RequestParam("startNum") int startNum
			) {
		int perPage = 5;
		int reviewTotalCount = service.findReviewTotalCountByMovie_id(movie_id);
		int sumReviewRating = service.findSumReviewRating(movie_id);
		List<ReviewDto> list = service.findReviewListByMovie_id(movie_id, startNum, perPage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("startNum", startNum);
		map.put("reviewTotalCount", reviewTotalCount);
		map.put("sumReviewRating", sumReviewRating);
		return map;
	}
	
//	@GetMapping("/form")
//	public String reviewForm(
//			@RequestParam int movieID, 
//			Model model, 
//			HttpSession session) {
//		model.addAttribute("movieID", movieID);
//		return "review/reviewform.tiles";
//	}
	
	@PostMapping("/insert")
	@ResponseBody
	public void reviewInsert(@ModelAttribute ReviewDto dto) {
		service.insertReview(dto);
	}
	
	@PostMapping("/chkUser")
	@ResponseBody
	public List<ReviewDto> userReviewCheck(@ModelAttribute ReviewDto dto) {
		return service.checkUserReview(dto);
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public void deleteReview(@RequestParam int review_id) {
		System.out.println("review_id = "+review_id);
		service.deleteReview(review_id);
	}
	
	@PostMapping("/update")
	@ResponseBody
	public void updateReview(@ModelAttribute ReviewDto dto) {
		service.updateReview(dto);
	}
}