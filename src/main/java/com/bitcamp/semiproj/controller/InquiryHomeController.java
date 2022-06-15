package com.bitcamp.semiproj.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



	@Controller
	public class InquiryHomeController {
		
		@GetMapping("/support")
		//실행할 메서드 만들기
		public String list(HttpServletRequest request) {
			return "inquiry/InquiryHome.tiles" ;
		}
	
	}