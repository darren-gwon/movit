package com.bitcamp.semiproj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import java.sql.SQLException;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.bitcamp.semiproj.dao.UserDao;
import com.bitcamp.semiproj.domain.KakaoDto;
import com.bitcamp.semiproj.domain.NaverDto;
import com.bitcamp.semiproj.domain.NaverLoginBO;
import com.bitcamp.semiproj.domain.UserDto;
import com.bitcamp.semiproj.service.UserService;
import com.bitcamp.semiproj.service.UserSha256;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;




@Controller
public class SnsController {
	
	 @Autowired
	 private UserService userService;
	 
	 @Autowired
	 private HttpSession session;

	 private KakaoDto kakaodto;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/kakaologin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		String access_Token = userService.getAccessToken(code);
	    
		// userInfo의 타입을 KakaoDTO로 변경 및 import.
		
		kakaodto = userService.getUserInfo(access_Token);
		// 아래 코드가 추가되는 내용
		Map<String, String> map =new HashMap<>();
		map.put("email", kakaodto.getK_email());
		map.put("name", kakaodto.getK_name());
		String getuser_id=userService.get_searchId(map);
		if(getuser_id==null) {
			session.setAttribute("kakao_id",kakaodto.getK_email());
			session.setAttribute("email",kakaodto.getK_email());
			session.setAttribute("name", kakaodto.getK_name());
			return "/userReg/kakaouserReg.tiles";
		}
		else {
		session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("loginname", kakaodto.getK_name());
		session.setAttribute("user_id", getuser_id); 
		session.setAttribute("kakaoN", kakaodto.getK_name());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		
		return "redirect:/";
		}
		
	}
	//카카오 유저 회원가입 
	@RequestMapping(value="/kakaoreg", method=RequestMethod.POST)
	public String UserRegPass(UserDto userdto,@RequestParam("birthday") String birthday,@RequestParam("nickname") String nickname, 
			@RequestParam("gender") String gender, @RequestParam("phone") String phone){
			String Password=userService.getKey(false, 6)+"!";
			String keypassword = UserSha256.encrypt(Password);
			Map<String, Object> map= new HashMap<>();
			map.put("user_id",session.getAttribute("kakao_id"));
			map.put("password",keypassword); //임의의 값 
			map.put("email",session.getAttribute("email"));
			map.put("name",session.getAttribute("name"));
			map.put("birthday", birthday);
			map.put("nickname", nickname);
			map.put("gender", gender);
			map.put("phone", phone);
			userService.snsReg(map);
			
			session.invalidate();
			session.setAttribute("user_id",map.get("user_id"));
			session.setAttribute("kakaoN","kakao");
			
			return "redirect:/";
		}
		



    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult="";
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
 
    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/naver", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
 
        /* 생성한 인증 URL을 View로 전달 */
        return "redirect:"+naverAuthUrl;
    }
 
    
    @Autowired
    UserDao userdao;
    // naver 유저 회원가입 및 회원확인하여 로그인
    @RequestMapping(value="/naverlogin",  method = {RequestMethod.GET,RequestMethod.POST})
	public String userNaverLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		NaverDto result ;
		HashMap<String, Object> naver;
		OAuth2AccessToken oauthToken;

		oauthToken = naverLoginBO.getAccessTokens(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		try {
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		ObjectMapper objectMapper =new ObjectMapper();
		
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		naver = new HashMap<String, Object>();
		naver.put("n_email",apiJson.get("email"));
		naver.put("n_phone",apiJson.get("mobile"));
		naver.put("n_gender",apiJson.get("gender"));
		naver.put("n_birthday",apiJson.get("birthday")); 
		naver.put("n_nickname",apiJson.get("nickname"));
		naver.put("n_name",apiJson.get("name"));
		naver.put("n_birthyear",apiJson.get("birthyear"));
		
		//네이버 회원정보확인
		result= userdao.findnaver(naver);
		System.out.println(naver);
		//세션에 토큰 저장 
		session.setAttribute("oauthToken", oauthToken);
		} catch(Exception e) {
			return "redirect:/";
		}
		if(result==null) {
			// result가 null이면 NAVER 정보가 저장이 안되있는거므로 정보를 저장.
			userdao.naverinsert(naver);
		}
		//회원등록된 이메일 체크
		result= userdao.findnaver(naver);
		Map<String, String> map =new HashMap<>();
		map.put("email", result.getN_email());
		map.put("name", result.getN_name());
		
		String getuser_id=userService.get_searchId(map);
		System.out.println(getuser_id);
		//회원 등록된 이메일이 없으면 naver로 자동회원가입
		if(getuser_id==null) {
			
			String naveruser_id=result.getN_email();
			String Password=userService.getKey(false, 6)+"!";
			String keypassword = UserSha256.encrypt(Password);
			String genderchk=result.getN_gender();
			String birthday;
			if(result.getN_birthyear()!=null) {
			String bitrhyear=result.getN_birthyear();
			birthday=bitrhyear+"-"+result.getN_birthday();
			}else {
			birthday="1993-"+result.getN_birthday();
			}
			if(genderchk.equals("M"))
			{
				genderchk="남자";
			}
			else {
				genderchk="여자";
			}			
		
			Map<String, Object> add=new HashMap<>();
			add.put("user_id", naveruser_id);
			add.put("password", keypassword);
			add.put("name",result.getN_name());
			add.put("nickname",result.getN_nickName());
			add.put("gender",genderchk);
			add.put("phone",result.getN_phone());
			add.put("email",result.getN_email());
			add.put("birthday",birthday);
			userService.snsReg(add);
			session.setAttribute("loginname",add.get("name"));
			session.setAttribute("user_id", add.get("user_id"));
			return "redirect:/";
			}
		//회원 등록된 일치하는 이메일 있으면 해당 ID로 로그인.
		else {	
		session.setAttribute("loginname", result.getN_name());
		session.setAttribute("user_id", getuser_id);
		return "redirect:/";
		}

		} 

    }