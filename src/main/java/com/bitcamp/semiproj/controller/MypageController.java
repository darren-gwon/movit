package com.bitcamp.semiproj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.semiproj.domain.MypageDto;
import com.bitcamp.semiproj.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService service;
	
	@GetMapping("/home")
	public String home() {
		return "/mypage/mypagehome";
	}
	
	@GetMapping("/updateUserInfo")
	public String updateForm(
			Model model, 
			HttpSession session) {
		session.setAttribute("user_id", "gimzee");
		String user_id = (String)session.getAttribute("user_id");
		
		System.out.println("user_id = "+user_id);
		MypageDto dto = service.getUserData(user_id);
		model.addAttribute("dto", dto);
		
		//생년월일
//		String [] birthday = dto.getBirthday().split("-");
//		String birthday1 = birthday[0];
//		String birthday2 = birthday[1];
//		String birthday3 = birthday[2];
//		model.addAttribute("birthday1", birthday1);
//		model.addAttribute("birthday2", birthday2);
//		model.addAttribute("birthday3", birthday3);
		
		//휴대전화
		String [] phone = dto.getPhone().split("-");
		String phone1 = phone[0];
		String phone2 = phone[1];
		String phone3 = phone[2];
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		
		//이메일
		String [] email = dto.getEmail().split("@");
		String email1 = email[0];
		String email2 = email[1];
		model.addAttribute("email1", email1);
		model.addAttribute("email2", email2);
		
		
		
		
		return "/mypage/updateUserInfo";
	}
	
	
}
