package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/test/security")
	public void security() {
		
	}
}
