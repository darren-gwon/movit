package com.bitcamp.semiproj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.semiproj.dao.UserDao;
import com.bitcamp.semiproj.domain.KakaoDto;
import com.bitcamp.semiproj.domain.UserDto;


public interface UserService {
	//회원가입용
	int userReg_service(UserDto userdto);
	//ID중복확인
	int userIdCheck(String user_id);
	//email중복확인
	int userEmailCheck(String email);
	// 이름 찾기
	String getSearchName(String user_id);
	// 로그인용
	int login(Map<String, String> map);
	// id 찾기
	String get_searchId(Map<String, String> map);
	// password 찾기
	String get_searchPassword(Map<String, String> map);
	// 회원 임시 비밀번호 변경 메서드
	void temporaryPassword(Map<String, String> map); 
	//naver 이메일 연결 체크
	Map<String, Object> naverConnectionCheck(Map<String, Object> apiJson);
	Map<String, Object> userNaverLoginPro(Map<String, Object> apiJson);
	int setNaverConnection(Map<String, Object> apiJson);
	// 카카오로그인
	public String getAccessToken(String authorize_code);
	public KakaoDto getUserInfo(String access_Token);
}
