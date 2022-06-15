package com.bitcamp.semiproj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.semiproj.domain.NoticeDto;
import com.bitcamp.semiproj.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	//게시물 목록
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(defaultValue = "1")Integer num,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception{

			
			int postcount=service.postcount(); //게시물 총갯수
			int postnum = 10; //한페이지에 출력할 게시물 갯수
			int pagenum = (int)Math.ceil((double)postcount/postnum); //하단 페이지 번호
			int displaypost = (num-1) * postnum; //출력할 게시물
			int pagecount = 5; // 한번에 표시할 페이지 번호 갯수
			int endpagenum = (int)(Math.ceil((double)num/(double)pagecount)*pagecount);// 페이지 번호 중 마지막
			int startpagenum = endpagenum - (pagecount - 1); //페이지 번호 중 첫번째
			
			int endpagenum_re = (int)(Math.ceil((double)postcount / (double)postnum));
			
			if(endpagenum > endpagenum_re) {
				endpagenum = endpagenum_re;
			}
			boolean prev = startpagenum == 1? false:true;
			boolean next = endpagenum * postnum >= postcount ? false:true;
			
			
			
		
		    List<NoticeDto> list = service.listpage(displaypost, postnum, keyword);
			model.addAttribute("list",list);
			model.addAttribute("pagenum", pagenum);
			
			model.addAttribute("displaypost",displaypost);
			
			//시작 및 끝번호
			model.addAttribute("startpagenum", startpagenum);
			model.addAttribute("endpagenum", endpagenum);
			
			//이전 및 다음
			model.addAttribute("prev",prev);
			model.addAttribute("next",next);
			
			//현재페이지
			model.addAttribute("select",num);
			
			//게시물 총 갯수
			model.addAttribute("postcount",postcount);
			return "board/list.tiles";
	}
	
		//게시물 작성 폼 이동
		@RequestMapping(value = "/write", method = RequestMethod.GET)
		public String write() throws Exception {
				return "board/writeform.tiles";
		}
		// 게시물 작성 POST
		@RequestMapping(value="/write", method=RequestMethod.POST)
		public String postcreate(NoticeDto dto) throws Exception{
			service.create(dto);
			return "redirect:/notice";
		}
		//게시물 상세페이지 이동
		@RequestMapping(value="/detail", method=RequestMethod.GET)
		public String getdetail(Model model,int num) {
			NoticeDto dto=service.detail(num);	
			service.readcount(dto);
			model.addAttribute("dto",dto);
			return "board/detail.tiles";
		}
		//게시물 수정
		@RequestMapping(value="/edit",method=RequestMethod.GET)
			public String getupdate(Model model, int num) throws Exception{
			NoticeDto dto=service.detail(num);
			model.addAttribute("dto",dto);
			
			return "board/updateform.tiles";
		}
		//게시물 수정 post
		@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String postupdate(NoticeDto dto) throws Exception {
			//System.out.println(dto);
			service.updateform(dto);
				return "redirect:/notice";
		}
		//게시물 삭제
		@RequestMapping(value="/del",method=RequestMethod.GET)
			public String getdelete(int num) throws Exception {
			//System.out.println(num);
			service.delete(num);
				return "redirect:/notice";
		}


}
