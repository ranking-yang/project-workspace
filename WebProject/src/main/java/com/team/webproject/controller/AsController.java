package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/as")
public class AsController {
	
	@GetMapping("/notice")
	String getAsNotice() {
		return "/as/as-notice";
	}
	
	
	@GetMapping("/freq")
	String getAsFreqQuestion() {
		return "/as/as-freq-question";
	}
	
	@GetMapping("/one-on-one")
	String getAsOneOnOne() {
		return "/as/as-one-on-one";
	}
	
}
