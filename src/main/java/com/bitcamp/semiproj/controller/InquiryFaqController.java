package com.bitcamp.semiproj.controller;

import java.awt.print.Pageable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.semiproj.domain.InquiryFaqDto;
import com.bitcamp.semiproj.service.InquiryFaqService;

@Controller
@RequestMapping("/inquiry")
public class InquiryFaqController {

	@Autowired
	private InquiryFaqService faqService;

	
	@GetMapping("/faq")
	public String SupportHome(Model model) throws Exception{
		List<InquiryFaqDto> list =faqService.getFaqList();
		model.addAttribute("list",list);
		return "inquiry/faq.tiles";
	}
	
	//게시물 작성 페이지로 이동
	@GetMapping("/faq/insert")
	public String create() throws Exception {
		return "inquiry/faqCreate.tiles";
	}
	
	//게시물 작성 faq post
	@PostMapping("/faq/insert")
	public String postcreate(InquiryFaqDto dto) throws Exception {
		faqService.create(dto);
		return "redirect:/inquiry/faq";
	}
	
	//게시물 faq 상세페이지로 이동
	@GetMapping("/faq/detail")
	public String getdetail(Model model, int seq) {
		InquiryFaqDto data = faqService.faqdetail(seq);
		model.addAttribute("data",data);
		return "inquiry/faqdetail.tiles";
	}
	
	//게시물 업데이트(faq 수정) faq 이동
	@GetMapping("/faq/update")
	public String getupdate(int seq, Model model) throws Exception {
		InquiryFaqDto data = faqService.faqdetail(seq);
		model.addAttribute("data",data);
		return "inquiry/faqdetailupdate.tiles";
	}
	
	//게시물 업데이트(faq 수정)
	@PostMapping("/faq/update")
	public String postupdate(InquiryFaqDto dto) throws Exception {
		faqService.update(dto);
		//System.out.println(dto);
		return "redirect:/inquiry/faq";
	}
	
	//게시물 삭제 (faq 글 삭제)
	@GetMapping("/faq/delete")
	public String getdelete(String seq, Model model) throws Exception {
		faqService.delete(seq);
		return "redirect:/inquiry/faq";
	}
	
	//게시물 선택 삭제
	@PostMapping("/delete")
	public String ajaxTest(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			faqService.delete(ajaxMsg[i]);
		}
		
		return "redirect:/inquiry/faq";
	}
	
}
	

