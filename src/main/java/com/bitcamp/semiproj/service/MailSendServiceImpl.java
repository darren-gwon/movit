package com.bitcamp.semiproj.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.semiproj.dao.UserDao;

@Service
public class MailSendServiceImpl implements MailSendService{
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private UserDao userdao;
	


	
	// 이메일 난수 만드는 메서드
	@Autowired
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}


	// 난수를 이용한 키 생성
	
	private boolean lowerCheck;
	
	private int size;


	@Override
	public String getKey(boolean lowerCheck, int size) {
		// TODO Auto-generated method stub
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}




	//회원가입 인증 이메일 보내는 메서드
	@Override
	@ResponseBody public String mailSendKey(@RequestParam("email") String email) {
		int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000); 
		String from = "bitgwang1215@gmail.com";//보내는 이 메일주소 
		String to = email; 
		String title = "안녕하세요. ;Movit  입니다. 고객님의 필요한 인증번호 입니다."; 
		String content = " 안녕하세요 ;Movit 입니다.<br/>[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오."; 
		String num = ""; 
		try { 
			MimeMessage mail = mailSender.createMimeMessage(); 
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8"); 
			mailHelper.setFrom(from); mailHelper.setTo(to); mailHelper.setSubject(title); 
			mailHelper.setText(content, true); 
			mailSender.send(mail); 
			num = Integer.toString(serti); 
			} 
		catch(Exception e) {
			num = "error";
		
			} 
		return num; 
		}
	
	@Override
	public void mailSendWithPassword(String user_id, String email, HttpServletRequest request) {
		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다

		String password = getKey(false, 6);
		password +="A!";
		userdao = sqlSession.getMapper(UserDao.class);
		
		// 회원 이름 꺼내는 코드
		String name = userdao.getSearchName(user_id);
				
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 ;Movit입니다.</h2><br><h2>'"+ name +"'("+user_id+") 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + password +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost:9001/semiproj/'> ;Movit:p 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[;Movit] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		// 비밀번호 암호화해주는 메서드
		String keypassword = UserSha256.encrypt(password);
		
		Map<String, String> map =new HashMap<>();
		map.put("user_id",user_id);
		map.put("email",email);
		map.put("password", keypassword);
		// 데이터 베이스 값은 암호한 값으로 저장시킨다.
		userdao.temporaryPassword(map);
		
		
	}
	
	
	}


