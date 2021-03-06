package com.bitcamp.semiproj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitcamp.semiproj.dao.UserDao;
import com.bitcamp.semiproj.domain.UserDto;
import com.bitcamp.semiproj.service.MailSendService;
import com.bitcamp.semiproj.service.UserService;
import com.bitcamp.semiproj.service.UserSha256;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MailSendService mailService;
	

	@Autowired
	UserDao userdao;

	// 회원가입 전 동의 창
	@RequestMapping(value = "reg/agree", method = RequestMethod.GET)
	public String agree(UserDto userdto) {

		 return "/userReg/agree.tiles";
	}
	
	// 회원가입 창
	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String UserReg(UserDto userdto) {

		return "/userReg/userReg.tiles";
	}

	// 회원가입 완료
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String UserRegPass(UserDto userdto, HttpSession session, HttpServletRequest request) {

		// 비밀번호 암호화 (sha256)
		String password = UserSha256.encrypt(userdto.getPassword());
		//암호화 후 db 에 저장
		userdto.setPassword(password);	
		userService.userReg_service(userdto);
		
		return "redirect:/";

	}

	// id 중복 체크 컨트롤러 user/idCheck
	@RequestMapping(value = "/reg/chkId", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String user_id) {

		return userService.userIdCheck(user_id);
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/find/userId", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("name") String name, 
			@RequestParam("email") String email,RedirectAttributes rattr) {
		Map<String, String> map =new HashMap<>();
		map.put("name",name);
		map.put("email",email);
		String result=userService.get_searchId(map);
		String chk=result;
		if(chk!=null) {
				rattr.addFlashAttribute("checkfail", 1);
		}

		return result;
	}
	// 비밀번호 인증 이메일
	@RequestMapping(value = "/find/checkUser", method = RequestMethod.GET)
	@ResponseBody
	public String userCheck(@RequestParam("user_id")String user_id,
			@RequestParam("email")String email,
			HttpServletRequest request,
			RedirectAttributes rattr) {
		
			//이메일 user id 와 일치 하는지 확인후 메일 발송 
			Map<String, String> map =new HashMap<>();
			map.put("user_id",user_id);
			map.put("email",email);
			String userCheck=userService.get_searchPassword(map);
			if(userCheck==null) {
			return userCheck=userService.get_searchPassword(map);
			}
			else {
				return mailService.mailSendKey(email);	
			}
	}
	
	// 임시비밀번호 생성(비밀번호찾기)
	@RequestMapping(value = "/setTempPwd", method = RequestMethod.POST)
	@ResponseBody
	public void passwordSearch(@RequestParam("user_id")String user_id,
			@RequestParam("email")String email,
			HttpServletRequest request,
			RedirectAttributes rattr) {
			//이메일이 user id 와 email  확인 후 임시비밀번호 생성 
			Map<String, String> map =new HashMap<>();
			map.put("user_id",user_id);
			map.put("email",email);
			String userCheck=userService.get_searchPassword(map);
			if(!(userCheck=="0")) {
			mailService.mailSendWithPassword(user_id, email, request);
			}
			else {
				rattr.addFlashAttribute("usercheck", 1); 
			}
	}
	
}
