package com.bitcamp.semiproj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.semiproj.domain.InquiryDto;
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
		return "redirect:/inquiry/faqlistpage?num=1";
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
	public String postupdate(InquiryFaqDto dto,@RequestParam("seq") int num) throws Exception {
		faqService.update(dto);
		
		return "redirect:/inquiry/faq/detail?seq"+num;
	}
	
	//게시물 삭제 (faq 글 삭제)
	@GetMapping("/faq/delete")
	public String getdelete(@RequestParam String seq) throws Exception {
		faqService.delete(seq);
		
		
		return "redirect:/inquiry/faqpage?seq=1";
	}
	
	//게시물 선택 삭제
	@PostMapping("/faq/delete")
	public String ajaxTest(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		//System.out.println("Dfdf");
		for(int i=0; i<size; i++) {
			faqService.delete(ajaxMsg[i]);
		}
		
		return "redirect:/inquiry/faqpage?seq=1";
	}
	
	
	// 게시물 목록 + 페이징 추가
			@RequestMapping(value = "/faqlistpage", method = RequestMethod.GET)
			public String getListPage(Model model, @RequestParam("num") int num) throws Exception {
				List<InquiryFaqDto> list = faqService.getFaqList();
				model.addAttribute("list",list);
				//게시물 총 개수
				int faqcount = faqService.count();
				
				// 한페이지에 출력할 게시물의 개수
				int postNum = 5;
				
				// 하단 페이징 번호 ([게시물 총 개수 / 한 페이지에 출력할 개수]의 올림)
				int pageNum = (int)Math.ceil((double)faqcount/postNum);
				
				//출력할 게시물
				int displayPost = (num - 1) * postNum;
				
				/* List<InquiryFaqDto> list = null; */
				list = faqService.listPage(displayPost, postNum);
				
				model.addAttribute("list", list);
				model.addAttribute("pageNum", pageNum);
		 
				return "inquiry/faq.tiles";
			}
	
}
	

