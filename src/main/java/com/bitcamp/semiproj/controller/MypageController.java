package com.bitcamp.semiproj.controller;

import java.util.List;

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

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.InquiryDto;
import com.bitcamp.semiproj.domain.InquiryLostDto;
import com.bitcamp.semiproj.domain.MypageDto;
import com.bitcamp.semiproj.domain.ReviewDto;
import com.bitcamp.semiproj.service.MypageService;
import com.bitcamp.semiproj.service.UserSha256;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService service;
	
	@GetMapping("")
	public String home(HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		MypageDto dto = service.getUserData(user_id);
		model.addAttribute("dto", dto);
		return "mypage/mypagehome.tiles";
	}
	
//	@PostMapping("userCheck")
//	public String userCheck(@RequestParam String password) {
//		return "/mypage/mypageUserInfo";
//	}
	
	@GetMapping("/userInfo")
	public String updateForm(
			Model model, 
			HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
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
		
		return "/mypage/userInfo.tiles";
	}
	
	@PostMapping("/update")
	public String updateMyage(
			@ModelAttribute MypageDto dto,
			@RequestParam String email1,
			@RequestParam String email2,
			@RequestParam String phone1,
			@RequestParam String phone2,
			@RequestParam String phone3
			) {
		dto.setPhone(phone1+"-"+phone2+"-"+phone3);
		dto.setEmail(email1+"@"+email2);
		//System.out.println("email1 = "+email1+", email2 = "+email2);
		System.out.println(dto);
		
		
		service.updateMypage(dto);
		return "redirect:/mypage/";
	}
	
	@GetMapping("/updatePwd")
	public String pwUpdateView() throws Exception{
		return "/mypage/updatePwd.tiles";
	}
	
	@PostMapping("/chkPwd")
	@ResponseBody
	public int pwCheck(
			@ModelAttribute MypageDto dto,
			@RequestParam String currentpwd
			) {
		int result = 0;
		String memberPw = service.pwCheck(dto.getUser_id());
		String cpwd = UserSha256.encrypt(currentpwd);
		
		if(memberPw.equals(cpwd)) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	
	@PostMapping("/updatePwd")
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
		return "redirect:/";
	}
	
	@GetMapping("/delAccount")
	public String deleteAccountView() {
		return "/mypage/delAccount.tiles";
	}
	
	@PostMapping("/delAccount")
	public String deleteAccount(String user_id, HttpSession session) {
		service.deleteAccount(user_id);
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/chkNickname")
	@ResponseBody
	public int checkNickName(String nickname) {
		int result = service.checkNickName(nickname);
		System.out.println("result = "+result);
		System.out.println("nickname = "+nickname);
		return result;
	}
	
	@GetMapping("/myReview")
	public String userReviewList(HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		MypageDto dto = service.getUserData(user_id);
		model.addAttribute("dto", dto);
		List<ReviewDto> list = service.getUserReviewList(user_id);
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		return "/mypage/myReview.tiles";
	}
	
	@GetMapping("/myInquiry")
	public String userInquiryList(HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		MypageDto dto = service.getUserData(user_id);
		model.addAttribute("dto", dto);
		List<InquiryDto> list = service.getUserInquiry(user_id);
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		return "/mypage/myInquiry.tiles";
	}
	
	@GetMapping("/myLostInquiry")
	public String userLostInquiryList(HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		MypageDto dto = service.getUserData(user_id);
		model.addAttribute("dto", dto);
		List<InquiryLostDto> list = service.getUserLost(user_id);
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		return "/mypage/myLostInquiry.tiles";
	}
	
	@GetMapping("/myWatchList")
	public String myMovieList(HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		MypageDto dto = service.getUserData(user_id);
		model.addAttribute("dto", dto);
		List<BookingDto> list = service.myMovieList(user_id);
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		return "/mypage/myWatchList.tiles";
	}
}
