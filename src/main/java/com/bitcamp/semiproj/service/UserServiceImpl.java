package com.bitcamp.semiproj.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.bitcamp.semiproj.dao.UserDao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.HashMap;

import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Service;



import com.bitcamp.semiproj.domain.KakaoDto;

import com.bitcamp.semiproj.domain.UserDto;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Service
public class UserServiceImpl  implements UserService{


	@Autowired
	SqlSessionTemplate userSqlSessin;
	@Autowired
	UserDao userdao;

	//회원가입
	@Override
	public int userReg_service(UserDto userdto) {

		int resultCnt = 0;

		try {
			resultCnt=userdao.regUser(userdto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return resultCnt;
	}
	
	//아이디 중복확인
	@Override
	public int userIdCheck(String user_id) {
		userdao = userSqlSessin.getMapper(UserDao.class);
		int num=0;

		num=userdao.getCheckId(user_id);

		return num;
	}
	//이메일 중복확인
	@Override
	public int userEmailCheck(String email) {
		// TODO Auto-generated method stub

		int num=0;

		num=userdao.getCheckEmail(email);
		return num;
	}

	// 사용자 이름 확인
	@Override
	public String getSearchName(String user_id) {
		// TODO Auto-generated method stub

		return userdao.getSearchName(user_id);
	}
	//로그인 확인
	@Override
	public int login(Map<String, String> map) {
		// TODO Auto-generated method stub


		return userdao.login(map);
	}
	//ID 찾기
	@Override
	public String get_searchId(Map<String, String> map) {
		// TODO Auto-generated method stub


		String result ="";
		try {
			result = userdao.getSearchId(map);


		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	//Password 찾기
	@Override
	public String get_searchPassword(Map<String, String> map) {
		// TODO Auto-generated method stub

		return userdao.getSearchPassword(map);
	}
	//임시비밀번호 변경
	@Override
	public void temporaryPassword(Map<String, String> map) {
		// TODO Auto-generated method stub
		userdao.temporaryPassword(map);

	}

	//카카오 토큰 얻기 
	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=1ae5e64fdf23e2e6840b736262379606"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:9005/kakaologin"); // 본인이 설정한 주소

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}


	//카카오 유저정보 얻기
	public KakaoDto getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			
			String password = getKey(false, 6)+"!@";
			String kakao_email ="Kakao"+email;
			Map<String, String> map = new HashMap<>();
			map.put("user_id", "Kakao"+email);
			map.put("password",password);
			map.put("name",nickname);
			map.put("nickname","Kakao"+email);
			map.put("email","Kakao"+email);
			map.put("phone","Kakao");
			map.put("gender","Kakao");
			map.put("birthday","1111-11-11");
			if(userdao.getCheckEmail(kakao_email)==1)
			{
				
			}
			else {
				userdao.snsregUser(map);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		// catch 아래 코드 추가.
		KakaoDto result = userdao.findkakao(userInfo);
		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
		System.out.println("S:" + result);
		if(result==null) {
			// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
		
			userdao.kakaoinsert(userInfo);

			// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
			return userdao.findkakao(userInfo);
			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
			//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
		} else {
			return result;
			// 정보가 이미 있기 때문에 result를 리턴함.
		}

	}
	
	//sns 비번등록을 위한 난수 생성
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
	

}
