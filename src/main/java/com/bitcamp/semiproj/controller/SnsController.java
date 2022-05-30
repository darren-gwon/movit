package com.bitcamp.semiproj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.semiproj.domain.KakaoDto;
import com.bitcamp.semiproj.domain.NaverDto;
import com.bitcamp.semiproj.service.UserService;

@Controller
public class SnsController {
	
	 @Autowired
	 private UserService userService;
	 
	 @Autowired
	 private HttpSession session;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/kakaologin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		String access_Token = userService.getAccessToken(code);
	    
		// userInfo의 타입을 KakaoDTO로 변경 및 import.
		
		KakaoDto userInfo = userService.getUserInfo(access_Token);
		// 아래 코드가 추가되는 내용
		session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("loginname", userInfo.getK_name());
		session.setAttribute("user_id", userInfo.getK_email());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		
		
		return "redirect:/";
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
		 * 없는 페이지를 넣어도 무방합니다.
		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
	}
	@RequestMapping(value="/naverlogin", method=RequestMethod.GET)
	public String callBack(){
		return "user/navercallback";
	}
	@RequestMapping(value="naverSave", method=RequestMethod.POST)
	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName) {

	NaverDto naver = new NaverDto();
	naver.setN_age(n_age);
	naver.setN_birthday(n_birthday);
	naver.setN_email(n_email);
	naver.setN_gender(n_gender);
	naver.setN_id(n_id);
	naver.setN_name(n_name);
	naver.setN_nickName(n_nickName);
    
	// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
	String result = "no";
    
	if(naver!=null) {
		// naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
		result = "ok";
	}

	return result;
    
	}
		

}