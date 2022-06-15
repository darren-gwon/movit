package com.bitcamp.semiproj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.semiproj.domain.InquiryDto;
import com.bitcamp.semiproj.domain.TheaterDto;
import com.bitcamp.semiproj.service.InquiryService;
import com.bitcamp.semiproj.service.TheaterService;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	@GetMapping("/inquiry")
	public String SupportHome(Model model, @RequestParam(defaultValue = "1") Integer num,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

		int postcount = inquiryService.count(); // 총 갯수
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

		List<InquiryDto> list = inquiryService.listPage(displaypost,postnum,keyword);
		model.addAttribute("list", list);
		model.addAttribute("pagenum", pagenum);

		model.addAttribute("displaypost", displaypost);

		model.addAttribute("startpagenum", startpagenum);
		model.addAttribute("endpagenum", endpagenum);

		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		model.addAttribute("select", num);
		model.addAttribute("postcount", postcount);
		

		return "inquiry/inquiry.tiles";
	}

	// 게시물 작성 페이지로 이동
	@GetMapping("/inquiry/write")
	public String create() throws Exception {
		return "inquiry/inquiryCreate.tiles";
	}

	// 게시물 작성 Lost Post
	@PostMapping("/inquiry/write")
	public String postcreate(InquiryDto dto,Model model) throws Exception {
		inquiryService.inquirycreate(dto);

		return "redirect:/inquiry?num=1";
	}

	// 게시물 detail 페이지로 이동
	@GetMapping("/inquiry/detail")
	public String inquirydetail( int seq, Model model) {
		InquiryDto data = inquiryService.inquirydetail(seq);
		inquiryService.inquiryreadcount(data);
		model.addAttribute("data", data);
		return "inquiry/inquirydetail.tiles";
	}

	// 게시물 detail update 페이지로 이동
	@GetMapping("/inquiry/edit")
	public String inquiryupdate(int seq, Model model) throws Exception {
		InquiryDto data = inquiryService.inquirydetail(seq);
		model.addAttribute("data", data);
		return "/inquiry/inquirydetailupdate.tiles";
	}

	// 게시물 업데이트(update detail 수정)
	@PostMapping("/inquiry/edit")
	public String postupdate(InquiryDto dto, @RequestParam("seq") int seq) throws Exception {
		inquiryService.inquiryupdate(dto);

		return "redirect:/inquiry/detail?seq=" + seq;
	}

	// 게시물 삭제
	@GetMapping("/inquiry/del")
	public String delete(String seq) throws Exception {
		inquiryService.inquirydelete(seq);

		return "redirect:/inquiry?num=1";
	}

	// 게시글 선택삭제
	@PostMapping("/inquiry/del")
	public String ajaxTest(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			inquiryService.inquirydelete(ajaxMsg[i]);
		}

		return "redirect:/inquiry?num=1";
	}
	
	
}