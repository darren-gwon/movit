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
		return "inquiry/inquiry.tiles";
	}
	
	//게시물 작성 페이지로 이동
	@GetMapping("/list/insert")
	public String create() throws Exception {
		return "inquiry/inquiryCreate.tiles";
	}
	
	//게시물 작성 Lost Post
	@PostMapping("/list/insert")
	public String postcreate(InquiryDto dto) throws Exception {
		inquiryService.inquirycreate(dto);
		return "redirect:/inquiry/listpage?seq=1";
	}
	
	//게시물 detail 페이지로 이동
	@GetMapping("/list/detail")
	public String inquirydetail(Model model, int seq) {
		InquiryDto data = inquiryService.inquirydetail(seq);
		model.addAttribute("data",data);
		return "inquiry/inquirydetail.tiles";
	}
	
	//게시물 detail update 페이지로 이동
	@GetMapping("/list/update")
	public String inquiryupdate(int seq, Model model) throws Exception {
		InquiryDto data = inquiryService.inquirydetail(seq);
		model.addAttribute("data",data);
		return "/inquiry/inquirydetailupdate.tiles";
	}
	
	//게시물 업데이트(update detail 수정)
	@PostMapping("/list/update")
	public String postupdate(InquiryDto dto,@RequestParam("seq") int num) throws Exception {
		inquiryService.inquiryupdate(dto);
		
		return "redirect:/inquiry/list/detail?seq="+num;
	}
	//게시물 삭제	
	@GetMapping("/list/delete")
	public String delete(@RequestParam String seq) throws Exception	{
		inquiryService.inquirydelete(seq);
		
		
		return "redirect:/inquiry/listpage?seq=1";
	}
	
	//게시글 선택삭제
		@PostMapping("/list/delete") 
		public String ajaxTest(HttpServletRequest request) {
			
			String[] ajaxMsg = request.getParameterValues("valueArr");
			int size = ajaxMsg.length;
			//System.out.println("Dfdf");
			for(int i=0; i<size; i++) {
				inquiryService.inquirydelete(ajaxMsg[i]);
			}
			
			return "redirect:/inquiry/listpage?seq=1";
		}
		
		// 게시물 목록 + 페이징 추가
		@RequestMapping(value = "/listpage", method = RequestMethod.GET)
		public String getListPage(Model model, @RequestParam("seq") int num) throws Exception {
			List<InquiryDto> list = inquiryService.getInquiryList();
			model.addAttribute("list",list);
			//게시물 총 개수
			int count = inquiryService.count();
			
			// 한페이지에 출력할 게시물의 개수
			int postNum = 5;
			
			// 하단 페이징 번호 ([게시물 총 개수 / 한 페이지에 출력할 개수]의 올림)
			int pageNum = (int)Math.ceil((double)count/postNum);
			
			//출력할 게시물
			int displayPost = (num - 1) * postNum;
			
			/* List<InquiryDto> list = null; */
			list = inquiryService.listPage(displayPost,  postNum);
			
			model.addAttribute("list", list);
			model.addAttribute("pageNum", pageNum);
	 
			return "inquiry/inquiry.tiles";
		}
}









