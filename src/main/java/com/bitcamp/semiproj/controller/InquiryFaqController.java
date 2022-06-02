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

	@GetMapping("/faq/list")
	public String SupportHome(Model model, @RequestParam(defaultValue = "1") Integer num,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
			
		int postcount = faqService.count(); // 총 갯수
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
		
		
		List<InquiryFaqDto> list = faqService.faqlistPage(displaypost,postnum,keyword);
		model.addAttribute("list", list);
		model.addAttribute("pagenum", pagenum);

		model.addAttribute("displaypost", displaypost);

		model.addAttribute("startpagenum", startpagenum);
		model.addAttribute("endpagenum", endpagenum);

		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		model.addAttribute("select", num);
		model.addAttribute("postcount", postcount);
		
		return "inquiry/faq.tiles";
	}

	// 게시물 작성 페이지로 이동
	@GetMapping("/faq/insert")
	public String create() throws Exception {
		return "inquiry/faqCreate.tiles";
	}

	// 게시물 작성 faq post
	@PostMapping("/faq/insert")
	public String postcreate(InquiryFaqDto dto) throws Exception {
		faqService.create(dto);
		return "redirect:/inquiry/faq/list?num=1";
	}

	// 게시물 faq 상세페이지로 이동
	@GetMapping("/faq/detail")
	public String getdetail(Model model, int seq) {
		InquiryFaqDto data = faqService.faqdetail(seq);
		model.addAttribute("data", data);
		return "inquiry/faqdetail.tiles";
	}

	// 게시물 업데이트(faq 수정) faq 이동
	@GetMapping("/faq/update")
	public String getupdate(int seq, Model model) throws Exception {
		InquiryFaqDto data = faqService.faqdetail(seq);
		model.addAttribute("data", data);
		return "inquiry/faqdetailupdate.tiles";
	}

	// 게시물 업데이트(faq 수정)
	@PostMapping("/faq/update")
	public String postupdate(InquiryFaqDto dto, @RequestParam("seq") int seq) throws Exception {
		faqService.update(dto);

		return "redirect:/inquiry/faq/detail?seq=" + seq;
	}

	// 게시물 삭제 (faq 글 삭제)
	@GetMapping("/faq/delete")
	public String getdelete(String seq) throws Exception {
		faqService.delete(seq);
		System.out.println("sd"+seq);
		return "redirect:/inquiry/faq/list?num=1";
	}

	// 게시물 선택 삭제
	@PostMapping("/faq/delete")
	public String ajaxTest(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		// System.out.println("Dfdf");
		for (int i = 0; i < size; i++) {
			faqService.delete(ajaxMsg[i]);
		}

		return "redirect:/inquiry/faq/list?num=1";
	}



}
