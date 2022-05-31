package com.bitcamp.semiproj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {
		return "main/main.tiles";	
	}
	@GetMapping("/test")
	public String homes() {
		return "/userReg/accept_terms.tiles";	
	}
	@GetMapping("/user/regs")
	public String homess() {
		return "/userReg/userReg.tiles";	
	}
}
