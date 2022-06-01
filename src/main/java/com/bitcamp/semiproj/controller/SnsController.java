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
		
		session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("loginname", kakaodto.getK_name());
		session.setAttribute("user_id", "Kakao_"+kakaodto.getK_email());
		session.setAttribute("kakaoN", kakaodto.getK_name());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
		
		
		return "redirect:/";
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
		 * 없는 페이지를 넣어도 무방합니다.
		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
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
		
		result= userdao.findnaver(naver);
		session.setAttribute("oauthToken", oauthToken);
		} catch(Exception e) {
			return "redirect:/";
		}
		if(result==null) {
			// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
			userdao.naverinsert(naver);
			
			result=userdao.findnaver(naver);
			session.setAttribute("loginname",result.getN_name());
			session.setAttribute("user_id", "Naver_"+result.getN_email());

			return "redirect:/";
		} else {
			session.setAttribute("loginname", result.getN_name());
			session.setAttribute("user_id", "Naver_"+result.getN_email());
			return "redirect:/";
		}	
   
    }	
  

}