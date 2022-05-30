package com.bitcamp.semiproj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.semiproj.domain.InquiryLostDto;
import com.bitcamp.semiproj.service.InquiryLostService;

@Controller
@RequestMapping("/inquiry") 
public class InquiryLostController {

	@Autowired
	private InquiryLostService lostService;
	
	
	@GetMapping("/lost")
	public String SupportHome(Model model) throws Exception{
		List<InquiryLostDto> list = lostService.getLostList();
		model.addAttribute("list",list);
		return "/inquiry/lost";
	}
	
	//게시물 작성 페이지로 이동
	@GetMapping("/lost/insert")
	public String create() throws Exception {
		return "/inquiry/lostCreate";
	}
	
	//게시물 작성 Lost Post
	@PostMapping("/lost/insert")
	public String postcreate(InquiryLostDto dto) throws Exception {
		lostService.lostcreate(dto);
		return "redirect:/inquiry/lost";
	}
	
	//게시물 detail 페이지로 이동
	@GetMapping("/lost/detail")
	public String lostdetail(Model model, int seq) {
		InquiryLostDto data = lostService.lostdetail(seq);
		model.addAttribute("data",data);
		return "/inquiry/lostdetail";
	}
	
	//게시물 detail update 페이지로 이동
	@GetMapping("/lost/update")
	public String lostupdate(int seq, Model model) throws Exception {
		InquiryLostDto data = lostService.lostdetail(seq);
		model.addAttribute("data",data);
		return "inquiry/lostdetailupdate";
	}
	
	//게시물 업데이트(lost 수정)
	@PostMapping("/lost/update")
	public String postupdate(InquiryLostDto dto) throws Exception {
		lostService.lostupdate(dto);
		
		return "redirect:/inquiry/lost";
	}
	//게시물 삭제	
	@GetMapping("/lost/delete")
	public String lostdelete(@RequestParam String seq) throws Exception	{
		lostService.lostdelete(seq);
		
		return "redirect:/inquiry/lost";
	}
	
	//게시글 선택삭제
		@PostMapping("/lost/delete") 
		public String ajaxTest(HttpServletRequest request) {
			
			String[] ajaxMsg = request.getParameterValues("valueArr");
			int size = ajaxMsg.length;
			for(int i=0; i<size; i++) {
				lostService.lostdelete(ajaxMsg[i]);
			}
			
			return "redirect:/inquiry/lost";
		}
		
}









