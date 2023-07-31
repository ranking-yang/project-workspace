package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@GetMapping(value={"/", ""})
	String main(@SessionAttribute(name = "userId", required = false) String userId, Model model) {
		model.addAttribute("user", userId);
		System.out.println(userId);
		return "main/main";
	}

}
