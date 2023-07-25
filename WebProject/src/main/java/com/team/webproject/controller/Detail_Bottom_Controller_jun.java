package com.team.webproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class Detail_Bottom_Controller_jun {
	
	
	@GetMapping("/detailBottom")
	String index() {
		
//		model.addAttribute("ex", exService.getAll());
		
		return "/detail/detail_bottom";
	}
	
}
