package com.team.webproject.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.service.LoginService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MypageController {
	
	private final LoginService exService;
	
	@GetMapping("/mypage")
	String main(HttpSession session) {
		try {
			String user = (String)session.getAttribute("userId");
			MembersDTO member = exService.getMember(user);
			if(!user.isEmpty()) {
				if(member.getMember_role().equals("user")) {
					return "/mypage/MyPageMain";
				}
			}
			return "redirect:/login";
		
		}catch (Exception e) {
			return "redirect:/login";
		} 
		
	}
}