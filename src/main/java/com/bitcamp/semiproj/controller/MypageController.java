package com.bitcamp.semiproj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitcamp.semiproj.domain.MypageDto;
import com.bitcamp.semiproj.service.MypageService;
import com.bitcamp.semiproj.service.UserSha256;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService service;
	
	@GetMapping("/home")
	public String home(HttpSession session) {
		session.setAttribute("user_id", "gimzee");
		return "mypage/mypagehome.tiles";
	}
	
	@PostMapping("userCheck")
	public String userCheck(@RequestParam String password) {
		return "/mypage/mypageUserInfo";
	}
	
	@GetMapping("/mypageUserInfo")
	public String updateForm(
			Model model, 
			HttpSession session) {
		
		String user_id = (String)session.getAttribute("user_id");
		
		System.out.println("user_id = "+user_id);
		MypageDto dto = service.getUserData(user_id);
		model.addAttribute("dto", dto);
		
		//생년월일
		String [] birthday = dto.getBirthday().split("-");
		String birthday1 = birthday[0];
		String birthday2 = birthday[1];
		String birthday3 = birthday[2];
		model.addAttribute("birthday1", birthday1);
		model.addAttribute("birthday2", birthday2);
		model.addAttribute("birthday3", birthday3);
		
		//휴대전화
		String [] phone = dto.getPhone().split("-");
		String phone1 = phone[0];
		String phone2 = phone[1];
		String phone3 = phone[2];
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		
		//이메일
		String [] email = dto.getEmail().split("@");
		String email1 = email[0];
		String email2 = email[1];
		model.addAttribute("email1", email1);
		model.addAttribute("email2", email2);
		
		return "/mypage/updateUserInfo";
	}
	
	@PostMapping("/updateMypage")
	public String updateMyage(
			@ModelAttribute MypageDto dto,
			@RequestParam String email1,
			@RequestParam String email2,
			@RequestParam String phone1,
			@RequestParam String phone2,
			@RequestParam String phone3,
			@RequestParam String currentpwd,
			@RequestParam String changepwd1,
			@RequestParam String changepwd2
			) {
		dto.setPhone(phone1+"-"+phone2+"-"+phone3);
		dto.setEmail(email1+"@"+email2);
		//System.out.println("email1 = "+email1+", email2 = "+email2);
		//System.out.println(dto);
		
		
		service.updateMypage(dto);
		return "/mypage/mypageupdatesuccess";
	}
	
	@GetMapping("/pwUpdateView")
	public String pwUpdateView() throws Exception{
		return "/mypage/changepassword";
	}
	
	@PostMapping("/pwCheck")
	@ResponseBody
	public int pwCheck(
			@ModelAttribute MypageDto dto,
			@RequestParam String currentpwd
			) {
		int result = 0;
		String memberPw = service.pwCheck(dto.getUser_id());
		System.out.println("user_id = "+dto.getUser_id());
		String cpwd = UserSha256.encrypt(currentpwd);
		System.out.println("currentpwd = "+currentpwd);
		System.out.println("memberPw = "+memberPw+", cpwd = "+cpwd);
		
		if(memberPw.equals(cpwd)) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	
	@PostMapping("/pwUpdate")
	@ResponseBody
	public String pwUpdate(
			@RequestParam String user_id,
			@RequestParam String changepwd1,
			RedirectAttributes rttr,
			HttpSession session
			) {
		String hashedPw = UserSha256.encrypt(changepwd1);
		System.out.println("hashedPw = "+hashedPw+", changepwd1 = "+changepwd1+", user_id = "+user_id);
		service.pwUpdate(user_id, hashedPw);
		//session.invalidate();
		//rttr.addFlashAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
		//로그인화면으로 나중에 전환필요
		return "redirect:home";
	}
}
