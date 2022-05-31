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
@RequestMapping("/board")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	//占쌉시뱄옙 占쏙옙占�
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(defaultValue = "1")Integer num,@
			RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception{

			
			int postcount=service.postcount(); //占쌉시뱄옙 占싼곤옙占쏙옙
			int postnum = 10; //占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쌉시뱄옙 占쏙옙占쏙옙
			int pagenum = (int)Math.ceil((double)postcount/postnum); //占싹댐옙 占쏙옙占쏙옙占쏙옙 占쏙옙호
			int displaypost = (num-1) * postnum; //占쏙옙占쏙옙占� 占쌉시뱄옙
			int pagecount = 5; // 占싼뱄옙占쏙옙 표占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙호 占쏙옙占쏙옙
			int endpagenum = (int)(Math.ceil((double)num/(double)pagecount)*pagecount);// 占쏙옙占쏙옙占쏙옙 占쏙옙호 占쏙옙 占쏙옙占쏙옙占쏙옙
			int startpagenum = endpagenum - (pagecount - 1); //占쏙옙占쏙옙占쏙옙 占쏙옙호 占쏙옙 첫占쏙옙째
			
			int endpagenum_re = (int)(Math.ceil((double)postcount / (double)pagecount));
			
			if(endpagenum > endpagenum_re) {
				endpagenum = endpagenum_re;
			}
			boolean prev = startpagenum == 1? false:true;
			boolean next = endpagenum * pagecount >= postcount ? false:true;
			
		
		    List<NoticeDto> list = service.listpage(displaypost, postnum, keyword);
			model.addAttribute("list",list);
			model.addAttribute("pagenum", pagenum);
			
			//占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙호
			model.addAttribute("startpagenum", startpagenum);
			model.addAttribute("endpagenum", endpagenum);
			
			//占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
			model.addAttribute("prev",prev);
			model.addAttribute("next",next);
			
			//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙
			model.addAttribute("select",num);
			
			//占쌉시뱄옙 占쏙옙 占쏙옙占쏙옙
			model.addAttribute("postcount",postcount);
			return "board/list.tiles";
	}
	


	
	//占쌉시뱄옙 占쌜쇽옙 占쏙옙 占싱듸옙
		@RequestMapping(value = "/writeform", method = RequestMethod.GET)
		public String write() throws Exception {
				return "board/writeform.tiles";
		}
		// 占쌉시뱄옙 占쌜쇽옙 POST
		@RequestMapping(value="/create", method=RequestMethod.POST)
		public String postcreate(NoticeDto dto) throws Exception{
			service.create(dto);
			return "redirect:list";
		}
		//占쌉시뱄옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙
		@RequestMapping(value="/detail", method=RequestMethod.GET)
		public String getdetail(Model model,int num) {
			NoticeDto dto=service.detail(num);	
			service.readcount(dto);
			model.addAttribute("dto",dto);
			return "board/detail.tiles";
		}
		//占쌉시뱄옙 占쏙옙占쏙옙
		@RequestMapping(value="/updateform",method=RequestMethod.GET)
			public String getupdate(Model model, int num) throws Exception{
			NoticeDto dto=service.detail(num);
			model.addAttribute("dto",dto);
			
			return "board/updateform.tiles";
		}
		//占쌉시뱄옙 占쏙옙占쏙옙 post
		@RequestMapping(value="/updateform",method=RequestMethod.POST)
			public String postupdate(NoticeDto dto) throws Exception {
			//System.out.println(dto);
			service.updateform(dto);
				return "redirect:list";
		}
		//占쌉시뱄옙 占쏙옙占쏙옙
		@RequestMapping(value="/delete",method=RequestMethod.GET)
			public String getdelete(int num) throws Exception {
			//System.out.println(num);
			service.delete(num);
				return "redirect:list";
		}


}
