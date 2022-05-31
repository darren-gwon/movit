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
	
	@GetMapping("/home")
	public String reviewHome() throws Exception {
		return "review/reviewhome.tiles";
	}

	@GetMapping("/list")
	@ResponseBody
	public Map<String, Object> getReviewList(
			@RequestParam("movieID") int movieID, 
			@RequestParam("startNum") int startNum
			) {
		int perPage = 5;
		int reviewTotalCount = service.findReviewTotalCountByMovieId(movieID);
		int sumReviewRating = service.findSumReviewRating(movieID);
		List<ReviewDto> list = service.findReviewListByMovieId(movieID, startNum, perPage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("startNum", startNum);
		map.put("reviewTotalCount", reviewTotalCount);
		map.put("sumReviewRating", sumReviewRating);
		return map;
	}
	
	@GetMapping("/form")
	public String reviewForm(
			@RequestParam int movieID, 
			Model model, 
			HttpSession session) {
		session.setAttribute("user_id", "gimzee");
		model.addAttribute("movieID", movieID);
		return "review/reviewform.tiles";
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public void reviewInsert(@ModelAttribute ReviewDto dto) {
		service.insertReview(dto);
	}
	
	@PostMapping("/checkUserReview")
	@ResponseBody
	public List<ReviewDto> userReviewCheck(@ModelAttribute ReviewDto dto) {
		return service.checkUserReview(dto);
	}
	
	@GetMapping("/deleteReview")
	@ResponseBody
	public void deleteReview(@RequestParam int reviewID) {
		System.out.println("reviewID = "+reviewID);
		service.deleteReview(reviewID);
	}
	
	@PostMapping("/updateReview")
	@ResponseBody
	public void updateReview(@ModelAttribute ReviewDto dto) {
		System.out.println(dto);
		service.updateReview(dto);
	}
}