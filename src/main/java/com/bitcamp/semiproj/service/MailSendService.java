package com.bitcamp.semiproj.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.semiproj.dao.UserDao;

public interface MailSendService {
	
		// 이메일 난수 만드는 메서드
		public String getKey(boolean lowerCheck, int size);

		// 회원가입 발송 이메일(인증키 발송)
		@ResponseBody public String mailSendKey(@RequestParam("email") String email);
		
		// 임시비밀번호 발송 
		public void mailSendWithPassword(String user_id, String email, HttpServletRequest request);
}
