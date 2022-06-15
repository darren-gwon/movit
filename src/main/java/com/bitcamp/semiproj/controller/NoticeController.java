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
	
	//�Խù� ���
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(defaultValue = "1")Integer num,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
			) throws Exception{

			
			int postcount=service.postcount(); //�Խù� �Ѱ���
			int postnum = 10; //���������� ����� �Խù� ����
			int pagenum = (int)Math.ceil((double)postcount/postnum); //�ϴ� ������ ��ȣ
			int displaypost = (num-1) * postnum; //����� �Խù�
			int pagecount = 5; // �ѹ��� ǥ���� ������ ��ȣ ����
			int endpagenum = (int)(Math.ceil((double)num/(double)pagecount)*pagecount);// ������ ��ȣ �� ������
			int startpagenum = endpagenum - (pagecount - 1); //������ ��ȣ �� ù��°
			
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
			
			//���� �� ����ȣ
			model.addAttribute("startpagenum", startpagenum);
			model.addAttribute("endpagenum", endpagenum);
			
			//���� �� ����
			model.addAttribute("prev",prev);
			model.addAttribute("next",next);
			
			//����������
			model.addAttribute("select",num);
			
			//�Խù� �� ����
			model.addAttribute("postcount",postcount);
			return "board/list.tiles";
	}
	
		//�Խù� �ۼ� �� �̵�
		@RequestMapping(value = "/write", method = RequestMethod.GET)
		public String write() throws Exception {
				return "board/writeform.tiles";
		}
		// �Խù� �ۼ� POST
		@RequestMapping(value="/write", method=RequestMethod.POST)
		public String postcreate(NoticeDto dto) throws Exception{
			service.create(dto);
			return "redirect:/notice";
		}
		//�Խù� �������� �̵�
		@RequestMapping(value="/detail", method=RequestMethod.GET)
		public String getdetail(Model model,int num) {
			NoticeDto dto=service.detail(num);	
			service.readcount(dto);
			model.addAttribute("dto",dto);
			return "board/detail.tiles";
		}
		//�Խù� ����
		@RequestMapping(value="/edit",method=RequestMethod.GET)
			public String getupdate(Model model, int num) throws Exception{
			NoticeDto dto=service.detail(num);
			model.addAttribute("dto",dto);
			
			return "board/updateform.tiles";
		}
		//�Խù� ���� post
		@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String postupdate(NoticeDto dto) throws Exception {
			//System.out.println(dto);
			service.updateform(dto);
				return "redirect:/notice";
		}
		//�Խù� ����
		@RequestMapping(value="/del",method=RequestMethod.GET)
			public String getdelete(int num) throws Exception {
			//System.out.println(num);
			service.delete(num);
				return "redirect:/notice";
		}


}
