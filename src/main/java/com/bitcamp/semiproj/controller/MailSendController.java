package com.bitcamp.semiproj.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitcamp.semiproj.dao.UserDao;
import com.bitcamp.semiproj.service.MailSendService;
import com.bitcamp.semiproj.service.UserService;
@Controller
public class MailSendController {
	

	@Autowired
	MailSendService mailService;
	@Autowired
	UserDao userdao;
	@Autowired
	private UserService userService;
	
		
	@RequestMapping(value = "/mail/send", method = RequestMethod.GET) 
	@ResponseBody 
	public String mailCheck(@RequestParam("email") String email, RedirectAttributes rattr) throws Exception{ 
		int n= userService.userEmailCheck(email);
		if(n==1) {		
		return "1";
		}
		else {
			return mailService.mailSendKey(email);

		}
	}

//	@RequestMapping(value = "mypage/mailCheck", method = RequestMethod.GET) 
//	@ResponseBody 
//	public String mypageMailCheck(
//			@RequestParam("email1") String email1,
//			@RequestParam("email2") String email2
//			) { 
//		MypageDto dto = new MypageDto();
//		dto.setEmail(email1+"@"+email2);
//		String email = dto.getEmail();
//		int n= userService.userEmailCheck(email);
//		if(n==1) {		
//			return "1";
//		} else {
//			return mailService.mailSendKey(email);
//		}
//	}
	
	@RequestMapping(value = "mypage/mailCheck", method = RequestMethod.GET) 
	@ResponseBody 
	public String mypageMailCheck(@RequestParam("email") String email, RedirectAttributes rattr) throws Exception{ 
		int n= userService.userEmailCheck(email);
		if(n==1) {		
		return "1";
		}
		else {
			return mailService.mailSendKey(email);

		}
	}
}

