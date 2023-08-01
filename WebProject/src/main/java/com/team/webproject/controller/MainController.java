package com.team.webproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.cookie.Cookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@GetMapping(value={"/", ""})
	String main(@SessionAttribute(name = "userId", required = false) String userId, Model model, HttpServletRequest request) {
		
		model.addAttribute("user", userId);
		System.out.println(userId);
		return "main/main";
	}

}
