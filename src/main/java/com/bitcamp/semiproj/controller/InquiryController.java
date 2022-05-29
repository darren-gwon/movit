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

import com.bitcamp.semiproj.domain.InquiryDto;
import com.bitcamp.semiproj.service.InquiryService;

@Controller
@RequestMapping("/inquiry") 
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	
	@GetMapping("/list")
	public String SupportHome(Model model) throws Exception{
		List<InquiryDto> list = inquiryService.getInquiryList();
		model.addAttribute("list",list);
		return "/inquiry/inquiry";
	}
	
	//게시물 작성 페이지로 이동
	@GetMapping("/list/insert")
	public String create() throws Exception {
		return "/inquiry/inquiryCreate";
	}
	
	//게시물 작성 Lost Post
	@PostMapping("/list/insert")
	public String postcreate(InquiryDto dto) throws Exception {
		inquiryService.inquirycreate(dto);
		return "redirect:/inquiry/list";
	}
	
	//게시물 detail 페이지로 이동
	@GetMapping("/list/detail")
	public String inquirydetail(Model model, int seq) {
		InquiryDto data = inquiryService.inquirydetail(seq);
		model.addAttribute("data",data);
		return "/inquiry/inquirydetail";
	}
	
	//게시물 detail update 페이지로 이동
	@GetMapping("/list/update")
	public String inquiryupdate(int seq, Model model) throws Exception {
		InquiryDto data = inquiryService.inquirydetail(seq);
		model.addAttribute("data",data);
		return "inquiry/inquirydetailupdate";
	}
	
	//게시물 업데이트(update detail 수정)
	@PostMapping("/list/update")
	public String postupdate(InquiryDto dto) throws Exception {
		inquiryService.inquiryupdate(dto);
		
		return "redirect:/inquiry/list";
	}
	//게시물 삭제	
	@GetMapping("/list/delete")
	public String lostdelete(@RequestParam String seq) throws Exception	{
		inquiryService.inquirydelete(seq);
		
		return "redirect:/inquiry/list";
	}
	
	//게시글 선택삭제
		@PostMapping("/list/delete") 
		public String ajaxTest(HttpServletRequest request) {
			
			String[] ajaxMsg = request.getParameterValues("valueArr");
			int size = ajaxMsg.length;
			for(int i=0; i<size; i++) {
				inquiryService.inquirydelete(ajaxMsg[i]);
			}
			
			return "redirect:/inquiry/list";
		}
}









