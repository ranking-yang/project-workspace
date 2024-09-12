package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PathController {
	
	@GetMapping("/")
	public String path() {
		return "redirect:/main";
	}
	
}
