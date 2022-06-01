package com.bitcamp.semiproj.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.bitcamp.semiproj.dao.UserDao;
//import com.bitcamp.semiproj.loginapi.NaverLoginBO;
import com.bitcamp.semiproj.service.UserService;
import com.bitcamp.semiproj.service.UserSha256;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class LoginController {

	@Autowired
	UserDao userdao;
	@Autowired
	private UserService userService;


	// 로그인 버튼 누르면 로그인 완료
	@RequestMapping(value = "success", method = RequestMethod.POST)
	public String loginProcess(@RequestParam String user_id, @RequestParam String password,
			@RequestParam(required = false) String chkid, HttpServletRequest request, HttpServletResponse response,
			HttpSession session, RedirectAttributes rattr) {

		String secretpassword = (UserSha256.encrypt(password)); // 비밀번호 암호화
		System.out.println(secretpassword);
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("password", secretpassword);
		System.out.println(map);
		int n = userService.login(map);

		if (n == 1) {
			// 세션 유지 시간을 지정 (기본은 30분)
			session.setMaxInactiveInterval(60 * 60 * 6); // 유지시간이 6시간
			// 아이디와 비번이 맞는 경우 각종 정보를 세션에 저장
			session.setAttribute("user_id", user_id);
			// 로그인한 사람의 이름
			String name = userService.getSearchName(user_id);
			session.setAttribute("loginname", name);
			session.setAttribute("saveid", chkid == null ? "no" : "yes");
			String old_url = request.getHeader("referer");
			return "redirect:" + old_url; // 성공후 이전페이지이동 
		} else {
			// 아이디와 비번이 틀린경우
			String old_url = request.getHeader("referer");
			rattr.addFlashAttribute("loginfail", 1);
			return "redirect:" + old_url;

		}
	}

	@RequestMapping(value = "/out", method = RequestMethod.GET)
	public String logout(HttpSession session,HttpServletRequest request) {
		// 세션에서 loginok 삭제
		session.removeAttribute("user_id");
		session.invalidate(); 
		String old_url = request.getHeader("referer");
		return "redirect:" + old_url;
	}
	 
	@RequestMapping(value = "/kakaologout", method = RequestMethod.GET)
	public String logouts(HttpSession session) {
		// 세션에서 loginok 삭제
		session.invalidate(); 
		
		return "redirect:/" ;
	}

	// 아이디 중복확인
	@GetMapping("/idcheck")
	@ResponseBody
	public int getSearchId(@RequestParam String user_id) {
		return userService.userIdCheck(user_id);
	}
}
	
	
	
