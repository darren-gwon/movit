package com.bitcamp.semiproj.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.semiproj.dao.EventDao;
import com.bitcamp.semiproj.domain.EventDto;
import com.bitcamp.semiproj.service.EventService;

import util.FileUtil;

	@Controller
	@RequestMapping("/event")
	public class EventController {
		
		@Autowired
		private EventService service;
		
		@Autowired
		EventDao dao;
		
		//�Խù� ���
		@RequestMapping(value = "/eventlist", method = RequestMethod.GET)
		public String eventlist(Model model) throws Exception{ 
			int startnum = 0;
			int totalcount=service.postcount();
			
			List<EventDto> list=service.eventlist();
			model.addAttribute("list", list);
			model.addAttribute("startnum",startnum);
			model.addAttribute("totalcount",totalcount);
			return "event/eventlist.tiles";
		}
		
		//�Խù� ���
		@RequestMapping(value = "/list", method = RequestMethod.POST)
		@ResponseBody
		public List<EventDto> list(@RequestBody Map<String,Integer> map) throws Exception{ 
			int perpage=8;
			
			List<EventDto> list=service.eventpage(map.get("startnum"), perpage);
			
			return list;
		}

		//�Խù� �ۼ� �� �̵�
		@RequestMapping(value = "/eventwriteform", method = RequestMethod.GET)
		public String write() throws Exception {
			   return "event/eventwriteform.tiles";
				}
		
		/*// �Խù� �ۼ� POST
		@RequestMapping(value="/eventwriteform", method=RequestMethod.POST)
		public String postcreate(@ModelAttribute EventDto dto, @RequestParam MultipartFile upload,
				HttpServletRequest request,HttpSession session,Model model) throws Exception{
			
			 service.eventwriteform(dto);
				return "redirect:eventlist";*/
		 
		// �Խù� �ۼ� POST
		@RequestMapping(value="/eventwriteform", method=RequestMethod.POST)
		public String postcreate(@ModelAttribute EventDto dto, @RequestParam ArrayList<MultipartFile> mainupload, @RequestParam ArrayList<MultipartFile> thumupload,
				HttpServletRequest request,HttpSession session) throws Exception{
			
			 String savepath = "C:\\Dev219\\git\\movit_proj\\src\\main\\webapp\\resources\\main_imgg";
			 String savepath2 = "C:\\Dev219\\git\\movit_proj\\src\\main\\webapp\\resources\\thumnail_img";
			 //System.out.println(savepath);
			 if(mainupload.get(0).getOriginalFilename().equals("")) {
		         dto.setMain_img("no");
		      }else {
		         FileUtil fileUtil=new FileUtil();
		         String photo="";
		         for(MultipartFile f:mainupload)
		         {
		            String rename=fileUtil.changeFileName(f.getOriginalFilename());
		            photo+=rename+",";
		            File file=new File(savepath+"\\"+rename);
		            try {
		               f.transferTo(file);
		            } catch (IllegalStateException | IOException e) {
		               // TODO Auto-generated catch block
		               e.printStackTrace();
		            }
		         }
		         //������ �ĸ� ����
		         photo=photo.substring(0,photo.length()-1);
		         System.out.println(photo);
		         dto.setMain_img(photo);
		      }
			 if(thumupload.get(0).getOriginalFilename().equals("")) {
		         dto.setthumbnail_img("no");
		      }else {
		         FileUtil fileUtil=new FileUtil();
		         String subphoto="";
		         for(MultipartFile f:thumupload)
		         {
		            String rename=fileUtil.changeFileName(f.getOriginalFilename());
		            subphoto+=rename+",";
		            File file=new File(savepath2+"\\"+rename);
		            try {
		               f.transferTo(file);
		            } catch (IllegalStateException | IOException e) {
		               // TODO Auto-generated catch block
		               e.printStackTrace();
		            }
		         }
		         //������ �ĸ� ����
		         subphoto=subphoto.substring(0,subphoto.length()-1);
		         System.out.println(subphoto);
		         dto.setthumbnail_img(subphoto);
		      }
		      //db insert
			service.eventwriteform(dto);	
			return "redirect:eventlist";
		}

		//�Խù� �������� �̵�
		@RequestMapping(value="/eventdetail", method=RequestMethod.GET)
				public String getdetail(Model model,int num) {
					EventDto dto=service.detail(num);	
					service.readcount(dto);
					model.addAttribute("dto",dto);
					return "event/eventdetail.tiles";
				}
		//�Խù� ����
				@RequestMapping(value="/updateform",method=RequestMethod.GET)
					public String getupdate(Model model, int num) throws Exception{
					EventDto dto=service.detail(num);
					model.addAttribute("dto",dto);
					
					return "event/updateform.tiles";
				}
		//�Խù� ���� post
				@RequestMapping(value="/updateform",method=RequestMethod.POST)
					public String postupdate(@ModelAttribute EventDto dto, @RequestParam ArrayList<MultipartFile> mainupload, @RequestParam ArrayList<MultipartFile> thumupload,
							HttpServletRequest request,HttpSession session) throws Exception {
					
					String savepath = request.getServletContext().getRealPath("resources/main_img/");
					 String savepath2 = request.getServletContext().getRealPath("resources/thumnail_img/");
					 //System.out.println(savepath);
					 if(mainupload.get(0).getOriginalFilename().equals("")) {
				      }else {
				         FileUtil fileUtil=new FileUtil();
				         String photo="";
				         for(MultipartFile f:mainupload)
				         {
				            String rename=fileUtil.changeFileName(f.getOriginalFilename());
				            photo+=rename+",";
				            File file=new File(savepath+"\\"+rename);
				            try {
				               f.transferTo(file);
				            } catch (IllegalStateException | IOException e) {
				               // TODO Auto-generated catch block
				               e.printStackTrace();
				            }
				         }
				         //������ �ĸ� ����
				         photo=photo.substring(0,photo.length()-1);
				         System.out.println(photo);
				         dto.setMain_img(photo);
				      }
					 if(thumupload.get(0).getOriginalFilename().equals("")) {
				      }else {
				         FileUtil fileUtil=new FileUtil();
				         String subphoto="";
				         for(MultipartFile f:thumupload)
				         {
				            String rename=fileUtil.changeFileName(f.getOriginalFilename());
				            subphoto+=rename+",";
				            File file=new File(savepath2+"\\"+rename);
				            try {
				               f.transferTo(file);
				            } catch (IllegalStateException | IOException e) {
				               // TODO Auto-generated catch block
				               e.printStackTrace();
				            }
				         }
				         //������ �ĸ� ����
				         subphoto=subphoto.substring(0,subphoto.length()-1);
				         //System.out.println(subphoto);
				         dto.setthumbnail_img(subphoto);
				      }
					 	service.updateform(dto);
						return "redirect:eventlist";
				}
		//�Խù� ����
				@RequestMapping(value="/delete",method=RequestMethod.GET)
					public String getdelete(@ModelAttribute EventDto dto,
							HttpServletRequest request,HttpSession session,int num) throws Exception {
					
					   String path="C:\\Dev219\\git\\movit_proj\\src\\main\\webapp\\resources\\main_img";
					  
					   String photo=service.detail(num).getMain_img();
					   System.out.println("===="+service.detail(num));
					   if(!photo.equals("no")) {
						   String []fileName=photo.split(",");
						   for(String f:fileName) {
							   File file=new File(path+"\\"+f);
							   if(file.exists())
								   file.delete();
						   }
					   }
						service.delete(num);
						return "redirect:eventlist";	
				}
			
}
