package com.bitcamp.semiproj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bitcamp.semiproj.domain.NoticeDto;
import com.bitcamp.semiproj.service.NoticeService;

@Controller
public class HomeController {
	
	@Autowired
	private NoticeService noticeservice;
		
	@GetMapping("/")
	public String home(Model model,HttpSession session)throws Exception {
		List<NoticeDto> list= noticeservice.list();
		model.addAttribute("list", list);
		
		return "main/main.tiles";	
	}

}
