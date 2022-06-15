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
import com.bitcamp.semiproj.domain.InquiryLostDto;
import com.bitcamp.semiproj.service.InquiryLostService;

@Controller
public class InquiryLostController {

	@Autowired
	private InquiryLostService lostService;
	
	
	@GetMapping("/lost")
	public String SupportHome(Model model, @RequestParam(defaultValue = "1") Integer num,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception{

		
		int postcount = lostService.count(); // 총 갯수
		int postnum = 10; // 10개씩 출력
		int pagenum = (int) Math.ceil((double) postcount / postnum); // 페이지 번호 소수점 무조건 올림
		int displaypost = (num - 1) * postnum; //
		int pagecount = 5; //
		int endpagenum = (int) (Math.ceil((double) num / (double) pagecount) * pagecount);//
		int startpagenum = endpagenum - (pagecount - 1); //

		int endpagenum_re = (int) (Math.ceil((double) postcount / (double) postnum));

		if (endpagenum > endpagenum_re) {
			endpagenum = endpagenum_re;
		}
		boolean prev = startpagenum == 1 ? false : true;
		boolean next = endpagenum * postnum >= postcount ? false : true;

		List<InquiryLostDto> list = lostService.listPage(displaypost,postnum,keyword);
		model.addAttribute("list",list);
		model.addAttribute("pagenum", pagenum);

		model.addAttribute("displaypost", displaypost);

		model.addAttribute("startpagenum", startpagenum);
		model.addAttribute("endpagenum", endpagenum);

		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		model.addAttribute("select", num);
		model.addAttribute("postcount", postcount);
		
		return "inquiry/lost.tiles";
	}
	
	//게시물 작성 페이지로 이동
	@GetMapping("/lost/write")
	public String create() throws Exception {
		return "inquiry/lostCreate.tiles";
	}
	
	//게시물 작성 Lost Post
	@PostMapping("/lost/write")
	public String postcreate(InquiryLostDto dto) throws Exception {
		lostService.lostcreate(dto);
		return "redirect:/lost?num=1";
	}
	
	//게시물 detail 페이지로 이동
	@GetMapping("/lost/detail")
	public String lostdetail(Model model, int seq) {
		InquiryLostDto data = lostService.lostdetail(seq);
		model.addAttribute("data",data);
		return "inquiry/lostdetail.tiles";
	}
	
	//게시물 detail update 페이지로 이동
	@GetMapping("/lost/edit")
	public String lostupdate(int seq, Model model) throws Exception {
		InquiryLostDto data = lostService.lostdetail(seq);
		model.addAttribute("data",data);
		return "inquiry/lostdetailupdate.tiles";
	}
	
	//게시물 업데이트(lost 수정)
	@PostMapping("/lost/edit")
	public String postupdate(InquiryLostDto dto, @RequestParam("seq") int seq) throws Exception{
		lostService.lostupdate(dto);
		
		return "redirect:/lost/detail?seq=" + seq;
	}
	//게시물 삭제	
	@GetMapping("/lost/del")
	public String lostdelete(@RequestParam String seq) throws Exception	{
		lostService.lostdelete(seq);
		
		return "redirect:/lost?num=1";
	}
	
	//게시글 선택삭제
		@PostMapping("/lost/del")
		public String ajaxTest(HttpServletRequest request) {
			
			String[] ajaxMsg = request.getParameterValues("valueArr");
			int size = ajaxMsg.length;
			for(int i=0; i<size; i++) {
				lostService.lostdelete(ajaxMsg[i]);
			}
			
			return "redirect:/lost?num=1";
		}
		
}