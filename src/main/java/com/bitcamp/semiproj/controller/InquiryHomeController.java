package com.bitcamp.semiproj.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



	@Controller
	@RequestMapping("/inquiry")
	public class InquiryHomeController {
		
		@GetMapping("/home")
		//실행할 메서드 만들기
		public String list(HttpServletRequest request) {
			return "inquiry/InquiryHome.tiles" ;
		}
	
	}